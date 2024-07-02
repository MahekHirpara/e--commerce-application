import 'package:e_commerce_app/common/widget_login_sing_up/success.dart';
import 'package:e_commerce_app/data/repositories/authentication_repo.dart';
import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/controller/product/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/controller/address/address_controller.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../common/widget/loaders/processing_loader.dart';
import '../../../../data/repositories/product/order_repo.dart';
import '../../../../navigation_menu.dart';
import '../../modal/order_modal.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = Get.put(CartController());
  final addressController = Get.put(AddressController());
  final checkoutController = Get.put(CheckOutController());
  final orderRepo = Get.put(OrderRepo());
   final Razorpay _razorpay = Razorpay() ;

double _totalamount = 0.0;
  @override
  void onInit(){
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

  @override
  void onClose(){
    super.onClose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async{
    try{
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModal(
        id: UniqueKey().toString(),
        status: OrderStatus.processing,
        items: cartController.cartItems.toList(),
        totalAmount: _totalamount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddresses.value,
        deliveryDate: DateTime.now(),
        userId: userId,
      );

      await orderRepo.saveOrder(order, userId);
      cartController.clearCart();
      Get.off(() => SuccessScreen(
          image: EImages.onBoardingImage1,
          title: 'Payment Success',
          subTitle: 'Your item will be shipped soon!',
          onpressed: () => Get.offAll(() => const NavigationMenu())));
    }catch (e){
      ELoaders.errorSnackBar(title: 'Order Error', message: e.toString());
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ELoaders.errorSnackBar(title: 'Payment Failed', message: response.message ?? 'Unknown error');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ELoaders.errorSnackBar(title: 'External Wallet', message: 'External wallet selected');
  }

  //Fetch user's history
  Future<List<OrderModal>> fetchUserOrder() async {
    try {
      final userOrder = await orderRepo.fetchUserOrder();
      return userOrder;
    } catch (e) {
      ELoaders.warnigSnackBar(title: 'On snap!', message: e.toString());
      return [];
    }
  }
  //add method for order processing
 void processOrder(double totalAmount) async{
    try{
      ProcessingLoader.openLoadingDialog('Processing your Order');
     _totalamount = totalAmount;
      if(checkoutController.selectedPaymentMethod.value.name == 'Paypal'){
        var options = {
          'key': 'rzp_test_hMOviyZ7tun2lG',
          'amount': (totalAmount * 100).toStringAsFixed(2),
          'name': 'E-Store',
          'description': 'razor pay',
          'prefill': {
            'contact':AuthenticationRepo.instance.authUser!.phoneNumber,
            'email':AuthenticationRepo.instance.authUser!.email,
          },
          'external': {
            'wallets': ['paytm']
          }
        };
        try{
          _razorpay.open(options);
        }catch(e){
          ELoaders.errorSnackBar(title: 'rezorpay Error', message: e.toString());
        }

      }else{
        final userId = AuthenticationRepo.instance.authUser!.uid;
        if(userId.isEmpty) return;

        final order = OrderModal(
          id: UniqueKey().toString(),
          status: OrderStatus.processing,
          items: cartController.cartItems.toList(),
          totalAmount:double.parse(totalAmount.toStringAsFixed(2)),
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddresses.value,
          deliveryDate: DateTime.now(),
          userId: userId,
        );



        await orderRepo.saveOrder(order, userId);

        cartController.clearCart();


        Get.off(() => SuccessScreen(image: EImages.onBoardingImage1, title: 'Payment Success', subTitle: 'Your item will be shipped soon!', onpressed: ()=> Get.offAll(()=> const NavigationMenu())));
      }

    }catch(e){
      ELoaders.errorSnackBar(title: 'Oh snap!' ,message: e.toString());
    }
 }
}

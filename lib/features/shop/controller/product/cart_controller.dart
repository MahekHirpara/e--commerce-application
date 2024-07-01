
import 'package:e_commerce_app/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_app/features/shop/modal/cart_item_modal.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModal> cartItems = <CartItemModal>[].obs;
  final variationController = Get.put(VariationController());
  
  CartController(){
    loadCartItems();
  }
  //add items to cart
  void addCart(ProductModal product) {
    //Quantity Check
    if (productQuantityInCart.value < 1) {
      ELoaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      ELoaders.customToast(message: 'Select Variation');
      return;
    }

    //out of stock status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        ELoaders.warnigSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        ELoaders.warnigSnackBar(
            title: 'Oh Snap!', message: 'Selected Product is out of stock');
        return;
      }
    }

    //product-Modal to CartModal
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    //check if already added
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productTid == selectedCartItem.productTid &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      //this quantity is alreaddy added or updates/remove from design
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    ELoaders.successSnackBar(
        title: 'Product is added', message: 'Ypor poduct is added to yur cart');
  }

  //Convert Product modal to Cart modal

  CartItemModal convertToCartItem(ProductModal product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //reset Variation in case of single productType
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModal(
      productTid: product.id,
      quantity: quantity,
      title: product.title,
      price: price,
      variationId: variation.id,
      images: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValue : null,
    );
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemString = cartItems.map((item) => item.toJson()).toList();
    ELocalStorage.instance().saveData('cartItems', cartItemString);
  }

  //load cart Items
  void loadCartItems() {
    final cartItemStrings =
        ELocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModal.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productTid == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productTid == productId && item.variationId == variationId,
        orElse: () => CartItemModal.empty(),
    );
    return foundItem.quantity;
  }
  
  void clearCart(){
    productQuantityInCart.value =0;
    cartItems.clear();
    updateCart();
  }
  
  void addOneToCart(CartItemModal item){
    int index = cartItems.indexWhere((items) => items.productTid == item.productTid && items.variationId == item.variationId);
    
    if(index >=0){
      cartItems[index].quantity +=1;
    }else{
      cartItems.add(item);
    }
    
    updateCart();
  }

  void removeOneFromCart(CartItemModal item){
    int index = cartItems.indexWhere((items) => items.productTid == item.productTid && items.variationId == item.variationId);

    if(index >=0){
      if(cartItems[index].quantity >1){
        cartItems[index].quantity -=1;
      }else{
        cartItems[index].quantity==1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      
    }

    updateCart();
  }

  removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product',
      onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        ELoaders.customToast(message: 'Product remove from cart item');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModal product){
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value=0;
      }
    }
  }
}

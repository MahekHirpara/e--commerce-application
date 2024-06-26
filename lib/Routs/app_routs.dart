import 'package:e_commerce_app/Routs/routs.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/on_boarding_screens/onbording.dart';
import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/singup.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/verify_email.dart';
import 'package:e_commerce_app/features/shop/screen/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screen/checkout/checkout.dart';
import 'package:e_commerce_app/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/features/shop/screen/order/order.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/address.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/profile/profile_sc.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/setting/setting.dart';
import 'package:e_commerce_app/features/shop/screen/product_review/product_review.dart';
import 'package:e_commerce_app/features/shop/screen/wishlist/wishlist.dart';
import 'package:get/get.dart';

import '../features/shop/screen/store/store.dart';

class AppRouts{
  static final pages = [
    GetPage(name: ERouts.home, page: ()=>const HomeScreen()),
    GetPage(name: ERouts.store, page: ()=>const Store()),
    GetPage(name: ERouts.favourites, page: ()=>const FavouriteScreen()),
    GetPage(name: ERouts.settings, page: ()=>const SettingScreen()),
    GetPage(name: ERouts.productReviews, page: ()=>const EProductReview()),
    GetPage(name: ERouts.order, page: ()=>const OrderScreen()),
    GetPage(name: ERouts.checkout, page: ()=>const CheckoutScreen()),
    GetPage(name: ERouts.cart, page: ()=>const CartScreen()),
    GetPage(name: ERouts.userProfile, page: ()=>const ProfileScreen()),
    GetPage(name: ERouts.userAddress, page: ()=>const UserAddressScreen()),
    GetPage(name: ERouts.signup, page: ()=>const SingUpScreen()),
    // GetPage(name: ERouts.verifyEmail, page: ()=>const VerifyEmailScreen(email: email)),
    GetPage(name: ERouts.signIn, page: ()=>const LoginScreen()),
    GetPage(name: ERouts.forgetPassword, page: ()=>const ForgetPassword()),
    GetPage(name: ERouts.oBoarding, page: ()=>const OnBoardingScreen()),



  ];
}
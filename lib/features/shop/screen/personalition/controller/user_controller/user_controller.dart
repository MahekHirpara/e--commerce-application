import 'package:e_commerce_app/data/repositories.authentication/authentication_repo.dart';
import 'package:e_commerce_app/data/repositories.authentication/user_repo/user_repository.dart';
import 'package:e_commerce_app/features/authentication/modals/user_modal/user_modal.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/constant/image_string.dart';
import '../../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../authentication/conroller/network_manager.dart';
import '../../screens/profile/widget/re_auth_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModal> user = UserModal.empty().obs;
  final profileLoading = false.obs;
  final imageUpload = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepo = Get.put(UserRepo());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //conver name to first and last name
          final nameParts =
              UserModal.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModal.generateUserName(
              userCredential.user!.displayName ?? '');

          final user = UserModal(
            email: userCredential.user!.email ?? '',
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          //Save user data
          await userRepo.saveUserData(user);
        }
      }
    } catch (e) {
      ELoaders.warnigSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong ehile saving your information.You can re-save your data in your Profile');
    }
  }

  //Fetch User Data
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModal.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Delete Account Waring
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(ESize.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently?this account is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: ESize.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: const Text('Cancel')));
  }

  //Delete Account
  void deleteUserAccount() async {
    try {
      //Re-authenticate user
      final auth = AuthenticationRepo.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          EFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          EFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //re Authentication Email and password
  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Processing', EImages.onBoardingImage1);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      //validation
      // if (!reAuthFormKey.currentState!.validate()) {
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      await AuthenticationRepo.instance.reAuthenticateEmailAndPasswordUser(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepo.instance.deleteAccount();
      EFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Upload Image
  uploadUserProfile() async {
    try {
      imageUpload.value= true;
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl =
            await userRepo.uploadImage('Users/Images/Profile/', image);
        user.refresh();

        //Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepo.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        ELoaders.successSnackBar(
            title: 'Congratulation',
            message:
            'Profile photo has been updated');
      }
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      imageUpload.value=false;
    }
  }
}

import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/image/circularImage.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/profile/widget/profile_menu.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/user_controller/user_controller.dart';
import 'change_name.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const EAppBar(
        showBackArrow: true,
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //profile pic
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                    () {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : EImages.user;
                      return controller.imageUpload.value? const EShimmerEffect(width: 80, height: 80):
                            ECircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                        }
                    ),
                    TextButton(
                      onPressed: () {
                        controller.uploadUserProfile();
                      },
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              //details

              const SizedBox(height: ESize.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: ESize.spaceBtwItems,),
              const ESectionHeading(text: 'Profile information',showActionbutton: false,),
              const SizedBox(height: ESize.spaceBtwItems,),

              EProfileMenu(value: controller.user.value.fullName,title:'Name', onPress: () { Get.to(()=> const ChangeName()); } ,),
              EProfileMenu(value: controller.user.value.email,title:'Username', onPress: () {  } ,),

              const SizedBox(height: ESize.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: ESize.spaceBtwItems,),

              const ESectionHeading(text: 'Personal information',showActionbutton: false,),
              const SizedBox(height: ESize.spaceBtwItems,),

              EProfileMenu(value: controller.user.value.id,title:'User Id', onPress: () {  } ,),
              EProfileMenu(value: controller.user.value.phoneNumber,title:'Phone Number', onPress: () {  } ,),
              EProfileMenu(value: controller.user.value.email,title:'E-mail', onPress: () {  } ,),
              EProfileMenu(value: 'Female',title:'Gender', onPress: () {  } ,),
              EProfileMenu(value: '12-feb-2000',title:'Dob', onPress: () {  } ,),

              const Divider(),
              const SizedBox(height: ESize.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: (){
                    controller.deleteAccountWarningPopup();
                  },
                  child: const Text('Close Account',style: TextStyle(color: Colors.red),),
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}



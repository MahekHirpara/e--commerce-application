import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/image/circularImage.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/profile/widget/profile_menu.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const ECircularImage(
                      image: EImages.promo1,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {},
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

              EProfileMenu(value: 'Mahek',title:'Name', onPress: () {  } ,),
              EProfileMenu(value: 'Mahek_hirpara',title:'Username', onPress: () {  } ,),

              const SizedBox(height: ESize.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: ESize.spaceBtwItems,),

              const ESectionHeading(text: 'Personal information',showActionbutton: false,),
              const SizedBox(height: ESize.spaceBtwItems,),

              EProfileMenu(value: '3456',title:'User Id', onPress: () {  } ,),
              EProfileMenu(value: '14354677',title:'Phone Number', onPress: () {  } ,),
              EProfileMenu(value: 'mahek@gmail.com',title:'E-main', onPress: () {  } ,),
              EProfileMenu(value: 'Female',title:'Gender', onPress: () {  } ,),
              EProfileMenu(value: '12-feb-2000',title:'Dob', onPress: () {  } ,),

              const Divider(),
              const SizedBox(height: ESize.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: (){},
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



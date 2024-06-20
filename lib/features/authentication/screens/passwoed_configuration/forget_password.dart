import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:const EdgeInsets.all(ESize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headline
            Text('Forget Password',style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: ESize.spaceBtwItems,),
            Text(EText.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: ESize.spaceBtwSection,),
          //Text field
            TextFormField(
              decoration:const InputDecoration(
                labelText: EText.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: ESize.spaceBtwSection,),

            //submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>const ResetPassword());
                },
                child:const Text('Submit'),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

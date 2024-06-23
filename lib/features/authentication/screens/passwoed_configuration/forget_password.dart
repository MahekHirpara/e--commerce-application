import 'package:e_commerce_app/features/authentication/conroller/forget_controller/forget_password_controller.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                decoration:const InputDecoration(
                  labelText: EText.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
                validator: (value) => EValidator.emailValidation(value!),
              ),
            ),
            const SizedBox(height: ESize.spaceBtwSection,),

            //submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 controller.sendPasswordResendEmail();
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

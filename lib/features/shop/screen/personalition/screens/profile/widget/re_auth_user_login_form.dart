import 'package:e_commerce_app/features/shop/screen/personalition/controller/user_controller/user_controller.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/constant/text.dart';

class ReAuthUserLoginForm extends StatelessWidget {
  const ReAuthUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title:   const Text('Re-AuthenticateUser'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: EText.email,
                  ),
                  // validator: (value) => EValidator.emailValidation(value!),
                ),
                const SizedBox(
                  height: ESize.spaceBtwInputField,
                ),
                Obx(
                      () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    decoration:  InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: EText.password,
                        suffixIcon: IconButton(onPressed: (){
                          controller.hidePassword.value = !controller.hidePassword.value;
                        },icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),)
                    ),
                    // validator: (value) => EValidator.passwordValidation(value!),
                  ),
                ),
                const SizedBox(height: ESize.spaceBtwSection),

                //buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
controller.reAuthEmailAndPasswordUser();
                    },
                    child: const Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/features/authentication/conroller/login/login_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/singup.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/constant/text.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ESize.spaceBtwSection),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: EText.email,
              ),
              validator: (value) => EValidator.emailValidation(value!),
            ),
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: EText.password,
                  suffixIcon: IconButton(onPressed: (){
                    controller.hidePassword.value = !controller.hidePassword.value;
                  },icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),)
                ),
                validator: (value) => EValidator.passwordValidation(value!),
              ),
            ),
            const SizedBox(
              height: ESize.spaceBtwInputField / 2,
            ),
            //remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Obx(
                      ()=> Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = !controller.rememberMe.value;
                        },
                      ),
                    ),
                    const Text(EText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(()=> const ForgetPassword());
                  },
                  child: const Text(EText.forgotePassword),
                ),
              ],
            ),
            const SizedBox(height: ESize.spaceBtwSection),

            //buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 controller.emailAndPasswordSingIn();
                },
                child: const Text(EText.singIn),
              ),
            ),
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Get.to(const SingUpScreen());
                },
                child: const Text(EText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
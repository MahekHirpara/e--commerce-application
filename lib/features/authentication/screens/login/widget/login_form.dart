import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/singup.dart';
import 'package:e_commerce_app/navigation_menu.dart';
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
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ESize.spaceBtwSection),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: EText.email,
              ),
            ),
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: EText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
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
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
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
                  Get.to(()=>const NavigationMenu());
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
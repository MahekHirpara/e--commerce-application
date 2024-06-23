
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/constant/text.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../../../utils/validators/validation.dart';
import '../../conroller/singup_controller/singup_controller.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
    final dark = EHelperFunction.isDarkMode(context);
    return Form(
      key: controller.singupFormKey,
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Column(
          children: [
            //First & last name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: EText.fistName,
                    ),
                    validator: (value) {
                      EValidator.validationEmptyText('First name', value!);
                      EValidator.nameValidation(value);
                    }
                  ),
                ),
                const SizedBox(
                  width: ESize.spaceBtwInputField,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: EText.lastName,
                    ),
                    validator: (value) {
                      EValidator.validationEmptyText('Last name', value!);
                      EValidator.nameValidation(value);
                }
                  ),
                ),
              ],
            ),
            //username
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            TextFormField(
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: EText.username,
              ),
              validator: (value) {
                EValidator.validationEmptyText('User Name', value!);

              }
            ),
            //email
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            TextFormField(
              controller: controller.email,
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: EText.email,
              ),
              validator: (value) {

              EValidator.emailValidation(value!);
              }
            ),
            //phone number
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: EText.phoneNo,
              ),
              validator: (value) {
                EValidator.validationEmptyText('phone number', value!);
                EValidator.phoneValidation(value);
              }
            ),
            //password
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),

            Obx(
              () => TextFormField(
                controller: controller.password,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                  labelText: EText.password,
                ),
                validator: (value) {
                  EValidator.validationEmptyText('Password', value!);
                  EValidator.passwordValidation(value);
                }
              ),
            ),
            const SizedBox(
              height: ESize.spaceBtwInputField,
            ),

            //Terms&conditions checkbox
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(
                    () => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) {
                        controller.privacyPolicy.value = !controller.privacyPolicy.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: ESize.spaceBtwItems,
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: EText.iAgreeTo,
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: EText.privacyPolicy,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: dark ? EColors.white : EColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? EColors.white : EColors.primary)),
                    TextSpan(
                        text: ' and ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: EText.termsOfUse,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: dark ? EColors.white : EColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? EColors.white : EColors.primary)),
                  ]),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              ],
            ),
            //singup button
            const SizedBox(
              height: ESize.spaceBtwSection,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.singUp();
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

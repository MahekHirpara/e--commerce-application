import 'package:e_commerce_app/features/authentication/screens/singup/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/constant/text.dart';
import '../../../../utils/helper/helper_function.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Form(
      child: Padding(
        padding: EdgeInsets.all(0.8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: EText.fistName,
                    ),
                  ),
                ),
                const SizedBox(width: ESize.spaceBtwInputField,),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: EText.lastName,
                    ),
                  ),
                ),
              ],
            ),
            //username
            const SizedBox(height: ESize.spaceBtwInputField,),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: EText.username,
              ),
            ),
            //email
            const SizedBox(height: ESize.spaceBtwInputField,),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: EText.email,
              ),
            ),
            //phone number
            const SizedBox(height: ESize.spaceBtwInputField,),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: EText.phoneNo,
              ),
            ),
            //password
            const SizedBox(height: ESize.spaceBtwInputField,),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: EText.password,
              ),
            ),
            const SizedBox(height: ESize.spaceBtwInputField,),

            //Terms&conditions checkbox
            Row(
              children: [
                SizedBox(
                  width:24,
                  height: 24,
                  child: Checkbox(value: true, onChanged: (value){

                  }),
                ),
                const SizedBox(width: ESize.spaceBtwItems,),
                Text.rich(
                    TextSpan(
                    children: [
                      TextSpan(text:'${EText.iAgreeTo}',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text:'${EText.privacyPolicy}',style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: dark ? EColors.white : EColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? EColors.white : EColors.primary
                      )),
                      TextSpan(text:' and ',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text:'${EText.termsOfUse}',style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: dark ? EColors.white : EColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? EColors.white : EColors.primary
                      )),
                    ]
                ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              ],
            ),
            //singup button
            const SizedBox(height: ESize.spaceBtwSection,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>VerifyEmailScreen());
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
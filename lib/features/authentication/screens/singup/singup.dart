import 'package:e_commerce_app/common/widget_login_sing_up/form_divider.dart';
import 'package:e_commerce_app/common/widget_login_sing_up/social_buttons.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/singup_form.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(ESize.defaultSpace),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               //Title
               Text('Let\'s create your account',style: Theme.of(context).textTheme.headlineMedium,),
               const SizedBox(height: ESize.spaceBtwSection,),
               //Form
               const SingUpForm(),
               //divider
               const SizedBox(height: ESize.spaceBtwInputField,),
               FormDivider(dividerText: EText.orSinginWith.capitalize!),
               const SizedBox(height: ESize.spaceBtwSection,),
               //footer
               const SocialButtons(),
             ],
           ),
        ),
      ),
    );
  }
}



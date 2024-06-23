import 'package:e_commerce_app/common/style/spacing_style.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widget/login_form.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widget/login_header.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget_login_sing_up/form_divider.dart';
import '../../../../common/widget_login_sing_up/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpasingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              LoginHeader(dark: dark),
              const LoginForm(),
              //divider
              FormDivider(dividerText: EText.orSinginWith.capitalize!,),
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








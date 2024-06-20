import 'package:flutter/material.dart';

import '../../utils/constant/color.dart';
import '../../utils/helper/helper_function.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
              color: dark ? EColors.darkerGrey : EColors.grey,
              thickness: 0.8,
              indent: 60,
              endIndent: 5,
            )),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
              color: dark ? EColors.darkerGrey : EColors.grey,
              thickness: 0.8,
              indent: 5,
              endIndent: 50,
            ))
      ],
    );
  }
}
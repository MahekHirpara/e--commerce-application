import 'package:flutter/material.dart';

import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/constant/text.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? EImages.darkAppLogo : EImages.lightAppLogo),
        ),
        Text(
          EText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ESize.sm,
        ),
        Text(
          EText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
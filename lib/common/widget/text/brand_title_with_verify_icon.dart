import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../utils/constant/size.dart';
import 'brad_tital_text.dart';

class brantitle_text_with_verifyicon extends StatelessWidget {
  const brantitle_text_with_verifyicon({
    super.key,
    required this.title,
    this.textColor,
    this.iconColor=Colors.blue,
     this.maxLines =1,
    this.textAling = TextAlign.center,
     this.brandTextSize = TextSizes.small,
  });
  final String title;
  final Color? textColor,iconColor;
  final int maxLines;
  final TextAlign? textAling;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: EBrandTitleText(
            text: title ,
            color: textColor,
            maxLines: maxLines,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: ESize.xs),
         Icon(
          Iconsax.verify5,
          color: iconColor,
          size: ESize.iconsXs,
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';

import '../../../utils/constant/enums.dart';

class EBrandTitleText extends StatelessWidget {
  const EBrandTitleText({
    super.key,
    required this.text,
     this.color,
    this.maxLines=1,
    this.textAling = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String text;
  final Color? color;
  final int maxLines;
  final TextAlign? textAling;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          :brandTextSize == TextSizes.medium?
      Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          :brandTextSize == TextSizes.large?
      Theme.of(context).textTheme.titleLarge!.apply(color: color)
          :Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      textAlign: textAling,


    );
  }
}
import 'package:flutter/material.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';

class ECircularContainer extends StatelessWidget {
  const ECircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = ESize.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor=EColors.white,
    this.margin,
     this.showBorder = false,
     this.borderColor = EColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double? radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color:borderColor): null,
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}


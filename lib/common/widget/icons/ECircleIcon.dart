import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../utils/constant/color.dart';

class ECircleButton extends StatelessWidget {
  const ECircleButton({
    super.key,
    this.width,
    this.height,
    this.size =ESize.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (dark
            ? EColors.black.withOpacity(0.9)
            : EColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        icon: Icon(icon,color: color,size: size,),
        onPressed: onPressed,

      ),
    );
  }
}

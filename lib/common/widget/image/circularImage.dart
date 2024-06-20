import 'package:flutter/material.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/size.dart';
import '../../../utils/helper/helper_function.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
     this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width=56,
    this.height=56,
    this.padding=ESize.sm,

  });

 final String image;
 final BoxFit? fit;
 final bool isNetworkImage;
 final Color? overlayColor,backgroundColor;
 final double? width,height,padding;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? EColors.dark :EColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
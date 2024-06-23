import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
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
    this.width = 56,
    this.height = 56,
    this.padding = ESize.sm,
  });

  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double? width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? EColors.dark : EColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const EShimmerEffect(width: 55, height: 55,radius: 55,),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(
                    image:AssetImage(image) ,
                    color: overlayColor,
              fit: fit,
                  ),
          ),
        ));
  }
}

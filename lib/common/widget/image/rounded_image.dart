import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/constant/size.dart';
import '../shinmer.dart';

class ERoundedImage extends StatelessWidget {
  const ERoundedImage({
    super.key,
    this.width= double.infinity,
    this.height,
    required this.imageurl,
    this.applyimageRadius =false,
     this.backgroundColor,
    this.fit,
    this.padding ,
    this.isNetworkImage = false,
    this.onPressed, this.border,
    this.borderRadius = ESize.md,
  });
  final double? width,height;
  final String imageurl;
  final bool applyimageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border:border,
          borderRadius: BorderRadius.circular(borderRadius!),
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: applyimageRadius ? BorderRadius.circular(borderRadius!) :BorderRadius.zero,
          child:isNetworkImage
              ? CachedNetworkImage(
            imageUrl: imageurl,
            fit: fit,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
             EShimmerEffect(width: width, height: height,radius: borderRadius,),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
              : Image(
            image:AssetImage(imageurl) ,
            fit: fit,
          ),

        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/size.dart';
import '../../../utils/helper/helper_function.dart';
import '../image/circularImage.dart';

class EverticalIconText extends StatelessWidget {
  const EverticalIconText({
    super.key,
    required this.images,
    required this.title,
    this.textColor=Colors.white,
    this.backgroundColor=Colors.white,
    this.onTap,
     this.isNetworkImage = true,
  });

  final String images,title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ESize.spaceBtwItems),
        child: Column(
          children: [
            ECircularImage(
              image: images,
              fit: BoxFit.fitWidth,
              padding: ESize.sm*1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: EHelperFunction.isDarkMode(context) ? EColors.light:EColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(ESize.sm),
            //   decoration: BoxDecoration(
            //     borderRadius:
            //     BorderRadius.circular(100),
            //     color:(EHelperFunction.isDarkMode(context) ? EColors.black:EColors.white),
            //   ),
            //   child:  Center(
            //     child: Image(
            //       image: AssetImage(images),
            //       fit: BoxFit.cover,
            //       color: (EHelperFunction.isDarkMode(context) ? EColors.light:EColors.dark),),
            //   ),
            // ),
            const SizedBox(
              height: ESize.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/helper_function.dart';



class onBoardingPage extends StatelessWidget {
  final String title,subTitle,image;
  const onBoardingPage({
    super.key, required this.title, required this.subTitle, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ESize.defaultSpace),
      child:
      Column(
        children: [
          Image(
            width: EHelperFunction.screenWidth() * 0.8,
            height: EHelperFunction.screenHeight()*0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ESize.spaceBtwItems,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
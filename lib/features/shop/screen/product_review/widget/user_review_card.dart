import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/product/ratings/rating_indicator.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constant/color.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImages.nikeLogo),),
                const SizedBox(width : ESize.spaceBtwItems),
                Text('John Doe',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert),),
          ],
        ),
        const SizedBox(height : ESize.spaceBtwItems),

        //review
        Row(
          children: [
            const ERatingBarIndicator(rating: 4),
            const SizedBox(width : ESize.spaceBtwItems),
            Text('01 sep,2022',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height : ESize.spaceBtwItems),

        const ReadMoreText('The user interface of the app is quite intuitive. Iwas able to navigate and make purchase seamlessly,Gret job!',
          trimLines: 2,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontWeight: FontWeight.bold,color: EColors.primary,fontSize: 14),
          lessStyle: TextStyle(fontWeight: FontWeight.bold,color: EColors.primary,fontSize: 14),
        ),
        const SizedBox(height : ESize.spaceBtwItems),

        //Company Review

        ECircularContainer(
          backgroundColor: dark? EColors.darkerGrey : EColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ESize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E-Store',style: Theme.of(context).textTheme.bodyLarge),
                    Text('01 sep,2022',style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height : ESize.spaceBtwItems),
                const ReadMoreText('The user interface of the app is quite intuitive. Iwas able to navigate and make purchase seamlessly,Gret job!',
                  trimLines: 2,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontWeight: FontWeight.bold,color: EColors.primary,fontSize: 14),
                  lessStyle: TextStyle(fontWeight: FontWeight.bold,color: EColors.primary,fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height : ESize.spaceBtwSection),
      ],
    );
  }
}

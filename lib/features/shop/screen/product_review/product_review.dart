import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screen/product_review/widget/overall_product_rating.dart';
import 'package:e_commerce_app/features/shop/screen/product_review/widget/user_review_card.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/product/ratings/rating_indicator.dart';
import '../../../../utils/constant/size.dart';

class EProductReview extends StatelessWidget {
  const EProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text(
          'Review & Rating',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and review are verified and are from pepole who use the same type of device that you use.'),
              const SizedBox(
                height: ESize.spaceBtwItems,
              ),
              //over All produxt desing
              const EOverAllProductRating(),

              //rating
              const ERatingBarIndicator(rating: 3.5,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ESize.spaceBtwSection,),

              //User Review list
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



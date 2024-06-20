import 'package:e_commerce_app/features/shop/screen/product_review/widget/rating_indicator_pogress.dart';
import 'package:flutter/material.dart';

class EOverAllProductRating extends StatelessWidget {
  const EOverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ERatingIndicatorProgress(text: '5',value: 1.0,),
              ERatingIndicatorProgress(text: '4',value: 0.8,),
              ERatingIndicatorProgress(text: '3',value: 0.6,),
              ERatingIndicatorProgress(text: '2',value: 0.4,),
              ERatingIndicatorProgress(text: '1',value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}
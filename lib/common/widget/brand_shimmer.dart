import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:flutter/material.dart';

class EBrandShimmer extends StatelessWidget {
  const EBrandShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGrideLayout(mainAxisExtent : 80,itemCount: itemCount, itemBuilder: (_,__) =>const EShimmerEffect(width: 300, height: 300));
  }
}

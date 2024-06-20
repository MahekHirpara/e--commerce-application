import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/brand_cart/brand_card.dart';
import 'package:e_commerce_app/common/widget/product/sortable/sortable_product.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              EBrandcard(showborder: true),
              SizedBox(height: ESize.spaceBtwSection,),

              //sortable products
              ESortableProducts(),

            ],
          ),
        ),
      ),
    );
  }
}

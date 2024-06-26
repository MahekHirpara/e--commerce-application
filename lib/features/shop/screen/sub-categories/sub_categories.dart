import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/image/rounded_image.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/product/product_cart/product_cart_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Sports shirs'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //banner
              const ERoundedImage(
                imageurl: EImages.promoBanner1,
                width: double.infinity,
                applyimageRadius: true,
              ),
              const SizedBox(
                height: ESize.spaceBtwSection,
              ),

              //Sub-categories
              Column(
                children: [
                  ESectionHeading(
                    text: 'Sports shirt',
                    showActionbutton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: ESize.spaceBtwSection,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return const EProductCardHorizontal();
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                              width: ESize.spaceBtwItems,
                            ),
                        itemCount: 4),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

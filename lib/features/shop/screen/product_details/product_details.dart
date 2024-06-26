
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/widget/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/widget/product_attribute.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/widget/product_detail_image_slider.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/widget/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/widget/rating_share_widget.dart';
import 'package:e_commerce_app/features/shop/screen/product_review/product_review.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/size.dart';
import '../../modal/product_modal.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product,});
  final ProductModal product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const EBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Slider
             EProductImageSlider(
              product: product,
            ),
            //product Detail

            Padding(
              padding: const EdgeInsets.only(
                  right: ESize.defaultSpace,
                  left: ESize.defaultSpace,
                  bottom: ESize.defaultSpace),
              child: Column(
                children: [
                  //rating &share
                  const ERatingAndShare(),

                  //Price,title,stock,& Brand
                  const EProductMEtaData(),
                  const SizedBox(height: ESize.spaceBtwSection,),

                  //Attribute
                  const EProductAttribute(),
                  const SizedBox(height: ESize.spaceBtwSection,),

                  //checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: ESize.spaceBtwSection,),

                  //Description
                  const ESectionHeading(text: 'Description',showActionbutton: false,),
                  const SizedBox(height: ESize.spaceBtwItems,),
                  const ReadMoreText(
                    'Discription for black zara dress.Discription for black zara dress.Discription for black zara dress.Discription for black zara dress',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),


                  const SizedBox(height: ESize.spaceBtwItems,),
                  //Review

                  const Divider(),
                  const SizedBox(height: ESize.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(text: 'Reviews(199)',showActionbutton: false,),
                      IconButton(onPressed: (){
                        Get.to(()=>const EProductReview());
                      }, icon: const Icon(Iconsax.arrow_right_3,size: 10,),),
                    ],
                  ),
                  const SizedBox(height: ESize.spaceBtwSection,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

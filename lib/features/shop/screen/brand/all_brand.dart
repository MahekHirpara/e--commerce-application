import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/brand_cart/brand_card.dart';
import '../../../../common/widget/brand_shimmer.dart';
import '../../controller/brand_controller.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //heading
              const ESectionHeading(
                text: 'Brands',
                showActionbutton: false,
              ),
              const SizedBox(
                height: ESize.spaceBtwItems,
              ),

              //brands
              Obx(() {
                if(brandController.isLoading.value) return const EBrandShimmer();

                if(brandController.allBrands.isEmpty){
                  return Center(
                    child: Text('No data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                  );
                }
                return EGrideLayout(
                  mainAxisExtent: 80,
                  itemCount: brandController.allBrands.length,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return EBrandcard(
                      brand: brand,
                      showborder: true,
                      onPressed: () {
                        Get.to(
                          () => BrandProducts(brand: brand,),
                        );
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

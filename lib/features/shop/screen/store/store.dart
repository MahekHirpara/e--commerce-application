import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/screen/brand/brand_products.dart';
import 'package:e_commerce_app/features/shop/screen/store/widget/category_tab.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/brand_shimmer.dart';
import '../../../../common/widget/custom_shap/container/serach_container.dart';
import '../../../../common/widget/brand_cart/brand_card.dart';
import '../../../../utils/constant/color.dart';
import '../brand/all_brand.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final controller = CategoryController.instance.featuredCategories;
    final dark = EHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: controller.length,
      child: Scaffold(
        appBar: EAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
          actions: [
            ECartCounterIcon(
              onpressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? EColors.black : EColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ESize.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      //Search bar
                      const SizedBox(
                        height: ESize.spaceBtwItems,
                      ),
                      const ESearchBar(
                        text: 'Search in Store',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: ESize.spaceBtwSection,
                      ),

                      //Fearcher Brand
                      ESectionHeading(
                        text: 'Featured Brand',
                        showActionbutton: true,
                        onPressed: () {
                          Get.to(() => const AllBrandScreen());
                        },
                      ),
                      const SizedBox(
                        height: ESize.spaceBtwSection / 1.5,
                      ),

                      //brad grid
                      Obx(() {
                        if(brandController.isLoading.value) return const EBrandShimmer();

                        if(brandController.featuresBrands.isEmpty){
                          return Center(
                            child: Text('No data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                          );
                        }
                        return EGrideLayout(
                            itemCount: brandController.featuresBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuresBrands[index];
                              return  EBrandcard(
                                showborder: true,
                                brand: brand,
                                onPressed: () => Get.to(()=> BrandProducts(brand: brand)),
                              );
                            });
                      }),
                    ],
                  ),
                ),
                //tabs
                bottom: ETabbar(
                    tabs: controller
                        .map(
                          (category) => Tab(
                            child: Text(category.name),
                          ),
                        )
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
            children: controller
                .map((element) => ECatogoryTab(
                      category: element,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

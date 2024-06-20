import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/store/widget/category_tab.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/custom_shap/container/serach_container.dart';
import '../../../../common/widget/brand_cart/brand_card.dart';
import '../../../../utils/constant/color.dart';
import '../brand/all_brand.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: EAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
Get.to(()=>AllBrandScreen());
                          },
                        ),
                        const SizedBox(
                          height: ESize.spaceBtwSection / 1.5,
                        ),

                        //brad grid
                        EGrideLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const EBrandcard(
                                showborder: true,
                              );
                            }),
                      ],
                    ),
                  ),
                  //tabs
                  bottom: const ETabbar(
                    tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronic'),
                      ),
                      Tab(
                        child: Text('Clothes'),
                      ),
                      Tab(
                        child: Text('cosmatic'),
                      ),
                    ],
                  )),
            ];
          },
          body: const TabBarView(
            children: [
              ECatogoryTab(),
              ECatogoryTab(),
              ECatogoryTab(),
              ECatogoryTab(),
              ECatogoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}



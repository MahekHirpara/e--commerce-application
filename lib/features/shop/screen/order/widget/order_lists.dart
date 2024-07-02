import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controller/product/order_controller.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widget/loaders/full_screen_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class EOrderListItem extends StatelessWidget {
  const EOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = EHelperFunction.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrder(),
      builder: (context, snapshot) {


        final empty = FullScreenLoader(
          text: 'Whoops,Order is Empty',
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPresed:  () => Get.to(()=> const NavigationMenu()),
        );

        final response = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,nothingFound: empty);
        if(response != null) return response;

        final orders = snapshot.data!;
        return ListView.separated(
          itemCount: orders.length,
          separatorBuilder: (_,__) => const SizedBox(height: ESize.spaceBtwItems,),
          itemBuilder: (_,index){

            final order = orders[index];
          return  ECircularContainer(
            showBorder: true,
            padding: const EdgeInsets.all(ESize.md),
            backgroundColor: dark ? EColors.dark : EColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    //Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(
                      width: ESize.spaceBtwItems / 2,
                    ),
                    //status& Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderStatusText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: EColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            order.formattedOrderDate,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    //Column
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: ESize.iconsSm,
                        ))
                  ],
                ),
                const SizedBox(height: ESize.spaceBtwItems,),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          //Icon
                          const Icon(Iconsax.tag),
                          const SizedBox(
                            width: ESize.spaceBtwItems / 2,
                          ),
                          //status& Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  order.id,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          //Column
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          //Icon
                          const Icon(Iconsax.calendar),
                          const SizedBox(
                            width: ESize.spaceBtwItems / 2,
                          ),
                          //status& Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  order.formattedDeliveryDate,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          //Column
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },

        );
      }
    );
  }
}

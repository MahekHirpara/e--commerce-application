import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class EOrderListItem extends StatelessWidget {
  const EOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_,__) => const SizedBox(height: ESize.spaceBtwItems,),
      itemBuilder: (_,index){
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
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: EColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '07 Nov,2023',
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
                              '[#2567]',
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
                              '03 Feb',
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
}

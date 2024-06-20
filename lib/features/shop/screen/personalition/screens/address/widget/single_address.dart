
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../../../utils/constant/color.dart';
import '../../../../../../../utils/constant/size.dart';
import '../../../../../../../utils/helper/helper_function.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ECircularContainer(
      padding: const EdgeInsets.all(ESize.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? EColors.primary.withOpacity(0.3)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? EColors.darkerGrey
              : EColors.dark,
      margin: const EdgeInsets.only(bottom: ESize.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? EColors.light
                      : EColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mahek patel',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: ESize.sm / 2,
              ),
              const Text(
                '(+345) 678 2345',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: ESize.sm / 2,
              ),
              const Text(
                '34, sefdfb sfghn sfdvc,surat,Gujrat ,India.',
               softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

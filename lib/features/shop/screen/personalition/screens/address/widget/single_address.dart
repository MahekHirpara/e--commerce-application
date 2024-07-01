import 'package:e_commerce_app/features/shop/screen/personalition/controller/address/address_controller.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/modal/address_modal.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../../../utils/constant/color.dart';
import '../../../../../../../utils/constant/size.dart';
import '../../../../../../../utils/helper/helper_function.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress(
      {super.key,
      required this.address,
      required this.onTap});

  final AddressModal address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = EHelperFunction.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddresses.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: ECircularContainer(
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
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: ESize.sm / 2,
                  ),
                   Text(
                   '+91${address.formattedPhoneNo}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: ESize.sm / 2,
                  ),
                   Text(
                    address.toString(),
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

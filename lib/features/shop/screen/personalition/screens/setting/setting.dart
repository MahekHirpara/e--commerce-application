import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/custom_shap/container/primary_header_container.dart';
import 'package:e_commerce_app/common/widget/list_tile/menu_list.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/address.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../../common/widget/list_tile/user_profile_tile.dart';
import '../../../order/order.dart';
import '../../../../../../utils/constant/color.dart';
import '../../../../../../utils/constant/size.dart';
import '../profile/profile_sc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            EPrimaryHeader(
                child: Column(
              children: [
                EAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: EColors.white),
                  ),
                ),

                //User Profile

                 EUserProfileTile(onPressed: () =>Get.to(() => const ProfileScreen()),),
                const SizedBox(
                  height: ESize.spaceBtwSection,
                )
              ],
            )),
            //body
            Padding(
              padding: const EdgeInsets.all(ESize.defaultSpace),
              child: Column(
                children: [
                  const ESectionHeading(
                    text: 'Acoount Setting',
                    showActionbutton: false,
                  ),
                  const SizedBox(
                    height: ESize.spaceBtwItems,
                  ),

                  ESettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'set shopping delivery address',
                    onTap: () {
                      Get.to(()=>const UserAddressScreen());
                    },
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add,remove or Move to Checkout',
                    onTap: () {
                      Get.to(()=>const OrderScreen());
                    },
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Order',
                    subTitle: 'In-Progress and Completed Order',
                    onTap: () {},
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank',
                    onTap: () {},
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all Discount Coupons',
                    onTap: () {},
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification',
                    onTap: () {},
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  //App Setting
                  const SizedBox(
                    height: ESize.spaceBtwSection,
                  ),
                  const ESectionHeading(
                    text: 'App Setting',
                    showActionbutton: false,
                  ),
                  const SizedBox(
                    height: ESize.spaceBtwItems,
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload data to your cloud Firebase',
                    trailing: Switch(value: true, onChanged: (value){},),
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),
                  ESettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value){},),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

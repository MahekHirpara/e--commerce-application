import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/add_new_address.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constant/color.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddress()),
        backgroundColor: EColors.primary,
        child: const Icon(
          Iconsax.add,
          color: EColors.white,
        ),
      ),
      appBar: const EAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              ESingleAddress(selectedAddress: true),
              ESingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/controller/address/address_controller.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/add_new_address.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../utils/constant/color.dart';
import '../../../../../../utils/helper/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddress(),
              builder: (context, snapshot) {

                final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,);
                if(widget != null) return widget;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (context,index) {
                    return ESingleAddress(address: addresses[index],onTap: ()=> controller.selectAddress(addresses[index]),);
                  }
                );
              }),
        ),
      ),
    );
  }
}

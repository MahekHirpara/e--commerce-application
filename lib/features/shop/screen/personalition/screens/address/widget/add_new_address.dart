import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/controller/address/address_controller.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key, });

  @override
  Widget build(BuildContext context) {
final controller = AddressController.instance;
    return Scaffold(
      appBar: const EAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Form(
            key: controller.newwAddressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),labelText: 'Name'
                  ),
                  validator: (value) => EValidator.validationEmptyText('Name', value!),
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                TextFormField(
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'
                  ),
                  validator: (value) => EValidator.validationEmptyText('Phone Number', value!),
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'
                        ),
                        validator: (value) => EValidator.validationEmptyText('Street', value!),
                      ),

                    ),
                    const SizedBox(width: ESize.spaceBtwInputField,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'
                        ),
                        validator: (value) => EValidator.validationEmptyText('Postal Code', value!),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),labelText: 'City'
                        ),
                        validator: (value) => EValidator.validationEmptyText('City', value!),
                      ),
                    ),
                    const SizedBox(width: ESize.spaceBtwInputField,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),labelText: 'State'
                        ),
                        validator: (value) => EValidator.validationEmptyText('State', value!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                TextFormField(
                  controller: controller.country,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global),labelText: 'Country'
                  ),
                  validator: (value) => EValidator.validationEmptyText('Country', value!),
                ),
                const SizedBox(height: ESize.defaultSpace,),
                SizedBox(width: double.infinity, child: ElevatedButton(child: const Text('Add'), onPressed: (){
                  controller.addNewAddress();
                },),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

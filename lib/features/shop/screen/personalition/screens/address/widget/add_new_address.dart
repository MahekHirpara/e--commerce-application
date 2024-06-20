import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key, });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const EAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),labelText: 'Name'
                  ),
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'
                  ),
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'
                        ),
                      ),
                    ),
                    const SizedBox(width: ESize.spaceBtwInputField,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),labelText: 'City'
                        ),
                      ),
                    ),
                    const SizedBox(width: ESize.spaceBtwInputField,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),labelText: 'State'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESize.spaceBtwInputField,),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global),labelText: 'Contry'
                  ),
                ),
                const SizedBox(height: ESize.defaultSpace,),
                SizedBox(width: double.infinity, child: ElevatedButton(child: const Text('Add'), onPressed: (){},),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

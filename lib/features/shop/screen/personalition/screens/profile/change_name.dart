import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/controller/user_controller/update_name_controller.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constant/text.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Change name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESize.defaultSpace),
        child: Column(
          children: [
            Text(
                'User real name for easy verification. this name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: ESize.spaceBtwSection,
            ),

            //Form
            Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                        expands: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: EText.fistName,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Last name cannot be empty';
                        //   }
                        //
                        // },
                    ),
                    const SizedBox(
                      height: ESize.spaceBtwInputField,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                        expands: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: EText.fistName,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Last name cannot be empty';
                        //   }
                        //
                        // },
                    ),
                  ],
                )
            ),
            const SizedBox(
              height: ESize.spaceBtwSection,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                controller.updateUserName();
              },child: const Text('Save'),),
            )
          ],
        ),
      ),
    );
  }
}

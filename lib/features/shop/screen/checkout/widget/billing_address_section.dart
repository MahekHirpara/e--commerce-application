
import 'package:e_commerce_app/features/shop/screen/personalition/controller/address/address_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constant/size.dart';
import 'package:get/get.dart';

class EBilingAddressSection extends StatelessWidget {
  const EBilingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    print(addressController.selectedAddresses.value.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(text: 'Shipping Address',btnTitle:'Change',onPressed: (){ addressController.selectNewAddressPopup(context);},),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Obx(
              ()=>
          addressController.selectedAddresses.value.id.isNotEmpty ?
       Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(addressController.selectedAddresses.value.name,style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: ESize.spaceBtwItems/2,),
              Row(
                children: [
                  const Icon(Icons.phone,color: Colors.grey,size:16,),
                  const SizedBox(width: ESize.spaceBtwItems,),
                  Text(addressController.selectedAddresses.value.phoneNumber,style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: ESize.spaceBtwItems/2,),
              Row(
                children: [
                  const Icon(Icons.location_history,color: Colors.grey,size:16,),
                  const SizedBox(width: ESize.spaceBtwItems,),
                  Expanded(child: Text(addressController.selectedAddresses.value.toString(),style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
                ],
              ),
            ],
          ): Text('Select Address',style: Theme.of(context).textTheme.bodyMedium,),
        ) ,

      ],
    );
  }
}

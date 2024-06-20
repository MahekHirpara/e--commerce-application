
import 'package:flutter/material.dart';

import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constant/size.dart';

class EBilingAddressSection extends StatelessWidget {
  const EBilingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(text: 'Shipping Address',btnTitle:'Change',onPressed: (){},),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Text('Mahek Hirpara',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size:16,),
            const SizedBox(width: ESize.spaceBtwItems,),
            Text('+91-123-4567891',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size:16,),
            const SizedBox(width: ESize.spaceBtwItems,),
            Expanded(child: Text('Yogichowk ,surat,India',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
          ],
        ),
      ],
    );
  }
}

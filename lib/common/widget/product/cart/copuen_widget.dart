import 'package:flutter/material.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../custom_shap/container/circular_container.dart';

class ECoupenCode extends StatelessWidget {
  const ECoupenCode({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ECircularContainer(
      showBorder: true,
      backgroundColor: dark ? EColors.dark : EColors.white,
      padding: const EdgeInsets.only(top: ESize.sm,right:ESize.sm ,bottom: ESize.sm,left:ESize.md ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 80,child: ElevatedButton(onPressed: (){}, child: const Text('Apply')))
        ],
      ),
    );
  }
}
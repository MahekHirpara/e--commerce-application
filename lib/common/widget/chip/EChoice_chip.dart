import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';

class EChoiceChip extends StatelessWidget {
  const EChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
 final String text;
 final bool selected;
 final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
final isColor = EHelperFunction.getColor(text) != null;
final dark  = EHelperFunction.isDarkMode(context);
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle:  TextStyle(color: dark ? selected ? EColors.white : EColors.white : EColors.black),
      avatar: isColor  ? ECircularContainer(width: 50,height: 50,backgroundColor: EHelperFunction.getColor(text),) : null,
      shape: isColor ?const CircleBorder() : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ?  const EdgeInsets.all(0) : null,

      backgroundColor: isColor ? EHelperFunction.getColor(text) : null ,
    );
  }
}

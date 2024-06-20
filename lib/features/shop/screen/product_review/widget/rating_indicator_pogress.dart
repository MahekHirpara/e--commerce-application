import 'package:flutter/material.dart';

import '../../../../../utils/constant/color.dart';
import '../../../../../utils/device/devise_utility.dart';

class ERatingIndicatorProgress extends StatelessWidget {
  const ERatingIndicatorProgress({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: EDeviceUtils.getScreenWidth(context)*0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: EColors.grey,
              valueColor:
              const AlwaysStoppedAnimation(EColors.primary),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
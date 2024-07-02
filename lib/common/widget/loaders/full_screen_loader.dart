import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/size.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({
    super.key,
    required this.text,
    required this.showAction,
    this.actionText,
    this.onActionPresed,
  });

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPresed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(height: ESize.spaceBtwItems,),
            if(showAction) SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPresed,
                style: OutlinedButton.styleFrom(backgroundColor: EColors.dark),
                child: Text(
                  actionText!,style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ]
      ),
    );
  }
}

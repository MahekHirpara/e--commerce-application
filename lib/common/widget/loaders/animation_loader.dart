import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class EAnimationLoaderWidget extends StatelessWidget {
  const EAnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.actionText,
    this.onActionPresed,
     this.showAction=false
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPresed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(animation,width: MediaQuery.of(context).size.width*0.8),
            const SizedBox(height: ESize.defaultSpace,),
            Text(text,style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: ESize.defaultSpace,),
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
          ],
        ),
      ),
    );
  }
}

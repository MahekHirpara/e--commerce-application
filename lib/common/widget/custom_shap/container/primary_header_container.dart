import 'package:flutter/material.dart';

import '../../../../utils/constant/color.dart';
import '../curved_edges/curve_edget_widget.dart';
import 'circular_container.dart';

class EPrimaryHeader extends StatelessWidget {
  const EPrimaryHeader({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECruvedEdgesWidget(
      child: Container(
        color: EColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: ECircularContainer(width :400,height:400,backgroundColor: EColors.textWhite.withOpacity(0.1),radius: 400,),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ECircularContainer(width :400,height:400,backgroundColor: EColors.textWhite.withOpacity(0.1),radius: 400,),
            ),
            child,

          ],
        ),


      ),
    );
  }
}
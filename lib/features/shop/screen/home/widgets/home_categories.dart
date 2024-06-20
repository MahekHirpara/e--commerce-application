import 'package:flutter/material.dart';

import '../../../../../common/widget/image_text/image_text.dart';
import '../../../../../utils/constant/image_string.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return EverticalIconText(
              images: EImages.cosmatic,
              title: 'cosmatic',
              onTap: (){},

            );
          }),
    );
  }
}
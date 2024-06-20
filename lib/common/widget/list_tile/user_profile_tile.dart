import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/image_string.dart';
import '../image/circularImage.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ECircularImage(
        image: EImages.promo1,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Mahek Hirpara',style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white),),
      subtitle: Text('mahek@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: EColors.white),),
    );
  }
}
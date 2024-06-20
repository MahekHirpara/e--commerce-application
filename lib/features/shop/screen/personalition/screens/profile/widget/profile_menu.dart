import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../utils/constant/size.dart';

class EProfileMenu extends StatelessWidget {
  const EProfileMenu({
    super.key,
    required this.value,
    required this.title,
    required this.onPress,
     this.icon = Iconsax.arrow_right_34,
  });

  final String value,title;
  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ESize.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex:5,child:Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
             Icon(icon,size:18),
          ],
        ),
      ),
    );
  }
}

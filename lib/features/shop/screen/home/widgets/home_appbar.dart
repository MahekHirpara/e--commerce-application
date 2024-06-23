
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/product/cart_menu_icon.dart';
import '../../../../../utils/constant/color.dart';
import '../../personalition/controller/user_controller/user_controller.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good day for Shopping',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: EColors.grey),
          ),
          Obx(
            () {
              if(controller.profileLoading.value){
                return const EShimmerEffect(width:80,height:15);
              }
              return Text(
                controller.user.value.fullName,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: EColors.white),
              );
            }
          ),
        ],
      ),
      actions: [
        ECartCounterIcon(
          onpressed: (){},
          iconColor: EColors.white,
        ),
      ],
    );
  }
}
import 'package:e_commerce_app/features/shop/screen/personalition/controller/user_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/image_string.dart';
import '../image/circularImage.dart';
import '../shinmer.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UserController());
    return ListTile(
      leading:  Obx(
              () {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : EImages.user;
            return controller.imageUpload.value? const EShimmerEffect(width: 80, height: 80):
            ECircularImage(
              padding: 0,
              image: image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              isNetworkImage: networkImage.isNotEmpty,
            );
          }
      ),
      title: Obx(
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
      subtitle: Obx(
        () {
          if(controller.profileLoading.value){
            return const EShimmerEffect(width:80,height:15);
          }
            return Text(
              controller.user.value.email,
              style:
              Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: EColors.white),
            );
          }
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: EColors.white),
      ),
    );
  }
}

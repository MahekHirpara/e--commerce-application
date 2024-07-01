import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/shinmer.dart';
import '../../modal/product_modal.dart';

class ImageController extends GetxController{
  static  ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModal product){
    Set<String> images = {};
    //Load thumbnail image
    images.add(product.thumbnail);

    //Assign thumbnail as selected page
    selectedProductImage.value = product.thumbnail;

    //Get all imagws from the Product modal if not null
    if(product.images != null){
      images.addAll(product.images!);
    }
    //Get all images the Product Variation is not null
    if(product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variations) => variations.image));
    }

    return images.toList();
  }

  void showEnlargedImages(String image){
    Get.to(
      fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.symmetric(vertical:ESize.defaultSpace*2,horizontal: ESize.defaultSpace),
              child: CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                const EShimmerEffect(width: 55, height: 55,radius: 55,),
                errorWidget: (context, url, error) => const Icon(Icons.error),),
              ),
              const SizedBox(height: ESize.spaceBtwItems,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: ()=>Get.back(),child: const Text('Close'),),
                ),
              )
            ],
          ),
        )
    );
  }
}
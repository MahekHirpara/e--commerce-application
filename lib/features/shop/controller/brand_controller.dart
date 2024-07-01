import 'package:e_commerce_app/data/repositories/brand/brand_repo.dart';
import 'package:e_commerce_app/data/repositories/product/product_repo.dart';
import 'package:e_commerce_app/features/shop/modal/brand_modal.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loader.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = true.obs;
  final RxList<BrandModal> allBrands = <BrandModal>[].obs;
  final RxList<BrandModal> featuresBrands = <BrandModal>[].obs;
  final brandRepo = Get.put(BrandRepo());

  @override
  void onInit() {
    getFeatureBrands();
    super.onInit();
  }

  Future<void> getFeatureBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getAllBrand();
      allBrands.assignAll(brands);
      featuresBrands.assignAll(
          brands.where((brand) => brand.IsFeatured == true).take(4));
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Get brand for categories
  Future<List<BrandModal>> getBrandsForCategory(String categoryId) async {
    try{
      final brands = await brandRepo.getBrandForCategory(categoryId);
      return brands;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }

  }

  //get brand for specific product
  Future<List<ProductModal>> getBrandProduct({required String brandId,int limit = -1}) async {
    try{
      final products = await ProductRepo.instance.getProductForBrand(id: brandId,limit: limit);
      return products;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }

  }
}

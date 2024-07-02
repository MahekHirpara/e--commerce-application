import 'package:e_commerce_app/data/repositories/categories/category_repository.dart';
import 'package:e_commerce_app/data/repositories/product/product_repo.dart';
import 'package:get/get.dart';

import '../../../common/widget/loaders/processing_loader.dart';
import '../../../utils/popups/loader.dart';
import '../modal/category_modal.dart';
import '../modal/product_modal.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepo = Get.put(CategoriesRepo());
  RxList<CategoriesModal> allCategories = <CategoriesModal>[].obs;
  RxList<CategoriesModal> featuredCategories = <CategoriesModal>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load category data
  void fetchCategories() async {
    try {
      //Show loader while Loading
      isLoading.value = true;

      //Fetch categories from data source(Firestore,Api,etc).
      final categories = await _categoryRepo.getAllCategories();

      //Update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load selected Category data
  Future<List<CategoriesModal>> getSubCategories(String categoryId) async{
    try{
      final subCategories = await _categoryRepo.getSubCategories(categoryId);
      return subCategories;
    }catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get Category or Sub-Category Product
  Future<List<ProductModal>> getCategoryProduct(
      {required String categoryId, int limit = 4}) async {
    final products = await ProductRepo.instance
        .getProductForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}

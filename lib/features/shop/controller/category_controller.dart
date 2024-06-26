import 'package:e_commerce_app/data/repositories/categories/category_repository.dart';
import 'package:get/get.dart';

import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';
import '../modal/category_modal.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepo = Get.put(CategoriesRepo());
  RxList<CategoriesModal> allCategories = <CategoriesModal>[].obs;
  RxList<CategoriesModal> featuredCategories = <CategoriesModal>[].obs;

  @override
  void onInit(){
    fetchCategories();
    super.onInit();
  }


  ///Load category data
  void fetchCategories() async{
    try{
      //Show loader while Loading
      isLoading.value = true;

      //Fetch categories from data source(Firestore,Api,etc).
      final categories = await _categoryRepo.getAllCategories();

      //Update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
  /// Load selected Category data

  /// Get Category or Sub-Category Product
///
///
/// Upload Categories to the Cloud Firebase

}
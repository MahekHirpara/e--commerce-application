import 'dart:convert';

import 'package:e_commerce_app/data/repositories/product/product_repo.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

import '../../modal/product_modal.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

//Initialize favorites by reading from storage
  Future<void> initFavorites() async {
    final json = ELocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;

      favorites.assignAll(storedFavorites.map((key,value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorites(String productId){
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      savFavoritesToStorage();
      ELoaders.customToast(message: 'Product has been added to your wishlist');
    }else{
      ELocalStorage.instance().readData(productId);
      favorites.remove(productId);
      savFavoritesToStorage();
      favorites.refresh();
      ELoaders.customToast(message: 'Product has been remove to your wishlist');
    }
  }

  void savFavoritesToStorage() {
    final encodeFavorites = jsonEncode(favorites);
    ELocalStorage.instance().saveData('favorites', encodeFavorites);
  }

  Future<List<ProductModal>> favoritesProduct()  async{
    return await ProductRepo.instance.getFavouriteProduct(favorites.keys.toList());
  }
}

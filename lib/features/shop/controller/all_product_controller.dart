import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/product/product_repo.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:get/get.dart';

import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';

class AllProductController extends GetxController{
  static AllProductController get instance => Get.find();

  final repository = ProductRepo.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModal> products = <ProductModal>[].obs;

  Future<List<ProductModal>> fetchProductByQuery(Query? query) async{
    try{
      if( query == null) return [];

      final products = await repository.fetchProductByQuery(query);
      return products;
    }catch(e){

      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){
    selectedSortOption.value = sortOption;

    switch(sortOption){
      case 'Name':
        products.sort((a,b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price Product':
        products.sort((a,b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price Product':
        products.sort((a,b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a,b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a,b) {
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice >0){
            return -1;
          }else{
            return 1;
          }
        });
        break;
        default:
          products.sort((a,b) => a.title.compareTo(b.title));
    }
  }
  void assignProducts(List<ProductModal> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
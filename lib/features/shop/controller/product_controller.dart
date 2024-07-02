import 'package:e_commerce_app/data/repositories/product/product_repo.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:get/get.dart';

import '../../../common/widget/loaders/processing_loader.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepo = Get.put(ProductRepo());
  RxList<ProductModal> allProduct = <ProductModal>[].obs;
  RxList<ProductModal> featuredProducts = <ProductModal>[].obs;

  @override
  void onInit(){
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async{
    try{

      isLoading.value = true;

      //get product
      final products = await _productRepo.getFeaturedProducts();

      //assing product
      featuredProducts.assignAll(products);

    }catch(e){
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModal>> fetchAllFeaturedProduct() async{
    try{
      //get product
      final products = await _productRepo.getAllFeaturedProducts();
      return products;
    }catch(e){
      ELoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }

  }

  String getProductPrice(ProductModal product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0 ;

    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }else{
      for(var variation in product.productVariations!){
        double priceToConsider = variation.salePrice>0.0 ? variation.salePrice : variation.price;

        if(priceToConsider<smallestPrice){
          smallestPrice = priceToConsider;
        }

        if(priceToConsider>largestPrice){
          largestPrice = priceToConsider;
        }

      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else{
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice,double? salePrice){
    if(salePrice == null || salePrice <=0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage =((originalPrice - salePrice)/originalPrice)*100;
    return percentage.toStringAsFixed(0);
  }

  String getStockStatus(int stock){
    return stock > 0 ?'In Stock' : 'Out of Stock';
  }
}
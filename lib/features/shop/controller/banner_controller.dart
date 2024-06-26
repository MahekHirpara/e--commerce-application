import 'package:e_commerce_app/data/repositories/banner/banner_repo.dart';
import 'package:e_commerce_app/features/shop/modal/banner_modal.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../modal/category_modal.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';

class BannerController extends GetxController{
  static BannerController get instance =>Get.find();


  final isLoading = false.obs;
  final currentIndex =0.obs;
  final _bannerRepo = Get.put(BannerRepo());
  RxList<BannerModal> allBanners = <BannerModal>[].obs;
  RxList<CategoriesModal> featuredCategories = <CategoriesModal>[].obs;


  @override
  void onInit(){
    fetchBanner();
    super.onInit();
  }

  void updatePageIndicator(index){
    currentIndex.value = index;
  }

  //Fetch Controller
  void fetchBanner() async{
    try{
      //Show loader while Loading
      isLoading.value = true;

      //Fetch categories from data source(Firestore,Api,etc).
      final banners = await _bannerRepo.fetchBanner();

      //Using banners
      allBanners.assignAll(banners);




    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}
import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/controller/product/image_controller.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:e_commerce_app/features/shop/modal/product_variation_modal.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModal> selectedVariation =
      ProductVariationModal.empty().obs;

  //select Attribute and variation
  void onAttributeSelected(
      ProductModal product, attributeName, attributeValue) {

    //when attribute is selected we wiil frist add that attribute to selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;


    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributesValues(variation.attributeValue, selectedAttributes),
      orElse: () => ProductVariationModal.empty(),
    );

    //show the selected variation Image as a main Image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    //assign selectedVariation
    this.selectedVariation.value = selectedVariation;

    //update selected variation status
    getProductVariationStockStatus();
  }

  //check if selected attribute matches any variation attribute
  bool _isSameAttributesValues(Map<String, dynamic> variationAttribute,
      Map<String, dynamic> selectedAttribute) {
    //if selected attributes contain 3 attributes and current variation contain 2 then return
    if (variationAttribute.length != selectedAttribute.length) return false;

    //if any of the attributes is diffrent then return
    for (final key in variationAttribute.keys) {
      if (variationAttribute[key] != selectedAttribute[key]) return false;
    }
    return true;
  }

  //check Product availability/stock in variation
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModal> variation, String attributeName) {
    //pass the variation to check which attributes are available
    final availableVariationAttributes = variation
        .where((variation) =>
            //Check Empty
            variation.attributeValue[attributeName] != null &&
            variation.attributeValue[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        //Fetch all non-empty attributes of variation
        .map((variation) => variation.attributeValue[attributeName])
        .toSet();
    return availableVariationAttributes;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  //check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //Reset Selected Attribute when switching product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModal.empty();
  }
}

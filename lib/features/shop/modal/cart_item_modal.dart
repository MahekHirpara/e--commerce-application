class CartItemModal{
  String productTid;
  String title;
  double price;
  String? images;
  int quantity;
  String variationId;
  String? brandName;
  Map<String,String>? selectedVariation;

  CartItemModal({
    required this.productTid,
    required this.quantity,
    this.variationId ='',
    this.images,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
});

  static CartItemModal empty() => CartItemModal(productTid: '', quantity: 0);

  Map<String,dynamic> toJson(){
    return{
      'ProductId' : productTid,
      'Title' :title,
      'Price' : price,
      'Image' :images,
      'Quantity' : quantity,
      'VariationId' : variationId,
      'BrandName' : brandName,
      'SelectedVariation' : selectedVariation,
    };
  }

  factory CartItemModal.fromJson(Map<String,dynamic> json){
    return CartItemModal(
        productTid: json['ProductId'],
        quantity: json['Quantity'],
      title: json['Title'],
      price: json['Price'],
      images: json['Image'],
      variationId: json['VariationId'],
      brandName: json['BrandName'],
      selectedVariation: json['SelectedVariation'] != null ? Map<String,String>.from(json['SelectedVariation']) : null,
    );
  }
}
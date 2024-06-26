class ProductVariationModal{
  final String id;
  String sku;
  String? description;
  String image;
  double price;
  double salePrice;
  int stock;
  Map<String,String> attributeValue;

  ProductVariationModal({
    required this.id,
    required this. attributeValue,
    this.sku = '',
    this.image ='',
    this.description = '',
    this.salePrice =0.0,
    this.price = 0.0,
    this.stock = 0,
});

  static ProductVariationModal empty() => ProductVariationModal(id: '', attributeValue: {});

  toJson(){
    return {
      'Id' : id,
      'Image' : image,
      'Description' :description,
      'Price' : price,
      'SKU' :sku,
      'SalePrice' :salePrice,
      'Stock':stock,
      'AttributeValues' : attributeValue,
    };
  }

  factory ProductVariationModal.fromJson(Map<String,dynamic> document){
    final data = document;
    if(data.isEmpty) return ProductVariationModal.empty();
    return ProductVariationModal(
        id: data['Id'] ?? '2',
        attributeValue: Map<String,String>.from(data['AttributeValues']),
       price: double.tryParse(data['Price']?.toString() ?? '0.0') ?? 0.0,
      sku: data['SKU'] ?? 'QRT3674',
      stock:  data['Stock'] ?? 0,
      salePrice: double.tryParse(data['SalePrice']?.toString() ?? '0.0') ?? 0.0,
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
    );
  }
}
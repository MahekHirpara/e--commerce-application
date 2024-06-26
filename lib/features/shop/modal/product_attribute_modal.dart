class ProductAttributeModal {
  String? name;
  final List<String>? values;

  ProductAttributeModal({
    this.name,
    this.values,
});

  toJson(){
    return{
      'Name' : name,
      'Values' : values,
    };
  }
  factory ProductAttributeModal.fromJson(Map<String,dynamic> document){
    final data = document;

    if(data.isEmpty)return ProductAttributeModal();
    return ProductAttributeModal(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
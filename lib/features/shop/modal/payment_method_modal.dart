class PaymentMethodModal{
  String name;
  String image;

  PaymentMethodModal({required this.image,required this.name});
  static PaymentMethodModal empty() =>PaymentMethodModal(image: '', name: '');
}
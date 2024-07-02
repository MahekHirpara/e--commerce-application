import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/modal/address_modal.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:get/get.dart';

import '../../../utils/constant/enums.dart';
import 'cart_item_modal.dart';

class OrderModal extends GetxController {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModal? address;
  final DateTime? deliveryDate;
  final List<CartItemModal> items;

  OrderModal({
    required this.id,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    this.userId = '',
  });

  String get formattedOrderDate => EHelperFunction.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? EHelperFunction.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'orderDate': orderDate,
      'PaymentMethod': paymentMethod,
      'Address': address?.toJson(),
      'DeliveryDate': deliveryDate,
      'Items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModal.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModal(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status: OrderStatus.values.firstWhere((e) => e.toString() ==  data['Status']),
      items: (data['Items'] as List<dynamic>).map((itemData) => CartItemModal.fromJson(itemData as Map<String,dynamic>)).toList(),
      totalAmount: data['TotalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['PaymentMethod'] as String,
      address: AddressModal.fromMap(data['Address'] as Map<String,dynamic>),
      deliveryDate: data['DeliveryDate'] == null ? null : (data['DeliveryDate'] as Timestamp).toDate(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class AddressModal {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  late final bool selectedAddress;

  AddressModal({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = false,
  });

  String get formattedPhoneNo => EFormatter.formatePhoneNumber(phoneNumber);

  AddressModal copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    DateTime? dateTime,
    bool? selectedAddress,
  }) {
    return AddressModal(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      dateTime: dateTime ?? this.dateTime,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }


  static AddressModal empty() =>
      AddressModal(
          id: '',
          name: '',
          phoneNumber: '',
          street: '',
          city: '',
          state: '',
          postalCode: '',
          country: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModal.fromMap(Map<String, dynamic> data){
    return AddressModal(
      id: data['Id'] as String,
        name: data['name'] as String,
        phoneNumber: data['PhoneNumber'] as String,
        street: data['Street'] as String,
        city: data['City'] as String,
        state: data['State'] as String,
        postalCode: data['PostalCode'] as String,
      country: data['Country'] as String,
      dateTime: (data['DateTime'] as Timestamp?)?.toDate(),
      selectedAddress: data['SelectedAddress'] as bool,
    );
  }


  factory AddressModal.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String,dynamic>;
    return AddressModal(id: snapshot.id,
      name: data['name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      postalCode: data['PostalCode'] as String,
      country: data['Country'] as String,
      dateTime:  (data['DateTime'] as Timestamp?)?.toDate() ,
      selectedAddress: data['SelectedAddress'] as bool,
    );
  }

  @override
  String toString(){
    return '$street $city $state $postalCode $country';
  }

}
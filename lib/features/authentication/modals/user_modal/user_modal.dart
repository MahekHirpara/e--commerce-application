import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModal{
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModal({
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
    required this.profilePicture,

});

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => EFormatter.formatePhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  ///generate a username from the full name
  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName =nameParts[0].toLowerCase();
    String lastName = nameParts.length >1 ? nameParts[1].toLowerCase():"";

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  ///static function use empty userModal
  static UserModal empty() => UserModal(email: '', id: '', firstName: '', lastName: '', username: '', phoneNumber: '', profilePicture: '');

  ///Convert modal to JSON structure for storing data in Firebase
   Map<String,dynamic> toJson(){
     return{
       'FirstName' : firstName,
       'LastName' : lastName,
       'UserName' :username,
       'Email':email,
       'PhoneNumber' :phoneNumber,
       'ProfilePicture' : profilePicture,
     };
   }

   factory UserModal.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
     if(document.data() != null){
       final data = document.data()!;
       return UserModal(
           email: data['Email'] ?? '',
           id: document.id,
           firstName: data['FirstName'] ?? '',
           lastName: data['LastName'] ?? '',
           username: data['UserName'] ?? '',
           phoneNumber: data['PhoneNumber'] ?? '',
           profilePicture: data['ProfilePicture'] ?? ''
       );
     }
     return empty();
   }
}
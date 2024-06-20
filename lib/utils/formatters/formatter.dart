
import 'package:intl/intl.dart';

class EFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MM-YYYY').format(date);
  }

  static String formateCurrency(double amount){
    return NumberFormat.currency(locale: 'en_US',symbol: '\$').format(amount);
  }

  static String formatePhoneNumber(String phoneNumber){
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
    }else if(phoneNumber.length==11){
      return '(${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4,7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }
}
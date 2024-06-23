
import 'package:get/get.dart';

import '../features/authentication/conroller/network_manager.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}
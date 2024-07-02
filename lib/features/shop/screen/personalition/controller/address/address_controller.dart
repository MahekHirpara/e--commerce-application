import 'package:e_commerce_app/features/authentication/conroller/network_manager.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/add_new_address.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widget/loaders/processing_loader.dart';
import '../../../../../../common/widget/text/section_heading.dart';
import '../../../../../../data/repositories/address/address_repo.dart';
import '../../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../../utils/popups/loader.dart';
import '../../modal/address_modal.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> newwAddressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModal> selectedAddresses = AddressModal.empty().obs;
  final addressRepo = Get.put(AddressRepo());

  Future<List<AddressModal>> getAllUserAddress() async {
    try {
      final address = await addressRepo.fetchUserAddress();
      selectedAddresses.value = address.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModal.empty());
      return address;
    } catch (e) {
      ELoaders.errorSnackBar(
          title: 'Address not found!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModal newSelectedAddress) async {
    try {
      if (selectedAddresses.value.id.isNotEmpty) {
        await addressRepo.updateSelectedField(
            selectedAddresses.value.id, false);
      }

      newSelectedAddress = newSelectedAddress.copyWith(selectedAddress: true);
      selectedAddresses.value = newSelectedAddress;

      await addressRepo.updateSelectedField(selectedAddresses.value.id, true);
    } catch (e) {
      print(e.toString());
      ELoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      ProcessingLoader.openLoadingDialog('Processing');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ProcessingLoader.stopLoading();
        return;
      }

      if (!newwAddressFormKey.currentState!.validate()) {
        ProcessingLoader.stopLoading();
        return;
      }

      //Save data
      final address = AddressModal(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      final id = await addressRepo.addAddress(address);

      //Update Selected Address states
      address.id = id;
      selectedAddresses(address);

      ELoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address hase been saved successfully');

      //refresh Address data;
      refreshData.toggle();

      //Reset Field
      resetField();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      ELoaders.errorSnackBar(
          title: 'Address is not Saved .Please try again',
          message: e.toString());
    }
  }

  void resetField() {
    name.clear();
    phoneNumber.clear();
    postalCode.clear();
    state.clear();
    street.clear();
    city.clear();
    country.clear();
    newwAddressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(ESize.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ESectionHeading(
                    text: 'Select Address',
                    showActionbutton: false,
                  ),
                  FutureBuilder(
                      future: getAllUserAddress(),
                      builder: (_,snapshot){
                    
                        final response = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                        if(response != null )return response;
                    
                        return ListView.builder(
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_,index){
                            return ESingleAddress(address: snapshot.data![index], onTap: () async{
                              await selectAddress(snapshot.data![index]);
                              Get.back();
                            });
                            }
                        );
                      },
                    ),

                  const SizedBox(height: ESize.defaultSpace/2,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: ()=> Get.to(()=>const AddNewAddress()),child: const Text('Add new address'),),
                  )
                ],
              ),
            ),
          );
        });
  }
}

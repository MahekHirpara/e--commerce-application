import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/product/sortable/sortable_product.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/cloud_helper_function.dart';
import '../../controller/all_product_controller.dart';
import '../../modal/product_modal.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModal>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: EAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ESize.defaultSpace),
            child: FutureBuilder(
                future: futureMethod ?? controller.fetchProductByQuery(query),
                builder: (context, snapshot) {
                  const loader = EVerticalProductShimmer();
                 final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot :snapshot,loader:loader);
                 if(widget !=null) return widget;
                  final product = snapshot.data!;
                  return ESortableProducts(products: product,);
                })),
      ),
    );
  }
}

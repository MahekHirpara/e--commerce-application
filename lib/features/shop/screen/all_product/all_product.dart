import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/product/sortable/sortable_product.dart';
import '../../../../utils/constant/size.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(
        title: Text('Popular product'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESize.defaultSpace),
          child: ESortableProducts(),
        ),
      ),
    );
  }
}



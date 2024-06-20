
import 'package:e_commerce_app/features/shop/screen/order/widget/order_lists.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(ESize.defaultSpace),
        child: EOrderListItem(),
      ),
    );
  }
}

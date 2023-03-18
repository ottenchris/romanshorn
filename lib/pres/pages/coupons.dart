import 'package:flutter/material.dart';

import '../widgets/coupon_list.dart';
import '../widgets/header.dart';

class Coupons extends StatelessWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 0),
        children: [
          const HeaderLogo(),
          Text(
            "Coupons für dich",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          const CouponList(),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

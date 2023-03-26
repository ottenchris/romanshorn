import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import 'coupons.dart';
import 'discover.dart';
import 'plan.dart';
import 'search.dart';
import 'train.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;

  void changePage(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: const [
            SearchPage(),
            Coupons(),
            DiscoverPage(),
            Train(),
            PlanPage(),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNav(changePage: changePage),
    );
  }
}

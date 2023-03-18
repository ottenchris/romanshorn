import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class MyBottomNav extends StatelessWidget {
  final Function changePage;

  const MyBottomNav({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: Platform.isIOS ? 75 : 60,
      // height: 60,
      index: 2,
      backgroundColor: Colors.transparent,
      color: SCol.secondary,
      buttonBackgroundColor: SCol.primary,
      items: const <Widget>[
        Icon(Icons.search_rounded, size: 33),
        Icon(Icons.local_activity_rounded, size: 33),
        Icon(Icons.home_rounded, size: 33),
        Icon(Icons.train_rounded, size: 33),
        Icon(Icons.favorite_outline_rounded, size: 33),
      ],
      onTap: (index) {
        changePage(index);
        print(index);
      },
    );
  }
}

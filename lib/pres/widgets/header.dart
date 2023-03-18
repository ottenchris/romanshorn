import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Image.asset(
        "assets/images/logo-hafenstadt-romanshorn.png",
        height: 50,
      ),
    );
  }
}

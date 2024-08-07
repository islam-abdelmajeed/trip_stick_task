import 'package:flutter/material.dart';
import 'package:tripstick/core/themes/styles.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Featured Destination",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: Center(
        child: Text(
          "Featured Destination VC",
          style: Styles.text24Weight700Black,
        ),
      ),
    );
  }
}

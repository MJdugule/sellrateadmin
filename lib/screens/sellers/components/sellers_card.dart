import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SellersCard extends StatefulWidget {
  const SellersCard({Key? key}) : super(key: key);

  @override
  State<SellersCard> createState() => _SellersCardState();
}

class _SellersCardState extends State<SellersCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:18.0, left: 18, right: 18),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
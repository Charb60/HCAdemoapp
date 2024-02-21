import 'package:flutter/material.dart';

class AllYourProduct extends StatelessWidget {
  const AllYourProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 45),
          child: const Text(
            'รายการทรัพย์สินของคุณ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
    );
  }
}

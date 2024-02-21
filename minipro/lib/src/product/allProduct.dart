import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/product/allProductCard.dart';
import 'package:minipro/src/product/product.dart';
import 'package:minipro/src/product/productModel.dart';
import 'package:minipro/src/product/propertyCard.dart';

class AllProduct extends StatelessWidget {
  AllProduct({super.key});
  final Product product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 45),
          child: const Text(
            'รายการทรัพย์สิน',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPropertyList(
            label: 'House',
            modelProducts: product.modelHouse,
          ),
        ],
      )),
    );
  }

  Widget _buildPropertyList(
      {required String label, required List<ModelProduct> modelProducts}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              for (int index = 0; index < modelProducts.length; index++)
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 2),
                  child: AllProductCard(
                    modelProduct: modelProducts[index],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

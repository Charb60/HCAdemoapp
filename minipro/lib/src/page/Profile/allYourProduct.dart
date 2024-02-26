import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/AddProduct/addProduct.dart';
import 'package:minipro/src/product/product.dart';
import 'package:minipro/src/product/productModel.dart';
import 'package:minipro/src/product/propertyCard.dart';

class AllYourProduct extends StatelessWidget {
  AllYourProduct({super.key});
  final Product product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 45),
          child: Center(
            child: Text('รายการทรัพย์สินของคุณ',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF000000),
                )),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: _productList(),
          ),
        ),
      ),
    );
  }

  Widget _productList() {
    return Column(
      children: [
        _buildPropertyList(
          label: 'House',
          modelProducts: product.modelHouse,
        ),
        _buildPropertyList(
          label: 'Condo',
          modelProducts: product.modelCondo,
        ),
        _buildPropertyList(
          label: 'Apartment',
          modelProducts: product.modelApartment,
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 310, top: 60),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 297, top: 47),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  size: 60,
                ),
                onPressed: () {
                  Get.to(() => AddProduct(
                      productName: '',
                      selectedPriceRange: '',
                      latitude: '',
                      longitude: '',
                      selectedAreaRange: ''));
                },
              ),
            )
          ],
        )
      ],
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
          child: Row(
            children: [
              for (int index = 0; index < modelProducts.length; index++)
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 2),
                  child: PropertyCard(
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

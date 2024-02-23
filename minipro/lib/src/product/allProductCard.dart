import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/product/productModel.dart';

class AllProductCard extends StatelessWidget {
  final ModelProduct modelProduct;

  AllProductCard({required this.modelProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              modelProduct.image,
              width: 370,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(modelProduct.productName,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xFF000000),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
                modelProduct.selectedRoomRange.toString() +
                    " ห้องนอน " +
                    modelProduct.selectedBathRoomRange.toString() +
                    " ห้องน้ำ ",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: const Color(0xFF000000),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(modelProduct.selectedFloorRange.toString() + " ชั้น",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: const Color(0xFF000000),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(modelProduct.selectedLocationRange.toString(),
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: const Color(0xFF000000),
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${modelProduct.selectedAreaRange} ตร.ว',
                  style: GoogleFonts.nunito(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: modelProduct.selectedPriceRange,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color(0xFFB1C381),
                        ),
                      ),
                      const TextSpan(
                        text: ' บาท',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // );
  }
}

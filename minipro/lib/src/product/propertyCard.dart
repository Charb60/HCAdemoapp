import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/product/productModel.dart';

class PropertyCard extends StatelessWidget {
  final ModelProduct modelProduct;

  PropertyCard({required this.modelProduct});

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
              width: 170,
              height: 135,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(modelProduct.title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xFF000000),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: modelProduct.price,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: const Color(0xFFB1C381),
                    ),
                  ),
                  const TextSpan(
                    text: ' บาท',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child:
                Text('${modelProduct.area} ตร.ว , ${modelProduct.size} ตร.ม.',
                    style: GoogleFonts.nunito(
                      // fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: const Color(0xFF000000),
                    )),
          ),
        ],
      ),
    );
    // );
  }
}

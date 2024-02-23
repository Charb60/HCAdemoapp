import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minipro/src/page/Map/mapController.dart';
import 'package:minipro/src/product/productModel.dart';

class ProductDetailPage extends StatelessWidget {
  final ModelProduct modelProduct;
  final String productName;
  final String selectedPriceRange;
  final String latitude;
  final String longitude;
  final String selectedAreaRange;
  ProductDetailPage({
    Key? key,
    required this.modelProduct,
    required this.productName,
    required this.selectedPriceRange,
    required this.latitude,
    required this.longitude,
    required this.selectedAreaRange,
  });

  @override
  Widget build(BuildContext context) {
    final MapController _mapController =
        Get.put(MapController(productName, selectedPriceRange));

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 45),
          child: const Text(
            '',
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Image.asset(
                  modelProduct.image,
                  width: 350,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF0000),
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF828181),
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF828181),
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF828181),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(modelProduct.productName,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'ราคา ',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                        "${modelProduct.selectedRoomRange} ห้องนอน ${modelProduct.selectedBathRoomRange} ห้องน้ำ ",
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: const Color(0xFF000000),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                        modelProduct.selectedFloorRange.toString() + " ชั้น",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${modelProduct.productTitle}',
                      style: GoogleFonts.nunito(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Obx(
                      () => Container(
                        width: double.infinity,
                        height: 200,
                        child: GoogleMap(
                          onMapCreated: _mapController.onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _mapController.defaultLocation,
                            zoom: 11,
                          ),
                          markers: Set<Marker>.of(_mapController.markers),
                          onTap: (LatLng position) {
                            _mapController.addMarker(position);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 227.7),
                  child: Center(
                    child: Container(
                      child: Container(
                        width: 430,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF161A30),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'ติดต่อตัวแทน',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

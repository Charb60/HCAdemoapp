// import 'dart:async';
// import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
import 'package:minipro/src/AddProduct/addProductController.dart';
import 'package:minipro/src/page/Map/map.dart';
// import 'package:minipro/src/page/Map/map.dart';
import 'package:minipro/src/page/Map/mapController.dart';

class AddProduct extends StatelessWidget {
  final String name;
  final String price;
  final String latitude;
  final String longitude;
  final String area;
  // var latitude = ''.obs;
  // var longitude = ''.obs;

  AddProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.area,
  }) : super(key: key);

  final AddProductController controller = Get.put(AddProductController());

  final _dio = dio.Dio();
  final priceRangeController = TextEditingController();
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final areaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MapController _mapController = Get.put(MapController(name, price));
    // final MapController _mapController = Get.find<MapController>();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 40),
          child: const Text(
            'เพิ่มทรัพย์สินของคุณ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'อาคาร',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 155,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 25,
                    childAspectRatio: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildPropertyTypeButton('บ้าน'),
                      buildPropertyTypeButton('คอนโด'),
                      buildPropertyTypeButton('อพาร์ทเมนต์'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                height: 2,
                decoration: const BoxDecoration(
                  color: Color(0xFF666666),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Price
            Center(
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: priceRangeController,
                  onChanged: (newValue) {
                    AddProductController.selectedPriceRange.value = newValue;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'ราคา',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Room
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(
                    () => DropdownButton<String>(
                      value: AddProductController.selectedRoomRange.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          AddProductController.onRoomRangeSelected(newValue);
                        }
                        print(newValue);
                      },
                      items:
                          AddProductController.roomRange.keys.map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            '$key',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
//selectedBathroomRange
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(
                    () => DropdownButton<String>(
                      value: AddProductController.selectedBathRoomRange.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          AddProductController.onBathRoomRangeSelected(
                              newValue);
                        }
                        print(newValue);
                      },
                      items: AddProductController.bathRoomRange.keys
                          .map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            '$key',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //selectedLocationRange
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(
                    () => DropdownButton<String>(
                      value: AddProductController.selectedLocationRange.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          AddProductController.onLocationRangeSelected(
                              newValue);
                        }
                        print(newValue);
                      },
                      items: AddProductController.locationRange.keys
                          .map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            '$key',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //selectedAreaRange
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: areaController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'ขนาดพื้นที่',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //selectedFloorRange
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(
                    () => DropdownButton<String>(
                      value: AddProductController.selectedFloorRange.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          AddProductController.onFloorRangeSelected(newValue);
                        }
                        print(newValue);
                      },
                      items: AddProductController.floorRange.keys
                          .map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            '$key',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //isCheck
            Center(
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 120, 119, 119)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'อารคารที่เหมาะสำหรับสัตว์เลี้ยง',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          controller.toggleCheckbox();
                        },
                        icon: Icon(
                          AddProductController.isChecked.value
                              ? Icons.toggle_on
                              : Icons.toggle_off,
                          color: AddProductController.isChecked.value
                              ? const Color(0xFFB1C381)
                              : Colors.grey,
                          // size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'ชื่อทรัพย์สิน',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  maxLines: 3,
                  controller: titleController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'คำอธิบาย',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AddProductController.selectImage();
                    },
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Obx(
                          () {
                            return AddProductController.productImage.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: AddProductController
                                        .productImage.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(8),
                                        width: 100,
                                        height: 100,
                                        child: Image.file(
                                          AddProductController
                                              .productImage[index],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add_circle,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        'เพิ่มรูปภาพ',
                                        style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Obx(
                  () => GoogleMap(
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
            Center(
              child: Column(
                children: [
                  Obx(() =>
                      Text('Latitude: ${AddProductController.latitude.value}')),
                  Obx(() => Text(
                      'Longitude: ${AddProductController.longitude.value}')),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => MapScreen(
                            name: '',
                            price: '',
                            onLocationSelected: (LatLng location) {
                              AddProductController.latitude.value =
                                  location.latitude.toString();
                              AddProductController.longitude.value =
                                  location.longitude.toString();
                            },
                          ));
                    },
                    child: Text('Select Location'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB1C381),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 120, 119, 119)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () async {
                        AddProductController.selectedPriceRange.value =
                            priceRangeController.text;
                        AddProductController.productName.value =
                            nameController.text;
                        AddProductController.productTitle.value =
                            titleController.text;
                        // print('Get FormData');
                        // print(await controller.getFormData());

                        final dio.FormData formDataArgs = dio.FormData.fromMap(
                            await controller.getFormData());

                        print('Get FormData');
                        print(await controller.getFormData());

                        try {
                          // final response = await _dio.post(
                          //   // "http://192.168.84.58:8080/api/v1/addproduct",
                          //   "http://10.0.2.2:8080/api/v1/addproduct",
                          //   data: formDataArgs,
                          // );

                          final response = await _dio.post(
                            // "http://192.168.84.58:8080/api/v1/product-and-image",

                            "http://10.0.2.2:8080/api/v1/product-and-image",
                            data: formDataArgs,
                            options: Options(
                              headers: {'Content-Type': 'multipart/form-data'},
                            ),
                          );

                          if (response.statusCode == 200) {
                            print('Success: ${response.data}');
                          } else {
                            print('Error: ${response.statusCode}');
                          }
                        } catch (error) {
                          print('Error: $error');
                        }
                      },
                      child: Text(
                        'อัปโหลด',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF000000)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D1C3),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 120, 119, 119)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'ล้าง',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF000000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildPropertyTypeButton(String propertyType) {
  return Obx(
    () => ElevatedButton(
      onPressed: () async {
        AddProductController.onPropertyTypeSelected(propertyType);
        print(propertyType);
      },
      style: ElevatedButton.styleFrom(
        primary: AddProductController.selectedPropertyType.value == propertyType
            ? const Color(0xFFB1C381)
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        propertyType,
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}

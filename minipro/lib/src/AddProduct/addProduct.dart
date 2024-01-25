import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  static Map<String, String> propertyTypeValues = {
    'บ้าน': '1',
    'คอนโด': '2',
    'อพาร์ทเมนต์': '3',
  };

  static Map<String, String> roomRange = {
    '1 ห้องนอน': '1',
    '2 ห้องนอน': '2',
    '3 ห้องนอน': '3',
    '4 ห้องนอน': '4',
  };
  static Map<String, String> bathRoomRange = {
    '1 ห้องน้ำ': '1',
    '2 ห้องน้ำ': '2',
    '3 ห้องน้ำ': '3',
    '4 ห้องน้ำ': '4',
  };
  static Map<String, String> locationRange = {
    'กทม.': '1',
    'เชียงใหม่': '2',
    'ภูเก็ต': '3',
    'ชลบุรี': '4',
  };
  static Map<String, String> areaRange = {
    '14 ตร.ว.': '1',
    '17 ตร.ว.': '2',
  };
  static Map<String, String> floorRange = {
    '1 ชั้น': '1',
    '2 ชั้น': '2',
    '3 ชั้น': '3',
  };

  Map<String, dynamic> getFormData() {
    return {
      'selectedPropertyType': AddProductController.selectedPropertyType.value,
      'selectedRoomRange': AddProductController.selectedRoomRange.value,
      'selectedBathroomRange': AddProductController.selectedBathRoomRange.value,
      'selectedLocationRange': AddProductController.selectedLocationRange.value,
      'selectedAreaRange': AddProductController.selectedAreaRange.value,
      'selectedFloorRange': AddProductController.selectedFloorRange.value,
      'isChecked': AddProductController.isChecked.value,
    };
  }

  static RxString selectedPropertyType = ''.obs;
  static RxString selectedRoomRange = '1 ห้องนอน'.obs;
  static RxString selectedBathRoomRange = '1 ห้องน้ำ'.obs;
  static RxString selectedLocationRange = 'กทม.'.obs;
  static RxString selectedAreaRange = '14 ตร.ว.'.obs;
  static RxString selectedFloorRange = '2 ชั้น'.obs;
  static RxBool isChecked = false.obs;

  static RxList<File> selectedImages = <File>[].obs;

  static void selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
      print('Image selected: ${selectedImages.last.path}');
    }
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    print(isChecked);
  }

  static void onPropertyTypeSelected(String propertyType) {
    selectedPropertyType.value = propertyType;
  }

  static void onRoomRangeSelected(String roomRange) {
    selectedRoomRange.value = roomRange;
  }

  static void onBathRoomRangeSelected(String bathRoomRange) {
    selectedBathRoomRange.value = bathRoomRange;
  }

  static void onLocationRangeSelected(String locationRange) {
    selectedLocationRange.value = locationRange;
  }

  static void onAreaRangeSelected(String areaRange) {
    selectedAreaRange.value = areaRange;
  }

  static void onFloorRangeSelected(String floorRange) {
    selectedFloorRange.value = floorRange;
  }
}

class AddProduct extends StatelessWidget {
  final AddProductController controller = Get.put(AddProductController());
  final _dio = dio.Dio();
  final priceRangeController = TextEditingController();
  final nameController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                            style: TextStyle(
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
                            style: TextStyle(
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
                            style: TextStyle(
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
                  child: Obx(
                    () => DropdownButton<String>(
                      value: AddProductController.selectedAreaRange.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          AddProductController.onAreaRangeSelected(newValue);
                        }
                        print(newValue);
                      },
                      items:
                          AddProductController.areaRange.keys.map((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(
                            '$key',
                            style: TextStyle(
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
                            style: TextStyle(
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
                            return AddProductController
                                    .selectedImages.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: AddProductController
                                        .selectedImages.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(8),
                                        width: 100,
                                        height: 100,
                                        child: Image.file(
                                          AddProductController
                                              .selectedImages[index],
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(
                    Icons.add_location_alt_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                  Text(
                    'แผนที่',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
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
                        String selectedPriceRangeValue =
                            priceRangeController.text;
                        String nameValue = nameController.text;
                        String titleValue = titleController.text;
                        final dio.FormData formDataArgs =
                            dio.FormData.fromMap(controller.getFormData());

                        final args = {
                          'selectedPropertyType':
                              AddProductController.selectedPropertyType.value,
                          'selectedPriceRange': selectedPriceRangeValue,
                          'selectedRoomRange':
                              AddProductController.selectedRoomRange.value,
                          'selectedBathroomRange':
                              AddProductController.selectedBathRoomRange.value,
                          'selectedLocationRange':
                              AddProductController.selectedLocationRange.value,
                          'selectedAreaRange':
                              AddProductController.selectedAreaRange.value,
                          'selectedFloorRange':
                              AddProductController.selectedFloorRange.value,
                          'isChecked': AddProductController.isChecked.value,
                          'productName': nameValue,
                          'productTitle': titleValue,
                        };

                        try {
                          final response = await _dio.post(
                            "http://192.168.84.58:8080/api/v1/addproduct",
                            data: args,
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
                  SizedBox(
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

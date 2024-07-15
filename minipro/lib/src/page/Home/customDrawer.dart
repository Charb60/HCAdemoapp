import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/AddProduct/addProductController.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  final _dio = Dio();

  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());

    final priceRangeController = TextEditingController();
    final nameController = TextEditingController();
    final titleController = TextEditingController();
    final areaController = TextEditingController();

    return Drawer(
      width: 340,
      child: Container(
        color: const Color(0xFFFFF7D4),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "ตัวเลือกการค้นหา",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "อาคาร",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 265,
                    height: 135,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
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
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
                height: 2,
                decoration: const BoxDecoration(
                  color: Color(0xFF666666),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
                height: 40,
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: areaController,
                  onChanged: (newValue) {
                    AddProductController.selectedAreaRange.value = newValue;
                  },
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 265,
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
                          fontSize: 13,
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF9BB8CD),
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
                        final rs = await _dio.get(
                          // "http://192.168.84.58:8080/api/v1/product-and-image",
                          "http://10.0.2.2:8080/api/v1/products",
                          options: Options(responseType: ResponseType.stream),
                        );
                        print(rs.data.stream);
                      },
                      child: Text(
                        'ค้นหา',
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
                      onPressed: () {
                        AddProductController.clearSelectedData();
                        priceRangeController.text = '';
                        nameController.text = '';
                        titleController.text = '';
                      },
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
          ],
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
        backgroundColor: AddProductController.selectedPropertyType.value == propertyType
            ? const Color(0xFF9BB8CD)
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        propertyType,
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Color(0xFF000000),
          ),
        ),
      ),
    ),
  );
}

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
  // static Map<String, String> areaRange = {
  //   '14 ตร.ว.': '1',
  //   '17 ตร.ว.': '2',
  // };
  static Map<String, String> floorRange = {
    '1 ชั้น': '1',
    '2 ชั้น': '2',
    '3 ชั้น': '3',
  };

  Future<Map<String, dynamic>> getFormData() async {
    return {
      "productData": json.encode({
        'selectedPropertyType': AddProductController.selectedPropertyType.value,
        'selectedPriceRange': AddProductController.selectedPriceRange.value,
        'selectedRoomRange': AddProductController.selectedRoomRange.value,
        'selectedBathRoomRange':
            AddProductController.selectedBathRoomRange.value,
        'selectedLocationRange':
            AddProductController.selectedLocationRange.value,
        'selectedAreaRange': AddProductController.selectedAreaRange.value,
        'selectedFloorRange': AddProductController.selectedFloorRange.value,
        'isChecked': AddProductController.isChecked.value,
        'productName': AddProductController.productName.value,
        'productTitle': AddProductController.productTitle.value,
        'latitude': AddProductController.latitude.value,
        'longitude': AddProductController.longitude.value,
      }),
      // "productImage": await dio.MultipartFile.fromFile(
      //   AddProductController.productImage.last.absolute.path,
      //   filename: 'image.jpg',
      // )
      "productImage": AddProductController.productImage
          .map((file) =>
              MultipartFile(file.absolute.path, filename: 'image.jpg'))
          .toList()

      // "productImage": AddProductController.productImage.map((file) {
      //   return dio.MultipartFile.fromFileSync(
      //     file.path,
      //     filename: 'image.jpg',
      //   );
      // }).toList()

      // "productImage": productImage
      //     .map((file) => MultipartFile.fromFileSync(
      //           file.path,
      //           filename: file.path.split('/').last,
      //         ))
      //     .toList(),
    };
  }

  static RxString selectedPropertyType = ''.obs;
  static RxString selectedPriceRange = ''.obs;
  static RxString selectedRoomRange = '1 ห้องนอน'.obs;
  static RxString selectedBathRoomRange = '1 ห้องน้ำ'.obs;
  static RxString selectedLocationRange = 'กทม.'.obs;
  // static RxString selectedAreaRange = '14 ตร.ว.'.obs;
  static RxString selectedAreaRange = ''.obs;
  static RxString selectedFloorRange = '2 ชั้น'.obs;
  static RxBool isChecked = false.obs;
  static RxString productName = ''.obs;
  static RxString productTitle = ''.obs;
  static RxString latitude = ''.obs;
  static RxString longitude = ''.obs;

  static RxList<File> productImage = <File>[].obs;

  static void selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      productImage.add(File(pickedFile.path));
      print('Image selected: ${productImage.last.path}');
    }
  }

  void toggleCheckbox() {
    final animals = 'เหมาะสำหรับสัตว์เลี้ยง';
    final noAnimals = 'ไม่เหมาะสำหรับสัตว์เลี้ยง';

    isChecked.value = !isChecked.value;
    if (isChecked == true) {
      true == animals;
      print(animals);
    } else {
      false == noAnimals;
      print(noAnimals);
    }
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

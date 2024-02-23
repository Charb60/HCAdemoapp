// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

class MapController extends GetxController {
  // final markers = <Marker>{}.obs;
  // final LatLng center = const LatLng(13.736717, 100.523186);

  // void addMarker(LatLng position) {
  //   markers.add(
  //     Marker(
  //       markerId: MarkerId(position.toString()),
  //       position: position,
  //       infoWindow: InfoWindow(title: 'New Marker'),
  //     ),
  //   );
  // }
// }

  late GoogleMapController mapController;
  late String productName;
  late String selectedPriceRange;

  final LatLng center = const LatLng(13.736717, 100.523186);
  final LatLng defaultLocation = const LatLng(13.736717, 100.523186);

  // late LatLng _lastMapPosition = center;

  final markers = <Marker>{}.obs;

  final Dio dio = Dio();
  MapController(this.productName, this.selectedPriceRange);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onMapTap(LatLng position) {
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(
          title: productName,
          snippet:
              // 'ละติจูด: ${position.latitude}\nลองจิจูด: ${position.longitude}\nราคา: $price',
              'ราคา: $selectedPriceRange',
        ),
      ),
    );
  }

  void addMarker(LatLng position) {
    // final marker = Marker(
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(
          title: productName,
          // snippet: snippet,
          snippet: 'ราคา: $selectedPriceRange',
        ),
      ),
    );

    // markers.add(marker);
  }
  // Future<Map<String, dynamic>> getFormData() async {
  //   return {
  //     'name': name,
  //     'price': price,
  //   };
  // }
}

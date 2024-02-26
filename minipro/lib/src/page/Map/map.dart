import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minipro/src/page/Map/mapController.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:dio/dio.dart';

class MapScreen extends StatefulWidget {
  final String name;
  final String price;
  final ValueChanged<LatLng> onLocationSelected;

  const MapScreen(
      {Key? key,
      required this.name,
      required this.price,
      required this.onLocationSelected})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController mapController;
  late LatLng position;

  @override
  void initState() {
    super.initState();
    mapController = MapController(widget.name, widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกที่ตั้งของคุณ',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color(0xFFFFFFFF),
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // ส่งค่าพิกัดกลับไปยังหน้าที่เรียกใช้
              widget.onLocationSelected(position);
              Navigator.pop(context); // ปิดหน้า MapScreen
            },
          ),
        ],
        backgroundColor: const Color(0xFF9bb8cd),
      ),
      body: GoogleMap(
        onMapCreated: mapController.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: mapController.center,
          zoom: 11.0,
        ),
        markers: mapController.markers.toSet(),
        onTap: (LatLng tappedPosition) {
          position = tappedPosition;
          mapController.onMapTap(tappedPosition);
          setState(() {});
        },
      ),
    );
  }
}

class ModelProduct {
  final String image;
  final String selectedPropertyType;
  final String selectedPriceRange;
  final int selectedAreaRange;
  final int selectedRoomRange;
  final int selectedBathRoomRange;
  final String selectedLocationRange;
  final int selectedFloorRange;
  final int isChecked;
  final String productName;
  final String productTitle;
  final double latitude;
  final double longitude;

  ModelProduct({
    required this.image,
    required this.selectedPropertyType,
    required this.selectedPriceRange,
    required this.selectedAreaRange,
    required this.selectedRoomRange,
    required this.selectedBathRoomRange,
    required this.selectedLocationRange,
    required this.selectedFloorRange,
    required this.isChecked,
    required this.productName,
    required this.productTitle,
    required this.latitude,
    required this.longitude,
  });
}

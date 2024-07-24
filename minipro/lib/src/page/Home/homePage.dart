import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro/src/AddProduct/addProduct.dart';
import 'package:minipro/src/Controller/mainController.dart';
import 'package:minipro/src/ProductDetailPage/productDetailPage.dart';
import 'package:minipro/src/page/ChatPage/Chat.dart';
import 'package:minipro/src/page/Home/customDrawer.dart';
import 'package:minipro/src/page/Profile/profilePage.dart';
import 'package:minipro/src/product/allProduct.dart';
import 'package:minipro/src/product/product.dart';
import 'package:minipro/src/product/productModel.dart';
import 'package:minipro/src/product/propertyCard.dart';

class HomePage extends StatelessWidget {
  final Product product = Product();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final RxList<ModelProduct> _filteredProducts = <ModelProduct>[].obs;

  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    _filteredProducts.addAll(product.modelHouse);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 0, top: 40, bottom: 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'HCADemo',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 156),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/addhouse.png',
                              width: 40,
                              height: 40,
                            ),
                            onPressed: () {
                              Get.to(() => AddProduct(
                                    productName: "",
                                    selectedPriceRange: "",
                                    latitude: "",
                                    longitude: "",
                                    selectedAreaRange: "",
                                  ));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 15),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/account.png',
                              width: 40,
                              height: 40,
                            ),
                            onPressed: () {
                              Get.to(() => const Profile());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _searchBox(),
                      const SizedBox(width: 8),
                      _searchFilter(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => _buildPropertyList(
                label: 'รายการทั้งหมด',
                allBT: '1',
                modelProducts: _filteredProducts,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyList(
      {required String label,
      required String allBT,
      required List<ModelProduct> modelProducts}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xFF000000),
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     Get.to(() => AllProduct(categoryType: allBT));
              //     print(allBT.toString());
              //   },
              //   child: Text(
              //     'All',
              //     style: GoogleFonts.nunito(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 15,
              //       color: const Color(0xFF000000),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // child: Row(
          child: Column(
            children: [
              for (int index = 0; index < modelProducts.length; index++)
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 2),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailPage(
                            modelProduct: modelProducts[index],
                            productName: '',
                            selectedPriceRange: '',
                            latitude: '',
                            longitude: '',
                            selectedAreaRange: '',
                          ));
                    },
                    child: PropertyCard(
                      modelProduct: modelProducts[index],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchBox() {
    return Container(
      width: 315,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Search',
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintStyle: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
          prefixIcon: const SizedBox(width: 5),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF515050),
            ),
            onPressed: _performSearch,
          ),
        ),
      ),
    );
  }

  Widget _searchFilter() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 119, 119).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: IconButton(
          icon: Image.asset(
            'assets/filter.png',
            width: 50,
            height: 50,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openEndDrawer();
          },
        ),
      ),
    );
  }

  void _performSearch() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      String query = _searchController.text.toLowerCase().replaceAll(' ', '');
      List<ModelProduct> results = [];

      results.addAll(product.modelHouse.where((product) {
        String productName =
            product.productName.toLowerCase().replaceAll(' ', '');
        return productName.contains(query);
      }));

      results.addAll(product.modelCondo.where((product) {
        String productName =
            product.productName.toLowerCase().replaceAll(' ', '');
        return productName.contains(query);
      }));

      results.addAll(product.modelApartment.where((product) {
        String productName =
            product.productName.toLowerCase().replaceAll(' ', '');
        return productName.contains(query);
      }));

      _filteredProducts.assignAll(results);
    });
  }

  Widget _buildDrawer() {
    return CustomDrawer(
      onSearch: _performSearch,
    );
  }
}

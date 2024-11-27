import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_control_app/view/products/products_lists.dart';
import 'package:stock_control_app/view/search/search.dart';
import 'package:stock_control_app/view/stock_count/stock_count.dart';
import 'package:stock_control_app/view/stock_in/array.dart';
import 'package:stock_control_app/view/stock_in/stock_in.dart';
import 'package:stock_control_app/view/stock_out/stock_out.dart';
import 'package:stock_control_app/widget/appbar.dart';
import 'package:stock_control_app/widget/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //AUTO SIZE OF DEVIEC
  Widget firstRowWithThreeBox(double size) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _cardComponent(
          onPressed: () {Get.to(StockInScreen());},
          title: "Stock In",
          img: 'assets/images/stock_in_4.png'),
      _cardComponent(
          onPressed: () {Get.to(StockOutScreen());},
          title: "Stock Out",
          img: 'assets/images/stock_out_3.png'),
    ]);
  }

  Widget secondRowWithThreeBoxs(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _cardComponent(
          onPressed: () {
            Get.to(StockCountScreen());
            },
          title: "Stock Count",
          img: 'assets/images/stock_count_1.png',
        ),
        _cardComponent(
            onPressed: () {
              Get.to(ProductsListScreen());
            },
            title: "Products List",
            img: 'assets/images/products_list.png'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double lengthOfDevice = MediaQuery.of(context).size.width;
    return Scaffold(
  appBar: customAppBar(enableLeading: true),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                MediaQuery.of(context).size.width < 600
                    ? Column(
                        children: [
                          firstRowWithThreeBox(90),
                          SizedBox(height: 5),
                          secondRowWithThreeBoxs(90),
                        ],
                      )
                    : Column(
                        children: [
                          firstRowWithThreeBox(110),
                          SizedBox(height: 5),
                          secondRowWithThreeBoxs(110),
                        ],
                      ),
              ],
            ),
          ),
          SizedBox(height: 20), // Added space between sections
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true, // Ensures GridView takes only needed space
              physics: NeverScrollableScrollPhysics(), // Disables scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: productData.length,
              itemBuilder: (context, index) {
                return Cart(data: productData[index]);
              },
            ),
          ),
        ],
      ),
    ),
  ),
);

  }
}

Widget _cardComponent({
  required String img,
  required String title,
  required VoidCallback onPressed,
}) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 90,
      height: 100,
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Displaying the image
            Image.asset(
              img,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              color: Colors.red,
            ),
            const SizedBox(height: 8), // Space between image and text
            FittedBox(
              fit: BoxFit.fitWidth,
              child: textComponent(
                text: title,
                color: Colors.red,
                size: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CardOverviewMenu() {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.dehaze_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Stock Manager",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.clear),
                  //labelText: 'Search',
                  hintText: 'Find stocks by name',
                  //helperText: 'Find stocks by name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            // Add widgets here as needed
          ],
        ),
      ],
    ),
  );
}

// Widget for displaying each product
class Cart extends StatelessWidget {
  final Map<String, String> data;

  const Cart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(0, 3),
            )
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    child: Image.network(
                      data["imageUrl"]!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text("ID: ${data["id"]}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Name: ${data["name"]}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Color: ${data["color"]}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Size: ${data["size"]}"),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  data["price"]!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

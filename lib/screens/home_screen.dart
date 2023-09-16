import 'package:flutter/material.dart';
import 'package:shopping_app/page_list/cart_list.dart';
import 'package:shopping_app/page_list/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [
    ProductListPage(),
    CartListPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32.0,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: currentPage,
        onTap: (val) {
          setState(() {
            currentPage = val;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

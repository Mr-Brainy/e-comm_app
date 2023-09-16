import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../products_card.dart';
import '../screens/product_detail_screens.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  TextEditingController textController = TextEditingController();
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.0,
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(23.0),
    ),
  );
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Beta'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Text(
                  'Shoes\n Collection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17.0,
                        vertical: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 1080.0) {
                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailScreen(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCards(
                        backgroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                        title: product['title'].toString(),
                        price: product['price'] as double,
                        imagePath: product['imageUrl'].toString(),
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailScreen(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCards(
                        backgroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                        title: product['title'].toString(),
                        price: product['price'] as double,
                        imagePath: product['imageUrl'].toString(),
                      ),
                    );
                  }),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

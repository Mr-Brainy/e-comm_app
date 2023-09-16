import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

import 'screens/home_screen.dart';

void main() {
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping App',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              centerTitle: true,
            ),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}

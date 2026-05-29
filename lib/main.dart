import 'package:flutter/material.dart';

import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Page',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F67F6)),
        // Dirty/off-white background (less bright than pure white)
        scaffoldBackgroundColor: const Color(0xFFF7F5F2),
      ),
      home: const ProductPage(),
    );
  }
}

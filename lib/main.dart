import 'package:flutter/material.dart';

import 'components/masked_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: MaskedImage(asset: "assets/images/posters/img-eternals.jpg", mask: "assets/mask/mask.png"),
      ),
    );
  }
}

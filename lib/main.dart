import 'package:flutter/material.dart';
import 'category_screen.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: CategoryScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

final _backGroundColor = Colors.green[100];

/// Category Screen.
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
class CategoryScreen extends StatefulWidget {
  const CategoryScreen();

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _categories = <Category>[];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we use a [ListView].
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) => categories[index],
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backGroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: _buildCategoryWidgets(_categories),
    );

    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: _backGroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

  @override
  void initState() {
    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
        name: _categoryNames[i],
        icon: Icons.cake,
        color: _baseColors[i],
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    super.initState();
  }
}

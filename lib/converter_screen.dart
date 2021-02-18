import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
class ConverterScreen extends StatelessWidget {
  /// Units for this [Category]
  final List<Unit> units;
  final String title;
  final Color color;

  /// This [ConverterScreen] requires the color and units to not be null.
  // TODO: Pass in the [Category]'s color
  const ConverterScreen({
    @required this.units,
    @required this.title,
    @required this.color,
  })  : assert(units != null),
        assert(title != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      // TODO: Set the color for this Container
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                unit.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                'Conversion: ${unit.conversion}',
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(this.title),
          backgroundColor: this.color,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: _navigateToConverter(context),
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }

  /// Navigates back to the [CategoryScreen].
  void _navigateToConverter(BuildContext context) {
    Navigator.pop(context);
  }
}

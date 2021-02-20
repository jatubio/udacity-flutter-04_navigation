import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
class ConverterScreen extends StatefulWidget {
  /// Units for this [Category]
  final List<Unit> units;
  final String title;
  final Color color;

  /// This [ConverterScreen] requires the color and units to not be null.
  const ConverterScreen({
    @required this.units,
    @required this.title,
    @required this.color,
  })  : assert(units != null),
        assert(title != null),
        assert(color != null);

  @override
  State<StatefulWidget> createState() {
    return _ConverterScreenState();
  }
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color.withOpacity(0.4),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      body: ListView(
        children: unitWidgets,
      ),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          _navigateToConverter(context);
        },
      ),
    );
  }

  /// Navigates back to the [CategoryScreen].
  void _navigateToConverter(BuildContext context) {
    Navigator.pop(context);
  }
}

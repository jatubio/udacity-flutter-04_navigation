import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

import 'unit.dart';
import 'converter_screen.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final List<Unit> units;

  /// Navigates to the [ConverterScreen].
  void _navigateToConverter(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterScreen]
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ConverterScreen(
            units: units,
            title: name,
            color: color,
          ),
        ),
      ),
    );
  }

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
  const Category({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(icon != null),
        assert(color != null),
        assert(units != null),
        super(key: key);

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html  Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          height: _rowHeight,
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color,
            splashColor: color,
            // TODO: Update this onTap property to call _navigateToConverter()
            onTap: () {
              _navigateToConverter(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    this.icon,
                    size: 60,
                  ),
                ),
                Center(
                  child: Text(
                    "$name",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

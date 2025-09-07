import 'package:flutter/material.dart';

class stardisplay extends StatefulWidget {
  final rating;
  const stardisplay({super.key, this.rating});

  @override
  State<stardisplay> createState() => _stardisplayState();
}

class _stardisplayState extends State<stardisplay> {
  Widget staricon(bool fill) {
    return Icon(
      Icons.star,
      size: 16,
      color: fill ? Colors.black : Colors.black26,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          if (index < (widget.rating).round()) {
            return staricon(true);
          } else {
            return staricon(false);
          }
        }));
  }
}
//- The widget displays a row of 5 stars.
// - The number of filled stars is based on the rating.
// - There’s a bug in the else block where stars aren't returned.
// - Also, filled and unfilled stars look the same due to identical color
// difference of returning sccafold vs row
//- Use Row alone when you're embedding the star display inside another widget.
// - Use Scaffold when you're building a complete screen and want to include your star display as part of it.

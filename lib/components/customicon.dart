import 'package:flutter/material.dart';

class customicons extends StatelessWidget {
  final double radius;
  final IconData icon;
  final Color color;
  final Color iconcolor;
  const customicons(
      {super.key,
      required this.radius,
      required this.icon,
      this.color = Colors.white,
      this.iconcolor = Colors.black45});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Center(
        child: Icon(
          icon,
          color: iconcolor,
        ),
      ),
    );
  }
}

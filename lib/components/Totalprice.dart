import 'package:flutter/material.dart';

class totalprice extends StatefulWidget {
  const totalprice({super.key});

  @override
  State<totalprice> createState() => _totalpriceState();
}

class _totalpriceState extends State<totalprice> {
  bool isswitch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black45)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Display total price",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                Text(
                  "Include all fees before the taxes",
                  style: TextStyle(color: Colors.black45, fontSize: 15),
                ),
              ],
            ),
            Switch(
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                value: isswitch,
                onChanged: (value) {
                  setState(() {
                    isswitch = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}

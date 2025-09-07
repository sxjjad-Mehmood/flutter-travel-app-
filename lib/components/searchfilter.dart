import 'package:flutter/material.dart';

class searchfilter extends StatelessWidget {
  const searchfilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(blurRadius: 7, color: Colors.black38)],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "where To",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Anywhere,Any wek , Add guests",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 13),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            width: 8,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.tune,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

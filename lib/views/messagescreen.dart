import 'package:airbnbproject/Models/Message.dart';
import 'package:airbnbproject/components/customicon.dart';
import 'package:flutter/material.dart';

class messagescreen extends StatefulWidget {
  const messagescreen({super.key});

  @override
  State<messagescreen> createState() => _messagescreenState();
}

class _messagescreenState extends State<messagescreen> {
  List<String> messagetype = ["All", "Travelling", "Support"];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(),
                Spacer(),
                customicons(
                  radius: 23,
                  icon: Icons.search,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 10,
                ),
                customicons(
                  radius: 23,
                  icon: Icons.tune,
                  color: Colors.black12,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Message",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      messagetype.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 12),
                                decoration: BoxDecoration(
                                    color: selectedindex == index
                                        ? Colors.black
                                        : Colors.black12.withOpacity(0.04)),
                                child: Text(
                                  messagetype[index],
                                  style: TextStyle(
                                      color: selectedindex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )),
                )),
            SizedBox(
              height: 10,
            ),
            ...messages.map((message) => buildMessageItem(message)),
            // What does buildMessageItem(message) turn into?
            //
            // It turns into a custom message card widget made of:
            // - Padding
            // - Row
            // - Stack (with image and avatar)
            // - Flexible Column (with text info)
            //   - messages.map(...):
            // Turns each string into a custom card  widget using buildMessageItem.
            // - ...:
            // Spreads those widgets into the children list of the Column.
          ],
        ),
      )),
    );
  }

  Widget buildMessageItem(Message message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 80,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(message.image), fit: BoxFit.cover)),
              ),
              Positioned(
                  bottom: -10,
                  right: -18,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(message.vendorImage),
                    radius: 20,
                  ))
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message.name,
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  Text(message.date,
                      style: TextStyle(color: Colors.black54, fontSize: 17))
                ],
              ),
              Text(
                message.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
              Text(
                message.duration,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontSize: 17, height: 1.4, color: Colors.black54),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

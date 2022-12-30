import 'package:flutter/material.dart';

import '../constants.dart';

class SeatsComponent extends StatefulWidget {
  final int index;
  final String status;

  const SeatsComponent(
      {Key? key, required this.index, this.status = "available"})
      : super(key: key);

  @override
  State<SeatsComponent> createState() => _SeatsComponentState();
}

class _SeatsComponentState extends State<SeatsComponent> {
  Color color1 = Color.fromARGB(255, 255, 220, 19);
  Color color2 = Color.fromARGB(255, 230, 172, 0);
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!selected) {
          if (widget.status == "available") {
            setState(() {
              selected = true;
              color1 = Color(0xFF49BCE3);
              color2 = Color.fromARGB(255, 37, 114, 140);
            });
          }
        } else {
          setState(() {
            selected = false;
            color1 = Color.fromARGB(255, 255, 220, 19);
            color2 = Color.fromARGB(255, 230, 172, 0);
          });
        }
      },
      child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            gradient: (widget.status == "available")
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        color1,
                        color2,
                      ])
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color.fromARGB(255, 148, 7, 75),
                        Color.fromARGB(255, 56, 2, 28),
                      ]),
            boxShadow: [
              BoxShadow(
                color: Color(0x4D85BE01),
                spreadRadius: 0,
                blurRadius: 34,
                offset: Offset(0, 10),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(25),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "# " + widget.index.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ))),
    );
  }
}

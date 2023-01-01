import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentum/momentum.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';

class StadiumWidget extends StatelessWidget {
  final id;
  final name;
  final shape;
  final seatsCount;
  final vipLounge;
  final stadiumMatches;

  const StadiumWidget({
    Key? key,
    this.id = 0,
    this.name = "Al Bayt Stadium",
    this.shape = "rectangular",
    this.seatsCount = 60000,
    this.vipLounge,
    this.stadiumMatches,
  }) : super(key: key);

  Future<void> _submit(context) async {
    // _tryConnection();

    // if (_isConnectionSuccessful != false) {
    await Momentum.controller<StadiumController>(context)
        .deleteStadium(context, id);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    String imagename = "";
    if (stadiumNames.contains(name)) {
      imagename = name.replaceAll(' ', '');
    } else if (shape == "rectangular") {
      imagename = "AlBaytStadium";
    } else {
      imagename = "LusailStadium";
    }
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFBFBFE),
                  Color(0xFFECEFFD),
                ])),
        margin: EdgeInsets.only(
          top: _height * 0.05,
          bottom: _height * 0.05,
          left: _width * 0.05,
          right: _width * 0.05,
        ),
        height: _height * 0.2,
        width: _width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "lib/assets/" + imagename + ".webp",
              height: _height * 0.4,
              width: _width * 0.4,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Color(0xFF3F3F3F),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shape: ",
                  style: TextStyle(
                      color: primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  shape,
                  style: TextStyle(
                    color: Color(0xFF3F3F3F),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Seats: ",
                  style: TextStyle(
                      color: primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  seatsCount.toString(),
                  style: TextStyle(
                    color: Color(0xFF3F3F3F),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        fixedSize: Size(_width * 0.07, _height * 0.04)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit),
                        Text("Edit"),
                      ],
                    )),
                ElevatedButton(
                    // style: ,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      _submit(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete_forever_outlined),
                        Text("Remove"),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}

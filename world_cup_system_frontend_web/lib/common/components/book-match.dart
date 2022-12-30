import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class BookTicket extends StatelessWidget {
  final firstTeam;
  final secondTeam;
  final stadium;
  final dateTime;
  final mainReferee;
  final firstLinesman;
  final secondLinesman;
  final vip;

  const BookTicket(
      {Key? key,
      this.firstTeam = "Egypt",
      this.secondTeam = "Saudi arabia",
      this.stadium = "Suez stadium",
      this.dateTime = 'yyyy-MM-dd – kk:mm',
      this.mainReferee = "Mehrez",
      this.firstLinesman = "Tata",
      this.secondLinesman = "Kiwi",
      this.vip = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
        height: _height * 0.2,
        width: _width * 0.7,
        margin: EdgeInsets.only(
          top: _height * 0.01,
          bottom: _height * 0.01,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFBFBFE),
              Color(0xFFECEFFD),
            ])),
        child: AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.shopping_bag_outlined),
              Text(
                "Add Tickets to Cart",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primary, fontSize: 22),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [Text("data")],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Return'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/new-creditcard-sheet.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/vip-ticket-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/vip-lounge-type.dart';

import '../constants.dart';

class SeatsComponent extends StatefulWidget {
  final id;
  final String status;
  final firstTeam;
  final secondTeam;
  final stadium;
  final dateTime;
  final mainReferee;
  final firstLinesman;
  final secondLinesman;
  final ticketno;
  final name;
  final matchId;
  final price;
  final VipLounge vipLounge;

  const SeatsComponent(
      {Key? key,
      this.status = "available",
      this.firstTeam,
      this.secondTeam,
      this.stadium,
      this.dateTime,
      this.mainReferee,
      this.firstLinesman,
      this.secondLinesman,
      this.ticketno,
      required this.vipLounge,
      this.name,
      this.id,
      this.matchId,
      this.price})
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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () {
        if (widget.status == "available")
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: primary,
              insetPadding: EdgeInsets.all(0),
              content: NewCreditCardView(
                  ticketId: widget.id,
                  matchId: widget.matchId,
                  price: widget.price),
            ),
          );
      },
      child: Container(
          height: 0.05 * _height,
          width: 0.05 * _width,
          decoration: BoxDecoration(
            gradient: (widget.status.toString() == "available")
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
                  fontSize: 0.011 * _height,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "# " + widget.ticketno.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.011 * _height,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ))),
    );
  }
}

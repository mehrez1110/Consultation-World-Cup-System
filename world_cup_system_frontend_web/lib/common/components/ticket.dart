import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';

class Ticket extends StatelessWidget {
  final firstTeam;
  final secondTeam;
  final stadium;
  final dateTime;
  final mainReferee;
  final firstLinesman;
  final secondLinesman;
  final ticketno;
  final name;
  final vip;

  const Ticket(
      {Key? key,
      this.firstTeam = "Egypt",
      this.secondTeam = "Saudi arabia",
      this.stadium = "Suez stadium",
      this.dateTime = 'yyyy-MM-dd – kk:mm',
      this.mainReferee = "Mehrez",
      this.firstLinesman = "Tata",
      this.secondLinesman = "Kiwi",
      this.ticketno = 20,
      this.name = "Mustafa Usama",
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Name ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                      fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            Column(
              children: [
                Text(
                  'Ticket No. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ticketno.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: primary),
                ),
              ],
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            Text(
              dateTime,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFEC310),
              ),
              onPressed: () {},
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(Icons.ac_unit),
                Text(
                  firstTeam,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Text(
              'vs',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: secondary, fontSize: 15),
            ),
            Row(
              children: [
                Icon(Icons.device_unknown),
                Text(
                  secondTeam,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.stadium),
                Text(
                  stadium,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                      fontSize: 20),
                ),
              ],
            ),
            vip
                ? Text(
                    'VIP Ticket',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'Regular Ticket',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ]),
    );
  }
}

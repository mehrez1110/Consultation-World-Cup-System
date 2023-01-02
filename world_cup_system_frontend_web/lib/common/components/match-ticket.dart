import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentum/momentum.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/components/book-match.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';

import 'new-creditcard-sheet.dart';

class MatchTicket extends StatelessWidget {
  final id;
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
  final price;
  final matchId;

  const MatchTicket(
      {Key? key,
      this.matchId,
      this.firstTeam = "Germany",
      this.secondTeam = "Saudi Arabia",
      this.stadium = "Suez stadium",
      this.dateTime = '2022-12-12 – 18:00',
      this.mainReferee = "Mehrez",
      this.firstLinesman = "Tata",
      this.secondLinesman = "Kiwi",
      this.ticketno = 20,
      this.name = "Mustafa Usama",
      this.id,
      this.vip = false,
      this.price})
      : super(key: key);

  showItemDialog(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shopping_bag_outlined, color: primary, size: 30),
              Text(
                "Are You Sure you want to buy this ticket?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primary, fontSize: 22),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
                width: _width * 0.15,
                height: _height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEC310),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: primary,
                            insetPadding: EdgeInsets.all(0),
                            content: NewCreditCardView(
                                isVip: false,
                                ticketId: id,
                                matchId: matchId,
                                price: price),
                          ),
                        );
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEC310),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var countryCode1 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == firstTeam, orElse: () => "EG");
    var countryCode2 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == secondTeam, orElse: () => "EG");

    return Container(
      height: _height * 0.2,
      width: _width * 0.7,
      margin: EdgeInsets.only(
        top: _height * 0.01,
        bottom: _height * 0.01,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: secondary, width: 2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(77, 50, 52, 45),
              spreadRadius: 0,
              blurRadius: 34,
              offset: Offset(0, 10),
            )
          ],
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
                  'MatchTicket No. ',
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
              onPressed: () {
                return showItemDialog(context);
              },
              child: Text(
                'Buy Ticket',
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
                CircleAvatar(
                  radius: 30, // Image radius
                  backgroundImage: AssetImage(
                      'icons/flags/png/' + countryCode1 + '.png',
                      package: 'country_icons'),
                ),
                SizedBox(
                  width: _width * 0.01,
                ),
                Text(
                  firstTeam,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Text(
              'vs',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: secondary, fontSize: 20),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30, // Image radius
                  backgroundImage: AssetImage(
                      'icons/flags/png/' + countryCode2 + '.png',
                      package: 'country_icons'),
                ),
                SizedBox(
                  width: _width * 0.01,
                ),
                Text(
                  secondTeam,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.stadium),
                SizedBox(
                  width: _width * 0.005,
                ),
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
                    'VIP MatchTicket',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'Regular MatchTicket',
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

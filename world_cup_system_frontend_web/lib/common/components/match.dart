import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';

class Match extends StatelessWidget {
  final firstTeam;
  final secondTeam;
  final stadium;
  final dateTime;
  final mainReferee;
  final firstLinesman;
  final secondLinesman;
  final seatsLeft;
  final role;

  const Match(
      {Key? key,
      this.firstTeam = "Egypt",
      this.secondTeam = "Saudi Arabia",
      this.stadium = "Suez stadium",
      this.dateTime = 'yyyy-MM-dd – kk:mm',
      this.mainReferee = "Mehrez",
      this.firstLinesman = "Tata",
      this.secondLinesman = "Kiwi",
      this.seatsLeft = 20,
      this.role = "user"})
      : super(key: key);

  showItemDialog(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var countryCode1 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == firstTeam, orElse: () => "EG");
    var countryCode2 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == secondTeam, orElse: () => "EG");
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
                "Add Tickets to Cart",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primary, fontSize: 22),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
              width: _width * 0.5,
              height: _height * 0.45,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30, // Image radius
                              backgroundImage: AssetImage(
                                  'icons/flags/png/' + countryCode1 + '.png',
                                  package: 'country_icons'),
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Text(
                              firstTeam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        Image.asset(
                          "lib/assets/al-bayt.webp",
                          height: _height * 0.3,
                          width: _width * 0.3,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30, // Image radius
                              backgroundImage: AssetImage(
                                  'icons/flags/png/' + countryCode2 + '.png',
                                  package: 'country_icons'),
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Text(
                              secondTeam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.stadium),
                        Text(
                          stadium,
                          style: const TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        Text(
                          dateTime,
                          style: const TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                    Container(
                      height: _height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Text('Cancel',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.grey)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFEC310),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Proceed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var countryCode1 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == firstTeam, orElse: () => "EG");
    var countryCode2 = mapedCountries.keys
        .firstWhere((k) => mapedCountries[k] == secondTeam, orElse: () => "EG");

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFFFBFBFE),
            Color(0xFFECEFFD),
          ])),
      margin: EdgeInsets.only(
        top: _height * 0.01,
        bottom: _height * 0.01,
      ),
      height: _height * 0.2,
      width: _width * 0.7,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
            Text(
              'vs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
                Icon(Icons.stadium),
                Text(
                  stadium,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFEC310),
              ),
              onPressed: () {
                // ignore: void_checks
                return showItemDialog(context);
              },
              child: Text(
                'Book',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: _height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seats left: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              seatsLeft.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            Text(
              dateTime,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ]),
    );
  }
}

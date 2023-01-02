import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentum/momentum.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_drop_down_input_new.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_text_input_new.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/match-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';
import 'package:world_cup_system_frontend_web/views/matches-view.dart';

class Match extends StatefulWidget {
  final id;
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
      this.id,
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

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  bookDialog(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var countryCode1 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.firstTeam,
        orElse: () => "EG");
    var countryCode2 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.secondTeam,
        orElse: () => "EG");
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
                              widget.firstTeam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "lib/assets/" +
                                  widget.stadium.replaceAll(' ', '') +
                                  ".webp",
                              height: _height * 0.3,
                              width: _width * 0.3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.stadium),
                                Text(
                                  widget.stadium,
                                  style: const TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                Text(
                                  widget.dateTime,
                                  style: const TextStyle(fontSize: 22),
                                )
                              ],
                            ),
                          ],
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
                              widget.secondTeam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                  fontSize: 22),
                            ),
                          ],
                        ),
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

  final _homeTeamController = TextEditingController();
  final _awayTeamController = TextEditingController();
  final _stadiumController = TextEditingController();
  final _dateTimeController = TextEditingController();
  final _mainRefereeController = TextEditingController();
  final _firstLinesmanController = TextEditingController();
  final _secondLinesmanController = TextEditingController();

  editMatch(BuildContext context) async {
    var matches = Momentum.controller<MatchController>(context).model;
    var matcheController = Momentum.controller<MatchController>(context);
    String homeTeamValue = widget.firstTeam;
    String awayTeamValue = widget.secondTeam;
    //print(drop);
    var stadiums = Momentum.controller<StadiumController>(context).model;
    // var stadiumsItems = stadiums.stadiumslist.map((e) => e.name ).toList();
    // List<String> sitems = stadiumsItems as List<String>;
    String stadiumValue = widget.stadium;
    // get team names from teams list inside matches model
    // teamsItems = matches.teamNames.toString();

    // stadiumsItems = stadiums.stadiumslist.map((e) => e.name).toList();

    _homeTeamController.text = widget.firstTeam;
    _awayTeamController.text = widget.secondTeam;
    _stadiumController.text = widget.stadium;
    _dateTimeController.text = widget.dateTime;
    _mainRefereeController.text = widget.mainReferee;
    _firstLinesmanController.text = widget.firstLinesman;
    _secondLinesmanController.text = widget.secondLinesman;

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var countryCode1 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.firstTeam,
        orElse: () => "EG");
    var countryCode2 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.secondTeam,
        orElse: () => "EG");
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.edit, color: primary, size: 30),
              Text(
                "Edit Match ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primary, fontSize: 22),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
              width: _width * 0.4,
              height: _height * 0.7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Home Team",
                        labelStyle: TextStyle(
                          color: primary,
                          fontSize: 16,
                        ),
                      ),
                      value: homeTeamValue,
                      items: teams.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          homeTeamValue = value!;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Away Team",
                        labelStyle: TextStyle(
                          color: primary,
                          fontSize: 16,
                        ),
                      ),
                      value: awayTeamValue,
                      items: teams.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          awayTeamValue = value!;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Match Stadium",
                        labelStyle: TextStyle(
                          color: primary,
                          fontSize: 16,
                        ),
                      ),
                      value: stadiumValue,
                      items: stadiums.stadiumsNames!.map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          stadiumValue = value!;
                        });
                      },
                    ),
                    RegularTextInputNew(
                      fillColor: Colors.white,
                      hintTextColor: Color(0x940A1F33),
                      prefixIconColor: Color(0x94192B37),
                      errorBorderColor: Color(0xFFFD7542),
                      textColor: Color(0xFF0A1F33),
                      labelColor: Color(0xFF0A1F33),
                      label: "Date & Time",
                      controller: _dateTimeController,
                    ),
                    RegularTextInputNew(
                      fillColor: Colors.white,
                      hintTextColor: Color(0x940A1F33),
                      prefixIconColor: Color(0x94192B37),
                      errorBorderColor: Color(0xFFFD7542),
                      textColor: Color(0xFF0A1F33),
                      labelColor: Color(0xFF0A1F33),
                      label: "Main Referee",
                      controller: _mainRefereeController,
                    ),
                    RegularTextInputNew(
                      fillColor: Colors.white,
                      hintTextColor: Color(0x940A1F33),
                      prefixIconColor: Color(0x94192B37),
                      errorBorderColor: Color(0xFFFD7542),
                      textColor: Color(0xFF0A1F33),
                      labelColor: Color(0xFF0A1F33),
                      label: "First Linesman",
                      controller: _firstLinesmanController,
                    ),
                    RegularTextInputNew(
                      fillColor: Colors.white,
                      hintTextColor: Color(0x940A1F33),
                      prefixIconColor: Color(0x94192B37),
                      errorBorderColor: Color(0xFFFD7542),
                      textColor: Color(0xFF0A1F33),
                      labelColor: Color(0xFF0A1F33),
                      label: "Second Linesman",
                      controller: _secondLinesmanController,
                    ),
                    Container(
                      width: _width * 0.5,
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
                              // update match with in list with certain id match
                              // fel updateeee bta3et match ma ana law ghayart esm el team hageb el id bta3et el team mnen wala hab3ato ezay fe update

                              // get the match with the id of the match that we want to update and update it with the new new teams

                              matcheController.updateMatch(
                                  context,
                                  widget.id,
                                  homeTeamValue,
                                  awayTeamValue,
                                  stadiumValue,
                                  _dateTimeController.text,
                                  _firstLinesmanController.text,
                                  _secondLinesmanController.text,
                                  _mainRefereeController.text);

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Update',
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
    var countryCode1 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.firstTeam,
        orElse: () => "EG");
    var countryCode2 = mapedCountries.keys.firstWhere(
        (k) => mapedCountries[k] == widget.secondTeam,
        orElse: () => "EG");

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
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
                  widget.firstTeam,
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
                  widget.secondTeam,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.stadium),
                Text(
                  widget.stadium,
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
                return bookDialog(context);
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
              'Capacity: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.seatsLeft.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            Text(
              widget.dateTime,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: _width * 0.1,
            ),
            widget.role == "MANAGER" || widget.role == "ADMIN"
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFEC310),
                    ),
                    onPressed: () {
                      // ignore: void_checks
                      return editMatch(context);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ]),
    );
  }
}

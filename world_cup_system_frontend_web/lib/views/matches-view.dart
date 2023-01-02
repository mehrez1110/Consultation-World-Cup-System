// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_text_input_new.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';

import '../common/components/match.dart';
import '../controllers/match-controller.dart';
import '../models/match-model.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

String dropDownValue = 'circular';
var shapeItems = ['circular', 'rectangular'];

class _MatchViewState extends MomentumState<MatchView> {
  void initMomentumState() {
    var matches = Momentum.controller<MatchController>(context);
    matches.getMatches(context);
    matches.getTeams(context);
    super.initMomentumState();
  }

  final _homeTeamController = TextEditingController();
  final _awayTeamController = TextEditingController();
  final _stadiumController = TextEditingController();
  final _dateTimeController = TextEditingController();
  final _mainRefereeController = TextEditingController();
  final _firstLinesmanController = TextEditingController();
  final _secondLinesmanController = TextEditingController();

  addMatch(BuildContext context) async {
    var matches = Momentum.controller<MatchController>(context).model;
    var matcheController = Momentum.controller<MatchController>(context);
    String homeTeamValue = "Argentina";
    String awayTeamValue = "Australia";

    var stadiums = Momentum.controller<StadiumController>(context).model;
    // var stadiumsItems = stadiums.stadiumslist.map((e) => e.name ).toList();
    // List<String> sitems = stadiumsItems as List<String>;
    String stadiumValue = "Al Bayt Stadium";
    // get team names from teams list inside matches model
    // teamsItems = matches.teamNames.toString();

    // stadiumsItems = stadiums.stadiumslist.map((e) => e.name).toList();

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
              Icon(Icons.edit, color: primary, size: 30),
              Text(
                "Add Match ",
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
                              //Add new match request
                              matcheController.addMatch(
                                  context,
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
                              'Add',
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

  final _nameController = TextEditingController();
  final _seatCountController = TextEditingController();

  Widget build(BuildContext context) {
    //screen width and height
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    //
    return MomentumBuilder(
        controllers: [MatchController, AuthController],
        builder: (context, snapshot) {
          var auth = Momentum.controller<AuthController>(context).model;
          var role = "Guest";
          if (auth.currentUser != null) {
            if (auth.currentUser.role.any((role) => role.name == "ADMIN")) {
              role = "ADMIN";
            } else if (auth.currentUser.role
                .any((role) => role.name == "MANAGER")) {
              role = "MANAGER";
            } else if (auth.currentUser.role
                .any((role) => role.name == "USER")) {
              role = "USER";
            }
          }
          var matchModel = Momentum.controller<MatchController>(context).model;
          return Scaffold(
            floatingActionButton: role == "MANAGER" || role == "ADMIN"
                ? FloatingActionButton(
                    child: const Icon(Icons.add),
                    backgroundColor: primary,
                    onPressed: () {
                      addMatch(context);
                    },
                  )
                : Container(),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFFFBFBFE),
                    Color(0xFFECEFFD),
                  ])),
              child: Container(
                margin: EdgeInsets.only(
                  top: (40 / 840) * _height,
                  left: (28 / 390) * _width,
                  right: (28 / 390) * _width,
                ),
                child: ListView(
                  // shrinkWrap: true,

                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "All Matches ⚽",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        )),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Match(
                              id: matchModel.matcheslist[index].id,
                              firstTeam:
                                  matchModel.matcheslist[index].firstTeam.name,
                              secondTeam:
                                  matchModel.matcheslist[index].secondTeam.name,
                              stadium:
                                  matchModel.matcheslist[index].stadium.name,
                              dateTime: matchModel.matcheslist[index].dateTime,
                              firstLinesman:
                                  matchModel.matcheslist[index].firstLinesman,
                              secondLinesman:
                                  matchModel.matcheslist[index].secondLinesman,
                              mainReferee:
                                  matchModel.matcheslist[index].mainReferee,
                              role: role,
                            ),
                        shrinkWrap: true,
                        itemCount: matchModel.matcheslist != null
                            ? matchModel.matcheslist.length
                            : 0),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

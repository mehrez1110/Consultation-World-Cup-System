// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_text_input_new.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';

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

  final _nameController = TextEditingController();
  final _seatCountController = TextEditingController();

  addNewMatch(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stadium_outlined, color: primary),
            Text("Add Stadium"),
          ],
        ),
        content: Container(
          height: (200 / 844) * _height,
          width: _width * 0.25,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                // color: Colors.pink,
                height: (72 / 844) * _height,
                child: RegularTextInputNew(
                  labelColor: secondary,
                  textColor: secondary,
                  fillColor: Colors.white,
                  hintTextColor: Color(0x940A1F33),
                  prefixIconColor: Color(0x94192B37),
                  errorBorderColor: Color(0xFFFD7542),
                  email: true,
                  label: "Stadium Name",
                  hintText: "Stadium Name",
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                // color: Colors.pink,
                height: (40 / 844) * _height,
                child: DropdownButtonFormField(
                  dropdownColor: Color(0xFFECEFFD),

                  style: const TextStyle(
                      color: secondary,
                      fontFamily: 'SfProRounded',
                      fontSize: 14),
                  // Initial Value
                  value: dropDownValue,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      errorStyle: TextStyle(
                          height: 0.1,
                          fontSize: 10,
                          fontFamily: 'SfProRounded',
                          decoration: TextDecoration.underline),
                      hintStyle:
                          TextStyle(fontFamily: 'SfProRounded', fontSize: 14)),

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: shapeItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),

              // text field for seats count that takes number only
              Container(
                alignment: Alignment.center,
                // color: Colors.pink,
                height: (72 / 844) * _height,
                child: RegularTextInputNew(
                  labelColor: secondary,
                  textColor: secondary,
                  fillColor: Colors.white,
                  hintTextColor: Color(0x940A1F33),
                  prefixIconColor: Color(0x94192B37),
                  errorBorderColor: Color(0xFFFD7542),
                  email: true,
                  label: "Seats Count",
                  hintText: "Seats Count",
                  controller: _seatCountController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // _addStadium(context);
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(
                color: primary,
                fontFamily: 'SfProRounded',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                      addNewMatch(context);
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
                              firstTeam:
                                  matchModel.matcheslist[index].firstTeam.name,
                              secondTeam:
                                  matchModel.matcheslist[index].secondTeam.name,
                              stadium:
                                  matchModel.matcheslist[index].stadium.name,
                              dateTime: matchModel.matcheslist[index].dateTime,
                              seatsLeft:
                                  matchModel.matcheslist[index].seatsLeft,
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

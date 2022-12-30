// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/common/components/signin-button.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/views/navigations-view-new.dart';

import '../common/components/regular_text_input_new.dart';
import '../controllers/match-controller.dart';
import '../models/match-model.dart';
import '../common/components/match.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
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
          var matchModel = snapshot<MatchModel>();
          return SingleChildScrollView(
            child: Column(
              children: [
                Match(
                  firstTeam: matchModel.firstTeam,
                  secondTeam: matchModel.secondTeam,
                  seatsLeft: matchModel.seatsLeft,
                  dateTime: matchModel.dateTime,
                  stadium: matchModel.stadium,
                  firstLinesman: matchModel.firstLinesman,
                  secondLinesman: matchModel.secondLinesman,
                  mainReferee: matchModel.mainReferee,
                  role: role,
                ),
                Match(),
                Match(),
              ],
            ),
          );
        });
  }
}

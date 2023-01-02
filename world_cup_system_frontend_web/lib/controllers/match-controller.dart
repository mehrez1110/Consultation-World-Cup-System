import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/stadium.dart';
import 'package:world_cup_system_frontend_web/data_models/team.dart';
import 'package:world_cup_system_frontend_web/models/auth-model.dart';
import 'package:world_cup_system_frontend_web/models/stadium-model.dart';

import '../models/match-model.dart';

class MatchController extends MomentumController<MatchModel> {
  @override
  MatchModel init() {
    return MatchModel(this);
  }

  Future<void> getMatches(context) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/matches");
      http.Response response = await http.get(url, headers: {
        // 'Authorization':
        //     'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
        "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        'Accept': '*/*'
      });
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        List matches = [];
        for (var responseItem in jsonResponse) {
          final match = MatchModel(
            this,
            id: responseItem["id"],
            firstTeam: Team.fromJson(responseItem["homeTeam"]),
            secondTeam: Team.fromJson(responseItem["awayTeam"]),
            stadium: Stadium.fromJson(responseItem["matchStadium"]),
            dateTime: responseItem["matchDate"],
            seatsLeft: responseItem["seatsCount"],
            firstLinesman: responseItem["lineManA"],
            secondLinesman: responseItem["lineManB"],
            mainReferee: responseItem["referee"],
          );
          matches.add(match);
        }
        model.update(matcheslist: matches);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getTeams(context) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/team");
      http.Response response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
        "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        'Accept': '*/*'
      });
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        List<Team> teams = [];
        List<String> names = [];
        for (var responseItem in jsonResponse) {
          final match = Team(
            id: responseItem["id"],
            name: responseItem["name"],
            winsCount: responseItem["winsCount"],
            drawsCount: responseItem["drawsCount"],
            lossCount: responseItem["lossCount"],
            rating: responseItem["rating"],
          );
          teams.add(match);
          names.add(match.name);
        }
        print(names);
        model.update(teamsList: teams, teamNames: names);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateMatch(
      context,
      int id,
      String homeTeam,
      String awayTeam,
      String matchStadium,
      String matchDate,
      String lineManA,
      String lineManB,
      String referee) async {
    try {
      var stadiums = Momentum.controller<StadiumController>(context).model;

      print(stadiums.stadiumslist[0].name);
      //print(stadiumModelList[0].toJson());
      var url = Uri.http(STAGING_URL, "/api/matches/", {"id": id.toString()});
      http.Response response = await http.put(url,
          headers: {
            'Authorization':
                'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          },
          body: jsonEncode({
            // get team object from team list by name
            "matchStadium": (stadiums.stadiumslist!
                    .firstWhere((element) => element.name == matchStadium))
                .toJson(),

            "homeTeam": (model.teamsList!
                .firstWhere((element) => element.name == homeTeam)).toJson(),
            "awayTeam": (model.teamsList!
                .firstWhere((element) => element.name == awayTeam)).toJson(),

            "matchDate": matchDate,
            "lineManA": lineManA,
            "lineManB": lineManB,
            "referee": referee,
          }));

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}

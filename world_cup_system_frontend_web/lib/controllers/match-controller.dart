import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_cup_system_frontend_web/models/auth-model.dart';

import '../models/match-model.dart';

class MatchController extends MomentumController<MatchModel> {
  @override
  MatchModel init() {
    return MatchModel(this);
  }

  Future<List<Match>> getMatches() async {
    var url = Uri.parse("http://172.23.144.1:8080/");
    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-type": "application/json"
    });
    var jsonData = jsonDecode(response.body);
    List<Match> matches = [];
    for (var u in jsonData) {
      // Match match = ;
      // matches.add(match);
    }
    return matches;
  }
}

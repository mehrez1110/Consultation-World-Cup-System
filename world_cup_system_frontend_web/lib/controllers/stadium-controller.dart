// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:flutter/material.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/models/stadium-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:world_cup_system_frontend_web/models/auth-model.dart';

class StadiumController extends MomentumController<StadiumModel> {
  @override
  StadiumModel init() {
    return StadiumModel(
      this,
      id: 0,
      name: "Al Bayt Stadium",
      shape: "rectangular",
      seatsCount: 0,
      vipLounge: false,
      stadiumslist: [],
    );
  }

  Future<void> getStadiums(context) async {
    try {
      var url = Uri.http(
        STAGING_URL,
        "/api/stadium/",
      );
      var response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        List stadiums = [];
        for (var responseItem in jsonResponse) {
          final stadium = StadiumModel(
            this,
            id: responseItem["id"],
            name: responseItem["name"],
            shape: responseItem["shape"],
            seatsCount: responseItem["seatsCount"],
            vipLounge: responseItem["vipLounge"],
          );
          stadiums.add(stadium);
        }
        model.update(stadiumslist: stadiums);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteStadium(context, int id) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/stadium/", {"id": id.toString()});
      var response = await http.delete(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        model.update(
            stadiumslist: model.stadiumslist
                .where((stadium) => stadium.id != id)
                .toList());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addStadium(
      context, String name, String shape, int seatCount) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/stadium/");
      var response = await http.post(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "shape": shape,
          "seatsCount": seatCount
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        // add stadium to list
        var stadium = StadiumModel(
          this,
          id: jsonResponse["id"],
          name: name,
          shape: shape,
          seatsCount: seatCount,
        );
        // add stadium to list of stadiums
        model.update(stadiumslist: [...model.stadiumslist, stadium]);
      }
    } catch (e) {
      print(e);
    }
  }
}

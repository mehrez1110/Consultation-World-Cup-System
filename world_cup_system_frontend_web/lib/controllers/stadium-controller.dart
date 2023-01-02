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
      // id: 0,
      // name: "Al Bayt Stadium",
      // shape: "rectangular",
      // seatsCount: 0,
      // vipLounge: false,
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
        List<String> stadiumsNames = [];
        for (var responseItem in jsonResponse) {
          final stadium = Stadium(
            id: responseItem["id"],
            name: responseItem["name"],
            shape: responseItem["shape"],
            seatsCount: responseItem["seatsCount"],
            vipSeatsCount: responseItem["vipSeatsCount"],
            vipRows: responseItem["vipRows"],
            vipColumns: responseItem["vipColumns"],
          );
          stadiums.add(stadium);
          stadiumsNames.add(stadium.name);
        }

        model.update(stadiumslist: stadiums, stadiumsNames: stadiumsNames);
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
            stadiumslist: model.stadiumslist!
                .where((stadium) => stadium.id != id)
                .toList());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addStadium(context, String name, String shape, int seatCount,
      int vipSeats, int vipRows, int vipCounts) async {
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
          "seatsCount": seatCount,
          "vipSeatsCount": vipSeats,
          "vipRows": vipRows,
          "vipColumns": vipCounts,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        // add stadium to list
        var stadium = Stadium(
          id: jsonResponse["id"],
          name: jsonResponse["name"],
          shape: jsonResponse["shape"],
          seatsCount: jsonResponse["seatsCount"],
          vipSeatsCount: jsonResponse["vipLounge"],
          vipColumns: jsonResponse["vipColumns"],
          vipRows: jsonResponse["vipRows"],
        );

        // add stadium to list of stadiums
        model.update(stadiumslist: [...model.stadiumslist!, stadium]);
      }
    } catch (e) {
      print(e);
    }
  }
}

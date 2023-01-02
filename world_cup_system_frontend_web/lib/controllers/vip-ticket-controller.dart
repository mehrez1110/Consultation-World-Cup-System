import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/seat-component.dart';
import 'package:world_cup_system_frontend_web/common/components/ticket.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/data_models/vip-lounge-type.dart';
import 'package:world_cup_system_frontend_web/models/match-model.dart';
import 'package:world_cup_system_frontend_web/models/ticket-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../common/constants.dart';
import '../models/vip-ticket-model.dart';
import 'auth-controller.dart';

class VipTicketController extends MomentumController<VipTicketModel> {
  @override
  VipTicketModel init() {
    return VipTicketModel(
      this,
    );
  }

  Future<void> getUserVipTickets(userId, context) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/vip-tickets/by-user-id/",
          {'userId': userId.toString()});

      var response = await http.get(
        url,
        headers: <String, String>{
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        List userTickets = [];
        // model.update(userTickets: userTickets);

        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        print(jsonResponse);
        for (var responseItem in jsonResponse) {
          final ticket = Ticket(
            price: responseItem['price'],
            isVip: true,
            id: responseItem["id"],
            firstTeam: responseItem["ticketMatch"]["homeTeam"]["name"],
            secondTeam: responseItem["ticketMatch"]["awayTeam"]["name"],
            stadium: responseItem["ticketMatch"]["matchStadium"]["name"],
            mainReferee: responseItem["referee"],
            firstLinesman: responseItem["lineManA"],
            secondLinesman: responseItem["lineManB"],
            ticketno: responseItem["seatNo"],
            name: responseItem["ticketOwner"]["firstName"] +
                " " +
                responseItem["ticketOwner"]["lastName"],
          );
          userTickets.add(ticket);
        }
        model.update(userTickets: userTickets);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("📣Attention athlete"),
            content: Text("Something went wrong, please try again later"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('Caught error in getuser Tickets: ${e.toString()}');
    }
  }

  Future<void> getMatchVipTickets(matchId, context) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/vip-tickets/by-match-id/",
          {'matchId': matchId.toString()});

      var response = await http.get(
        url,
        headers: <String, String>{
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
      );
      if (response.statusCode == 200) {
        List userTickets = [];
        // model.update(userTickets: userTickets);

        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        VipLounge temp = VipLounge.fromJson(jsonResponse[0]['vipLounge']);
        print(jsonResponse[0]["ticketOwner"].toString());
        for (var responseItem in jsonResponse) {
          final ticket = SeatsComponent(
            price: responseItem['price'],
            id: responseItem["id"],
            matchId: responseItem["ticketMatch"]["id"],
            vipLounge: VipLounge.fromJson(responseItem['vipLounge']),
            status: responseItem['status'],
            firstTeam: responseItem["ticketMatch"]["homeTeam"]["name"],
            secondTeam: responseItem["ticketMatch"]["awayTeam"]["name"],
            stadium: responseItem["ticketMatch"]["matchStadium"]["name"],
            mainReferee: responseItem["referee"],
            firstLinesman: responseItem["lineManA"],
            secondLinesman: responseItem["lineManB"],
            ticketno: responseItem["seatNo"],
            name: (responseItem["ticketOwner"] != null)
                ? (responseItem["ticketOwner"]["firstName"] +
                    " " +
                    responseItem["ticketOwner"]["lastName"])
                : "noname",
          );
          userTickets.add(ticket);
        }
        model.update(userTickets: userTickets, vipLounge: temp);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("📣Attention athlete"),
            content: Text("Something went wrong, please try again later"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('Caught error in getuser Tickets: ${e.toString()}');
    }
  }

  Future<void> bookVipTicket(ticketId, matchId, userId, context) async {
    var url = Uri.http(STAGING_URL, "/api/vip-tickets/user-buy-vip-ticket/",
        {"userId": userId.toString(), "ticketId": ticketId.toString()});

    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          'Content-Type': 'application/json',
          // "Access-Control-Allow-Origin": "*",
          // 'Accept': '*/*'
        },
      );

      print("Response of booking Vip ticket ${response.body}");
      if (response.statusCode == 200) {
        Momentum.controller<VipTicketController>(context)
            .getMatchVipTickets(matchId, context);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("📣Attention athlete"),
            content: Text("Something went wrong, please try again later"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('Caught error in book vip Ticket: ${e.toString()}');
    }
  }

  Future<void> refundVipTicket(ticketId, userId, context) async {
    var url = Uri.http(STAGING_URL, "/api/vip-tickets/user-refund-vip-ticket/",
        {"userId": userId.toString(), "ticketId": ticketId.toString()});

    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          'Content-Type': 'application/json',
          // "Access-Control-Allow-Origin": "*",
          // 'Accept': '*/*'
        },
      );

      print("Response of booking Vip ticket ${response.body}");
      if (response.statusCode == 200) {
        Momentum.controller<VipTicketController>(context).getUserVipTickets(
            Momentum.controller<AuthController>(context).model.id, context);
        Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("📣Attention athlete"),
            content: Text("Something went wrong, please try again later"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      debugPrint('Caught error in refun vipTicket: ${e.toString()}');
    }
  }
}

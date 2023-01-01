import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/ticket.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
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
}

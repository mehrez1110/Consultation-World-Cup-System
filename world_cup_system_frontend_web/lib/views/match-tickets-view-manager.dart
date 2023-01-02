import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/ticket.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/vip-ticket-controller.dart';

import '../models/ticket-model.dart';
import '../models/vip-ticket-model.dart';

class MatchTicketsViewManager extends StatefulWidget {
  const MatchTicketsViewManager({Key? key}) : super(key: key);

  @override
  State<MatchTicketsViewManager> createState() => _MatchTicketsViewState();
}

class _MatchTicketsViewState extends MomentumState<MatchTicketsViewManager> {
  void initMomentumState() {
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(
        controllers: [TicketController],
        builder: (context, snapshot) {
          var model = snapshot<TicketModel>();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              backgroundColor: primary,
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: secondary,
                      size: (30 / 844) * _height,
                    )),
              ],
            ),
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
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Match Tickets 🎟️",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        )),
                    (model.matchTickets.length != 0)
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (model.matchTickets == null)
                                ? 0
                                : model.matchTickets.length,
                            itemBuilder: (context, index) {
                              return model.matchTickets[index];
                            })
                        : Center(
                            child: Column(
                            children: [
                              Text(
                                "🙅🏻‍♂️",
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                "Still No Match Tickets",
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Divider(
                        thickness: 2,
                        height: (40 / 840) * _height,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

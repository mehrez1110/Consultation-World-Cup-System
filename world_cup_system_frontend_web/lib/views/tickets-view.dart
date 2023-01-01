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

class TicketsView extends StatefulWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends MomentumState<TicketsView> {
  void initMomentumState() {
    var id = Momentum.controller<AuthController>(context).model.id;
    Momentum.controller<TicketController>(context).getUserTickets(id, context);
    Momentum.controller<VipTicketController>(context)
        .getUserVipTickets(id, context);
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(
        controllers: [TicketController, VipTicketController],
        builder: (context, snapshot) {
          var model = snapshot<TicketModel>();
          var model1 = snapshot<VipTicketModel>();
          return Scaffold(
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
                          "My Vip Tickets 🎫",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        )),
                    (model1.userTickets.length != 0)
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (model1.userTickets == null)
                                ? 0
                                : model1.userTickets.length,
                            itemBuilder: (context, index) {
                              return model1.userTickets[index];
                            })
                        : Center(
                            child: Column(
                            children: [
                              Text(
                                "👑",
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                "Still no vip reservations",
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
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "My Tickets 🎟️",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        )),
                    (model.userTickets.length != 0)
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (model.userTickets == null)
                                ? 0
                                : model.userTickets.length,
                            itemBuilder: (context, index) {
                              return model.userTickets[index];
                            })
                        : Center(
                            child: Column(
                            children: [
                              Text(
                                "🙅🏻‍♂️",
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                "Still no reservations",
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

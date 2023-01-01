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
            body: Center(
              child: Container(
                margin: EdgeInsets.all(5),
                // width: _width * 0.7,

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
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (model1.userTickets == null)
                            ? 0
                            : model1.userTickets.length,
                        itemBuilder: (context, index) {
                          return model1.userTickets[index];
                        }),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "My Tickets 🎟️",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        )),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (model.userTickets == null)
                            ? 0
                            : model.userTickets.length,
                        itemBuilder: (context, index) {
                          return model.userTickets[index];
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

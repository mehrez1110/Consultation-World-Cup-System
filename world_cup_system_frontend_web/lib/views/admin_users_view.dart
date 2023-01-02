import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/ticket.dart';
import 'package:world_cup_system_frontend_web/common/components/user-details.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/vip-ticket-controller.dart';
import 'package:world_cup_system_frontend_web/models/auth-model.dart';

import '../models/ticket-model.dart';
import '../models/vip-ticket-model.dart';

class AdminUsersView extends StatefulWidget {
  const AdminUsersView({Key? key}) : super(key: key);

  @override
  State<AdminUsersView> createState() => _AdminUsersViewState();
}

class _AdminUsersViewState extends MomentumState<AdminUsersView> {
  void initMomentumState() {
    var id = Momentum.controller<AuthController>(context).model.id;
    Momentum.controller<AuthController>(context).getAllUsers(context);

    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(
        controllers: [
          AuthController,
        ],
        builder: (context, snapshot) {
          var userModel = snapshot<AuthModel>();
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
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Users 🎫",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: primary),
                          )),
                      (userModel.listOfUsers != null)
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: userModel.listOfUsers.length,
                              itemBuilder: (context, index) {
                                return UserData(
                                    userName:
                                        userModel.listOfUsers[index].username,
                                    status: userModel.listOfUsers[index].status,
                                    role: userModel.listOfUsers[index].role,
                                    id: userModel.listOfUsers[index].id);
                              })
                          : Center(
                              child: Column(
                              children: [
                                Text(
                                  "👑",
                                  style: TextStyle(fontSize: 70),
                                ),
                                Text(
                                  "No users yet",
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ))
                    ],
                  )));
        });
  }
}

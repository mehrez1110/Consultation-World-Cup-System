import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momentum/momentum.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_drop_down_input_new.dart';
import 'package:world_cup_system_frontend_web/common/components/regular_text_input_new.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/match-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';
import 'package:world_cup_system_frontend_web/views/matches-view.dart';

class UserData extends StatefulWidget {
  final id;
  final userName;
  final status;
  final role;

  const UserData({this.id, this.userName, this.status, this.role, Key? key})
      : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends MomentumState<UserData> {
  // set state when the user clicks on the remove button

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var authController = Momentum.controller<AuthController>(context);

    return Container(
      margin: EdgeInsets.only(
        top: (40 / 840) * _height,
        left: (28 / 390) * _width,
        right: (28 / 390) * _width,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: secondary, width: 2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(77, 50, 52, 45),
              spreadRadius: 0,
              blurRadius: 34,
              offset: Offset(0, 10),
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFBFBFE),
                Color(0xFFECEFFD),
              ])),
      height: _height * 0.2,
      width: _width * 0.7,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Username:  " + widget.userName,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: primary),
            ),
            Text(
              "Status:  " + widget.status,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: primary),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                // ignore: void_checks
                authController.deleteUser(context, widget.id);
                authController.model.listOfUsers
                    .removeWhere((element) => element.id == widget.id);
              },
              child: const Text(
                'Remove',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: _height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Current Role:  " + widget.role.last.name,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: primary),
            ),
            widget.status == "accepted"
                ? Container()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFEC310),
                    ),
                    onPressed: () {
                      authController.acceptUser(context, widget.id);
                    },
                    child: Text(
                      'Accept Role',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
          ],
        ),
      ]),
    );
  }
}

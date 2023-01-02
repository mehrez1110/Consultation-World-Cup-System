// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/stadium-widget.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/common/components/signin-button.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';
import 'package:world_cup_system_frontend_web/models/stadium-model.dart';
import 'package:world_cup_system_frontend_web/views/navigations-view-new.dart';

import '../common/components/regular_text_input_new.dart';
import '../controllers/match-controller.dart';
import '../models/match-model.dart';
import '../common/components/match.dart';

class StadiumView extends StatefulWidget {
  const StadiumView({Key? key}) : super(key: key);

  @override
  State<StadiumView> createState() => _StadiumViewState();
}

String dropDownValue = 'circular';
var shapeItems = ['circular', 'rectangular'];

class _StadiumViewState extends MomentumState<StadiumView> {
  final _nameController = TextEditingController();
  final _seatCountController = TextEditingController();
  final _vipSeatsCountController = TextEditingController();
  final _vipRowsController = TextEditingController();
  final _vipColumnsController = TextEditingController();

  Future<void> _addStadium(context) async {
    var stadium = Momentum.controller<StadiumController>(context);
    await stadium.addStadium(
        context,
        _nameController.text,
        dropDownValue,
        int.parse(_seatCountController.text),
        int.parse(_vipSeatsCountController.text),
        int.parse(_vipRowsController.text),
        int.parse(_vipColumnsController.text));
  }

  addNewStadium(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stadium_outlined, color: primary),
            Text("Add Stadium"),
          ],
        ),
        content: Container(
          height: 0.7 * _height,
          width: _width * 0.25,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (72 / 844) * _height,
                  child: RegularTextInputNew(
                    labelColor: secondary,
                    textColor: secondary,
                    fillColor: Colors.white,
                    hintTextColor: Color(0x940A1F33),
                    prefixIconColor: Color(0x94192B37),
                    errorBorderColor: Color(0xFFFD7542),
                    email: true,
                    label: "Stadium Name",
                    hintText: "Stadium Name",
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (40 / 844) * _height,
                  child: DropdownButtonFormField(
                    dropdownColor: Color(0xFFECEFFD),

                    style: const TextStyle(
                        color: secondary,
                        fontFamily: 'SfProRounded',
                        fontSize: 14),
                    // Initial Value
                    value: dropDownValue,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        errorStyle: TextStyle(
                            height: 0.1,
                            fontSize: 10,
                            fontFamily: 'SfProRounded',
                            decoration: TextDecoration.underline),
                        hintStyle: TextStyle(
                            fontFamily: 'SfProRounded', fontSize: 14)),

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: shapeItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                  ),
                ),

                // text field for seats count that takes number only
                Container(
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (72 / 844) * _height,
                  child: RegularTextInputNew(
                    labelColor: secondary,
                    textColor: secondary,
                    fillColor: Colors.white,
                    hintTextColor: Color(0x940A1F33),
                    prefixIconColor: Color(0x94192B37),
                    errorBorderColor: Color(0xFFFD7542),
                    email: true,
                    label: "Seats Count",
                    hintText: "Seats Count",
                    controller: _seatCountController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (72 / 844) * _height,
                  child: RegularTextInputNew(
                    labelColor: secondary,
                    textColor: secondary,
                    fillColor: Colors.white,
                    hintTextColor: Color(0x940A1F33),
                    prefixIconColor: Color(0x94192B37),
                    errorBorderColor: Color(0xFFFD7542),
                    email: true,
                    label: "Vip Seats Count",
                    hintText: "Vip Seats Count",
                    controller: _vipSeatsCountController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (72 / 844) * _height,
                  child: RegularTextInputNew(
                    labelColor: secondary,
                    textColor: secondary,
                    fillColor: Colors.white,
                    hintTextColor: Color(0x940A1F33),
                    prefixIconColor: Color(0x94192B37),
                    errorBorderColor: Color(0xFFFD7542),
                    email: true,
                    label: "Vip Rows",
                    hintText: "Vip Rows",
                    controller: _vipRowsController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // color: Colors.pink,
                  height: (72 / 844) * _height,
                  child: RegularTextInputNew(
                    labelColor: secondary,
                    textColor: secondary,
                    fillColor: Colors.white,
                    hintTextColor: Color(0x940A1F33),
                    prefixIconColor: Color(0x94192B37),
                    errorBorderColor: Color(0xFFFD7542),
                    email: true,
                    label: "Vip Columns",
                    hintText: "Vip Columns",
                    controller: _vipColumnsController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _addStadium(context);
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(
                color: primary,
                fontFamily: 'SfProRounded',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    //screen width and height
    //
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    //
    return MomentumBuilder(
        controllers: [MatchController, AuthController, StadiumController],
        builder: (context, snapshot) {
          var stadiumModel =
              Momentum.controller<StadiumController>(context).model;
          // var stadiumModel = snapshot<StadiumModel>();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                addNewStadium(context);
              },
              child: const Icon(Icons.add),
              backgroundColor: primary,
            ),
            body: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  GridView.builder(
                    itemBuilder: (context, index) => StadiumWidget(
                      id: stadiumModel.stadiumslist[index].id,
                      name: stadiumModel.stadiumslist[index].name,
                      shape: stadiumModel.stadiumslist[index].shape,
                      seatsCount: stadiumModel.stadiumslist[index].seatsCount,
                      // vipLounge: stadiumModel.stadiumslist[index].vipLounge,
                    ),
                    shrinkWrap: true,
                    itemCount: stadiumModel.stadiumslist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

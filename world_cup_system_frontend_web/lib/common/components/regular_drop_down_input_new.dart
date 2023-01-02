import 'package:flutter/material.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';

// ignore: must_be_immutable
class RegularDropDownInputNew extends StatefulWidget {
  final label;
  final controller;
  final controller1;
  final hintText;
  final prefix;
  final keyboardType;
  final bool protectedText;
  final bool mandatory;
  final bool description;
  final inputFormatters;
  final bool gender;
  final bool favoriteSport;
  final bool password;
  final bool area;
  final bool confirmPassword;
  final bool paymentMethod;
  final bool restOfPaymentMethod;
  final String passwordText;
  final bool birthDate;
  String birthDateText;
  final fillColor;
  final hintTextColor;
  final prefixIconColor;
  final errorBorderColor;
  final price;
  String value;
  final bool team;
  final showPassword;
  final bool shape;
  final bool disable;
  final teamCategories;
  final Function? callBackfunc;
  String? Function(String?)? validator;
  RegularDropDownInputNew({
    this.keyboardType,
    this.label = "Label",
    this.controller,
    this.hintText = "",
    this.prefix,
    this.protectedText = false,
    required this.value,
    this.mandatory = false,
    this.description = false,
    this.inputFormatters,
    this.gender = false,
    this.password = false,
    this.showPassword,
    this.favoriteSport = false,
    this.area = false,
    this.confirmPassword = false,
    this.passwordText = " ",
    this.birthDate = false,
    this.birthDateText = "",
    this.controller1,
    this.paymentMethod = false,
    this.restOfPaymentMethod = false,
    this.team = false,
    this.shape = false,
    required this.fillColor,
    required this.hintTextColor,
    required this.prefixIconColor,
    required this.errorBorderColor,
    this.price = 0.0,
    this.disable = false,
    this.teamCategories,
    this.callBackfunc,
    this.validator,
  });

  @override
  State<RegularDropDownInputNew> createState() => _RegularTextInputState();
}

class _RegularTextInputState extends State<RegularDropDownInputNew> {
  var teamCategories;

  bool isPressed = false;

  var shapes = ['Circular', 'Rectangular'];
  var genders = [
    'Male',
    'Female',
  ];
  var teams = [
    'Argentina',
    'Australia',
    'Belgium',
    'Brazil',
    'Cameroon',
    'Canada',
    'Costa Rica',
    'Croatia',
    'Denmark',
    'Ecuador',
    'England',
    'France',
    'Germany',
    'Ghana',
    'Iran',
    'Japan',
    'Korea Republic',
    'Mexico',
    'Morocco',
    ' Netherlands',
    'Poland',
    'Portugal',
    'Qatar',
    'Saudi Arabia',
    'Senegal',
    'Spain',
    'Switzerland',
    'Tunisia',
    'United States',
    'Uruguay',
    'Wales',
    'Serbia',
  ];

  // void datePick() {
  //   showModalBottomSheet<void>(
  //     backgroundColor: secondary,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return DatePicker();
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isPressed)
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontFamily: 'SfProRounded',
                      fontSize: 12,
                      color:
                          (widget.team || widget.shape) ? tertiary : secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : SizedBox(
                  height: 18,
                ),
          Container(
            // height: 40,
            child: DropdownButtonFormField(
              value: widget.value,
              validator: widget.validator,
              dropdownColor: secondary,

              style: TextStyle(
                  color: (widget.team || widget.shape) ? tertiary : secondary,
                  fontFamily: 'SfProRounded',
                  fontSize: 14),
              onTap: () {
                setState(() {
                  isPressed = true;
                });
              },

              // itemHeight: 40.0,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor,
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
                    borderSide:
                        BorderSide(color: widget.errorBorderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide.none),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: widget.errorBorderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  errorStyle: TextStyle(
                      color: widget.errorBorderColor,
                      height: 0.1,
                      fontSize: 10,
                      fontFamily: 'SfProRounded',
                      decoration: TextDecoration.underline),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      fontFamily: 'SfProRounded',
                      color: widget.hintTextColor,
                      fontSize: 14)),
              items: (widget.team)
                  ? teams.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList()
                  : (widget.gender)
                      ? genders.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()
                      : (widget.shape)
                          ? shapes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList()
                          : null,

              onChanged: (String? val) {
                widget.value = val!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/guest-button.dart';
import 'package:world_cup_system_frontend_web/common/components/signup-button.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/common/components/signin-button.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/views/navigations-view-new.dart';

import '../common/components/regular_text_input_new.dart';

class SignUp extends StatefulWidget {
  final bool triggerLogoutEvent;
  SignUp({this.triggerLogoutEvent = false});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends MomentumState<SignUp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _emailController = TextEditingController();

  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _submit() async {
    // _tryConnection();
    Navigator.pop(context);
    Navigator.pushNamed(context, '/signUp');
    // if (_isConnectionSuccessful != false) {
    if (_formKey.currentState!.validate()) {
      // Momentum.controller<AuthController>(context).handleEmailLogin(
      //     _emailController.text.trim(), _passwordController.text, context);
    }
    // }
  }

  //Gender items
  String dropdownvalue = 'Male';
  var genderItems = ['Male', 'Female'];

  //Role items
  String dropDownValueRole = 'Fan';
  var roleItems = ['Manager', 'Fan', 'Admin'];

  late StreamSubscription _connectivitySubscription;
  bool? _isConnectionSuccessful;

  void initMomentumState() {
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final _userController = Momentum.controller<AuthController>(context);
    return MomentumBuilder(
        controllers: [AuthController],
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor:
                Color(0xFF56042C), //set the colors of the scaffold is white
            body: GestureDetector(
              onTap: () {
                // if (_isConnectionSuccessful == false) {
                //   _tryConnection();
                // }
              },
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 330,
                    child: Image.asset(
                        "lib/assets/World-Cup-logo-landscape-on-dark.webp"),
                  ),
                  Center(
                    child: Expanded(
                      child: Container(
                        width: _width * 0.3,
                        height: _height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              child: SafeArea(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 29, left: 29),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text.rich(TextSpan(
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                      text: 'Sign Up',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 42,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'SfProRounded',
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                            // SignUpHereButton(
                                            //   signUp: false,
                                            // ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(
                                            left: (35 / 390) * _width,
                                            right: (35 / 390) * _width,
                                            top: (19 / 844) * _height,
                                            bottom: (19 / 844) * _height),
                                        child: Form(
                                            key: _formKey,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  // color: Colors.pink,
                                                  height: (72 / 844) * _height,
                                                  child: RegularTextInputNew(
                                                    labelColor: secondary,
                                                    textColor: secondary,
                                                    fillColor: Colors.white,
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "Username",
                                                    hintText: "Username",
                                                    controller:
                                                        _usernameController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          (2 / 844) * _height),
                                                  child: RegularTextInputNew(
                                                    labelColor: secondary,
                                                    textColor: secondary,
                                                    fillColor: Colors.white,
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    password: true,
                                                    label: "Password",
                                                    hintText: "Password",
                                                    protectedText: _obscureText,
                                                    controller:
                                                        _passwordController,
                                                    showPassword: _showPassword,
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
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "First Name",
                                                    hintText: "First Name",
                                                    controller:
                                                        _firstNameController,
                                                    keyboardType:
                                                        TextInputType.name,
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
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "Last Name",
                                                    hintText: "Last Name",
                                                    controller:
                                                        _lastNameController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                  ),
                                                ),
                                                //Date of Birth
                                                Container(
                                                  alignment: Alignment.center,
                                                  // color: Colors.pink,
                                                  height: (72 / 844) * _height,
                                                  child: RegularTextInputNew(
                                                    labelColor: secondary,
                                                    textColor: secondary,
                                                    fillColor: Colors.white,
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "Date of Birth",
                                                    hintText: "yyyy-mm-dd",
                                                    controller:
                                                        _dateOfBirthController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                  ),
                                                ),
                                                // ForgotPasswordTextButton(),
                                                // gender as a dropdown
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  alignment: Alignment.center,
                                                  // color: Colors.pink,
                                                  height: (40 / 844) * _height,
                                                  child:
                                                      DropdownButtonFormField(
                                                    dropdownColor:
                                                        Color(0xFFECEFFD),

                                                    style: const TextStyle(
                                                        color: secondary,
                                                        fontFamily:
                                                            'SfProRounded',
                                                        fontSize: 14),
                                                    // Initial Value
                                                    value: dropdownvalue,
                                                    decoration:
                                                        const InputDecoration(
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            8,
                                                                        horizontal:
                                                                            10),
                                                            disabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      width:
                                                                          1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(Radius.circular(
                                                                            6)),
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      width:
                                                                          1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            errorStyle: TextStyle(
                                                                height: 0.1,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'SfProRounded',
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                            hintStyle: TextStyle(
                                                                fontFamily:
                                                                    'SfProRounded',
                                                                fontSize: 14)),

                                                    // Down Arrow Icon
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),

                                                    // Array list of items
                                                    items: genderItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownvalue =
                                                            newValue!;
                                                      });
                                                    },
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
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "Nationality",
                                                    hintText: "Nationality",
                                                    controller:
                                                        _nationalityController,
                                                    keyboardType:
                                                        TextInputType.name,
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
                                                    hintTextColor:
                                                        Color(0x940A1F33),
                                                    prefixIconColor:
                                                        Color(0x94192B37),
                                                    errorBorderColor:
                                                        Color(0xFFFD7542),
                                                    email: true,
                                                    label: "Email Address",
                                                    hintText: "Email Address",
                                                    controller:
                                                        _emailController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  alignment: Alignment.center,
                                                  // color: Colors.pink,
                                                  height: (40 / 844) * _height,
                                                  child:
                                                      DropdownButtonFormField(
                                                    dropdownColor:
                                                        Color(0xFFECEFFD),

                                                    style: const TextStyle(
                                                        color: secondary,
                                                        fontFamily:
                                                            'SfProRounded',
                                                        fontSize: 14),
                                                    // Initial Value
                                                    value: dropDownValueRole,
                                                    decoration:
                                                        const InputDecoration(
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            8,
                                                                        horizontal:
                                                                            10),
                                                            disabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      width:
                                                                          1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(Radius.circular(
                                                                            6)),
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      width:
                                                                          1.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                            errorStyle: TextStyle(
                                                                height: 0.1,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'SfProRounded',
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                            hintStyle: TextStyle(
                                                                fontFamily:
                                                                    'SfProRounded',
                                                                fontSize: 14)),

                                                    // Down Arrow Icon
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),

                                                    // Array list of items
                                                    items: roleItems
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(items),
                                                      );
                                                    }).toList(),
                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropDownValueRole =
                                                            newValue!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),

                                      MomentumBuilder(
                                          controllers: [],
                                          builder: (context, snapshot) {
                                            var loadingState = false;
                                            // snapshot<AuthModel>().loginInProgress;
                                            return SignUpButton(
                                                getStarted: false,
                                                signIn: true,
                                                onPressed:
                                                    dropDownValueRole == "Admin"
                                                        ? () {
                                                            _userController.signUpAsAdmin(
                                                                context,
                                                                _usernameController
                                                                    .text,
                                                                _passwordController
                                                                    .text,
                                                                _firstNameController
                                                                    .text,
                                                                _lastNameController
                                                                    .text,
                                                                _nationalityController
                                                                    .text,
                                                                dropdownvalue,
                                                                _emailController
                                                                    .text,
                                                                _dateOfBirthController
                                                                    .text);
                                                          }
                                                        : dropDownValueRole ==
                                                                "Manager"
                                                            ? () {
                                                                _userController.signUpAsManager(
                                                                    context,
                                                                    _usernameController
                                                                        .text,
                                                                    _passwordController
                                                                        .text,
                                                                    _firstNameController
                                                                        .text,
                                                                    _lastNameController
                                                                        .text,
                                                                    _nationalityController
                                                                        .text,
                                                                    dropdownvalue,
                                                                    _emailController
                                                                        .text,
                                                                    _dateOfBirthController
                                                                        .text);
                                                              }
                                                            : () {
                                                                _userController.signUpAsFan(
                                                                    context,
                                                                    _usernameController
                                                                        .text,
                                                                    _passwordController
                                                                        .text,
                                                                    _firstNameController
                                                                        .text,
                                                                    _lastNameController
                                                                        .text,
                                                                    _nationalityController
                                                                        .text,
                                                                    dropdownvalue,
                                                                    _emailController
                                                                        .text,
                                                                    _dateOfBirthController
                                                                        .text);
                                                              });
                                          }),
                                      // add space between buttons

                                      // ListView(
                                      //   scrollDirection: Axis.horizontal,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

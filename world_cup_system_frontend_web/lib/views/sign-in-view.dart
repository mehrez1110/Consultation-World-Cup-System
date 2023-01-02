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
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/views/navigations-view-new.dart';

import '../common/components/regular_text_input_new.dart';

class SignIn extends StatefulWidget {
  final bool triggerLogoutEvent;
  SignIn({this.triggerLogoutEvent = false});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends MomentumState<SignIn> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _submit() async {
    // _tryConnection();

    // if (_isConnectionSuccessful != false) {
    if (_formKey.currentState!.validate()) {
      Momentum.controller<AuthController>(context).handleUsernNameLogin(
          _usernameController.text, _passwordController.text, context);
      //     _emailController.text.trim(), _passwordController.text, context);
    }
    // }
  }

//Route user to sign up page
  Future<void> _signUpSubmit() async {
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

  Future<void> _guestSubmit() async {
    // _tryConnection();
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
    // if (_isConnectionSuccessful != false) {
    if (_formKey.currentState!.validate()) {
      // Momentum.controller<AuthController>(context).handleEmailLogin(
      //     _emailController.text.trim(), _passwordController.text, context);
    }
    // }
  }

  late StreamSubscription _connectivitySubscription;
  bool? _isConnectionSuccessful;

  void initMomentumState() {
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(
        controllers: [],
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor:
                Color(0xFF56042C), //set the colors of the scaffold is white
            body: Column(
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
                      width: 430,
                      height: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,
                      //       colors: [
                      //         Color(0xFFFBFBFE),
                      //         Color(0xFFECEFFD),
                      //       ],
                      //     )),
                      // decoration: BoxDecoration(
                      //   gradient:
                      // ),
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Container(
                                  //   margin: EdgeInsets.only(
                                  //     left: (29 / 390) * _width,
                                  //     top: (30 / 844) * _height,
                                  //   ),
                                  //   child: Image.asset(
                                  //     'lib/assets/fora-logo.png',
                                  //     height: (59 / 844) * _height,
                                  //     width: (111 / 390) * _width,
                                  //     alignment: Alignment.centerLeft,
                                  //   ),
                                  // ),

                                  Container(
                                    margin: EdgeInsets.only(top: 29, left: 29),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text.rich(
                                              TextSpan(children: <InlineSpan>[
                                            TextSpan(
                                              text: 'Sign in',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 42,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'SfProRounded',
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

                                              // color: Colors.pink,
                                              height: (72 / 844) * _height,
                                              child: RegularTextInputNew(
                                                name: true,
                                                labelColor: secondary,
                                                textColor: secondary,
                                                fillColor: Colors.white,
                                                hintTextColor:
                                                    Color(0x940A1F33),
                                                prefixIconColor:
                                                    Color(0x94192B37),
                                                errorBorderColor:
                                                    Color(0xFFFD7542),
                                                label: "Username",
                                                hintText: "Username",
                                                controller: _usernameController,
                                                keyboardType:
                                                    TextInputType.name,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              // color: Colors.pink,
                                              height: (72 / 844) * _height,
                                              margin: EdgeInsets.only(
                                                  bottom: (2 / 844) * _height),
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
                                                controller: _passwordController,
                                                showPassword: _showPassword,
                                              ),
                                            ),
                                            // ForgotPasswordTextButton(),
                                          ],
                                        )),
                                  ),
                                  MomentumBuilder(
                                      controllers: [],
                                      builder: (context, snapshot) {
                                        var loadingState = false;
                                        // snapshot<AuthModel>().loginInProgress;
                                        return SignInButton(
                                          getStarted: false,
                                          signIn: true,
                                          onPressed: _submit,
                                        );
                                      }),
                                  // add space between buttons
                                  Container(
                                    height: _height * 0.01,
                                  ),
                                  MomentumBuilder(
                                      controllers: [],
                                      builder: (context, snapshot) {
                                        var loadingState = false;
                                        // snapshot<AuthModel>().loginInProgress;
                                        return SignUpButton(
                                          getStarted: false,
                                          signIn: true,
                                          onPressed: _signUpSubmit,
                                        );
                                      }),
                                  // add space between buttons
                                  Container(
                                    height: _height * 0.01,
                                  ),
                                  MomentumBuilder(
                                      controllers: [],
                                      builder: (context, snapshot) {
                                        var loadingState = false;
                                        // snapshot<AuthModel>().loginInProgress;
                                        return GuestButton(
                                          getStarted: false,
                                          signIn: true,
                                          onPressed: _guestSubmit,
                                        );
                                      })

                                  // ListView(
                                  //   scrollDirection: Axis.horizontal,
                                  // )
                                ],
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
          );
        });
  }
}

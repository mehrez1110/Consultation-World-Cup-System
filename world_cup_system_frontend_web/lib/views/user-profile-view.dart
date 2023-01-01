import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:momentum/momentum.dart';

import '../common/components/regular_text_input_new.dart';
import '../common/constants.dart';
import '../controllers/auth-controller.dart';
import '../models/auth-model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return MomentumBuilder(
        controllers: [AuthController],
        builder: (context, snapshot) {
          var currentUser = snapshot<AuthModel>().currentUser;
          var currentAuth = snapshot<AuthModel>();
          var emoji;
          if (currentUser.gender.toString() == "male") {
            emoji = "👨";
          } else {
            emoji = "👩";
          }
          return Scaffold(
              key: _scaffoldKey,
              body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFFFBFBFE),
                      Color(0xFFECEFFD),
                    ])),
                child: ListView(children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: (40 / 840) * _height,
                      left: (28 / 390) * _width,
                      right: (28 / 390) * _width,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text.rich(TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: 'Profile' + emoji,
                        style: TextStyle(
                          color: primary,
                          fontSize: (36 / 844) * _height,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SfProRounded',
                        ),
                      ),
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: (30 / 840) * _height,
                      left: (28 / 390) * _width,
                      right: (28 / 390) * _width,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: (68 / 844) * _height,
                              width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "First Name",
                                hintText: currentUser.firstName,
                              ),
                            ),
                            SizedBox(
                              width: (10 / 390) * _width,
                            ),
                            Expanded(
                              child: Container(
                                height: (68 / 844) * _height,
                                // margin: EdgeInsets.only(left: 5),
                                // width: 0.4 * _width,
                                child: RegularTextInputNew(
                                  labelColor: primary,
                                  textColor: secondary,
                                  fillColor: Color(0x21797979),
                                  hintTextColor: Color(0x940A1F33),
                                  prefixIconColor: Color(0x94192B37),
                                  errorBorderColor: Color(0xFFFD7542),
                                  name: true,
                                  disable: true,
                                  label: "Last Name",
                                  hintText: currentUser.lastName,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: (68 / 844) * _height,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                email: true,
                                label: "Email",
                                hintText: currentUser.email,
                                disable: true,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              height: (68 / 844) * _height,
                              // width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "Username",
                                hintText: currentUser.username,
                              ),
                            ),
                            Container(
                              height: (68 / 844) * _height,
                              // width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "Gender",
                                hintText: currentUser.gender,
                              ),
                            ),
                            Container(
                              height: (68 / 844) * _height,
                              // width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "Birthdate",
                                hintText: currentUser.birthDate,
                              ),
                            ),
                            Container(
                              height: (68 / 844) * _height,
                              // width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "Nationality",
                                hintText: currentUser.nationality,
                              ),
                            ),
                            Container(
                              height: (68 / 844) * _height,
                              // width: 0.4 * _width,
                              child: RegularTextInputNew(
                                labelColor: primary,
                                textColor: secondary,
                                fillColor: Color(0x21797979),
                                hintTextColor: Color(0x940A1F33),
                                prefixIconColor: Color(0x94192B37),
                                errorBorderColor: Color(0xFFFD7542),
                                name: true,
                                disable: true,
                                label: "Role",
                                hintText: currentUser
                                    .role[currentUser.role.length - 1].name,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: (80 / 390) * _width,
                            left: (28 / 390) * _width),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                  color: secondary,
                                  fontFamily: 'sfprorounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: (16 / 844) * _height),
                            )),
                      ),
                      Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: (80 / 390) * _width,
                            left: (28 / 390) * _width),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Edit Personal Data',
                              style: TextStyle(
                                  color: secondary,
                                  fontFamily: 'sfprorounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: (16 / 844) * _height),
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(
                              left: (28 / 390) * _width,
                              right: (28 / 390) * _width,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: secondary,
                                    width: (1 / 390) * _width),
                                borderRadius:
                                    BorderRadius.circular((43 / 390) * _width),
                              ),
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    color: secondary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: (16 / 844) * _height,
                                    fontFamily: 'sfprorounded'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ));
        });
  }
}

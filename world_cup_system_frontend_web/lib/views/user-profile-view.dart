import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/new-password-sheet.dart';
import 'package:world_cup_system_frontend_web/views/sign-in-view.dart';

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
  // set state to false to disable editing
  bool editable = false;

  // set state function
  void setEditable(bool value) {
    setState(() {
      editable = value;
    });
  }

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userController = Momentum.controller<AuthController>(context);
    _usernameController.text = userController.model.currentUser.username;
    _emailController.text = userController.model.currentUser.email;
    _firstNameController.text = userController.model.currentUser.firstName;
    _lastNameController.text = userController.model.currentUser.lastName;
    _emailController.text = userController.model.currentUser.email;
    _genderController.text = userController.model.currentUser.gender;
    _nationalityController.text = userController.model.currentUser.nationality;
    _dateOfBirthController.text = userController.model.currentUser.birthDate;

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // bool editable = false;
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
                                disable: !editable ? true : false,
                                label: "First Name",
                                hintText: currentUser.firstName,
                                controller: _firstNameController,
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
                                  disable: !editable ? true : false,
                                  label: "Last Name",
                                  hintText: currentUser.lastName,
                                  controller: _lastNameController,
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
                                disable: !editable ? true : false,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
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
                                disable: !editable ? true : false,
                                label: "Username",
                                hintText: currentUser.username,
                                controller: _usernameController,
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
                                disable: !editable ? true : false,
                                label: "Gender",
                                hintText: currentUser.gender,
                                controller: _genderController,
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
                                disable: !editable ? true : false,
                                label: "Birthdate",
                                hintText: currentUser.birthDate,
                                controller: _dateOfBirthController,
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
                                disable: !editable ? true : false,
                                label: "Nationality",
                                hintText: currentUser.nationality,
                                controller: _nationalityController,
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
                                disable: !editable ? true : false,
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: primary,
                                  insetPadding: EdgeInsets.all(0),
                                  content: NewPasswordViewSheet(),
                                ),
                              );
                            },
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                  color: secondary,
                                  fontFamily: 'sfprorounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: (16 / 844) * _height),
                            )),
                      ),
                      Column(
                        children: [
                          Container(
                            // alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                right: (80 / 390) * _width,
                                left: (28 / 390) * _width),
                            child: TextButton(
                                onPressed: () {
                                  setEditable(!editable);
                                },
                                child: Text(
                                  'Edit Personal Data',
                                  style: TextStyle(
                                      color: secondary,
                                      fontFamily: 'sfprorounded',
                                      fontWeight: FontWeight.bold,
                                      fontSize: (16 / 844) * _height),
                                )),
                          ),
                          !editable
                              ? Container()
                              : Container(
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      right: (80 / 390) * _width,
                                      left: (28 / 390) * _width),
                                  child: TextButton(
                                      onPressed: () {
                                        // call function to edit data
                                        userController.updateUser(
                                          context,
                                          currentUser.id,
                                          _usernameController.text,
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _nationalityController.text,
                                          _genderController.text,
                                          _emailController.text,
                                          _dateOfBirthController.text,
                                        );
                                      },
                                      child: Text(
                                        'Confirm Edit',
                                        style: TextStyle(
                                            color: secondary,
                                            fontFamily: 'sfprorounded',
                                            fontWeight: FontWeight.bold,
                                            fontSize: (16 / 844) * _height),
                                      )),
                                ),
                        ],
                      ),
                      Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: () async {
                            Momentum.resetAll(context);

                            await Navigator.popAndPushNamed(context, "/");
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: (28 / 390) * _width,
                              right: (28 / 390) * _width,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: primary, width: (1 / 390) * _width),
                                borderRadius:
                                    BorderRadius.circular((43 / 390) * _width),
                              ),
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w700,
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

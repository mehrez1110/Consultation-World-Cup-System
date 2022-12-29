import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpButton extends StatelessWidget {
  final onPressed;
  final bool signIn;
  final bool getStarted;
  bool survey = false;
  final title;
  SignUpButton({
    required this.signIn,
    this.onPressed,
    this.survey = false,
    required this.getStarted,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: (signIn || survey || getStarted)
          ? Center(
              child: Container(
                  height: (30),
                  width: (220),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: (signIn)
                            ? Color(0x66214461)
                            : (survey || getStarted)
                                ? Color(0x4D85BE01)
                                : Colors.white,
                        spreadRadius: -5,
                        blurRadius: 34,
                        offset: Offset(0, 10),
                      )
                    ],
                    gradient: (signIn)
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 220, 166, 5),
                              Color(0xFFFEC310)
                            ],
                          )
                        : (!signIn && !survey)
                            ? LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF98CE12), Color(0xFFACDE24)],
                              )
                            : LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF98CE12), Color(0xFFACDE24)],
                              ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: (31 / 844) * _height,
                    width: (180 / 390) * _width,
                    alignment: Alignment.center,
                    child: Text(
                      (signIn)
                          ? 'Sign up'
                          : (getStarted)
                              ? title
                              : (survey)
                                  ? 'Sign up'
                                  : "",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: (signIn)
                                  ? Color(0x8C000000)
                                  : (survey || getStarted)
                                      ? Color(0x40000000)
                                      : Colors.white,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(1, 1),
                            )
                          ],
                          fontSize: (18 / 844) * _height,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SfProRounded',
                          color: Colors.white),
                    ),
                  )),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(right: (28 / 390) * _width),
                    height: (50 / 844) * _height,
                    width: (50 / 390) * _width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x4D85BE01),
                            spreadRadius: 0,
                            blurRadius: 34,
                            offset: Offset(0, 10),
                          )
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF85BE01), Color(0xFFACDE24)],
                        ),
                        borderRadius:
                            BorderRadius.circular((50 / 390) * _width)),
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0x8C00000),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          )
                        ]),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ))),
              ],
            ),
    );
  }
}

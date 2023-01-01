// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momentum/momentum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/match-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/views/matches-view.dart';
import 'package:world_cup_system_frontend_web/views/navigations-view-new.dart';
import 'package:world_cup_system_frontend_web/views/sign-in-view.dart';
import 'package:world_cup_system_frontend_web/views/sign-up-view.dart';

// import 'controllers/booking-sports-events-controller.dart';

var token;
var fcmToken;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  if (fcmToken != null) {
    print("FcmToken " + fcmToken);
  } else {
    print("null");
    fcmToken = "";
  }
  // }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(momentum());
  });
}

Momentum momentum() {
  return Momentum(
    controllers: [
      AuthController(),
      MatchController(),
      TicketController(),
      StadiumController()
    ],
    child: MyApp(),
    persistSave: (context, key, value) async {
      var sharedPref = await SharedPreferences.getInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      var result = await sharedPref.setString(key, value);
      return result;
    },
    persistGet: (context, key) async {
      var sharedPref = await SharedPreferences.getInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      var result = sharedPref.getString(key);
      return result;
    },
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends MomentumState<MyApp> {
  bool verified = false;

  @override
  Future<void> initMomentumState() async {
    // Momentum.controller<AuthController>(context)
    //     .getCurrentUserByToken(token, context);
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignIn(),
        '/home': (context) => NavigationBarViewNew(),
        '/matches': (context) => MatchView(),
        '/signUp': (context) => SignUp(),
      },
      color: secondary,
      debugShowCheckedModeBanner: false,
      title: 'World Cup 2022',
      theme: ThemeData(),
    );
  }
}

import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/models/auth-model.dart';

class AuthController extends MomentumController<AuthModel> {
  @override
  AuthModel init() {
    return AuthModel(
      this,
      email: '',
      currentUser: null,
      forgetPasswordInProgress: false,
    );
  }

  void changeBirthDate(String birthDate) async {
    model.update(birthDate: birthDate);
  }

// Navigate to login options page
  void goToLoginPage(context) {}

  Future<void> handleUsernNameLogin(
      String username, String password, context) async {
    try {
      print("pass: $password");
      model.update(loginInProgress: true);
      var url = Uri.http(STAGING_URL, "/api/login");
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode(
            <String, String>{"username": username, "password": password}),
      );
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var accessToken = jsonResponse["access_token"];
        var refreshToken = jsonResponse["refresh_token"];
        model.update(
          tempToken: accessToken,
        );
        var id = jsonResponse["id"];
        // Get user data by calling the user endpoint
        await getUserData(context, username);
        // model.update(
        //   loginInProgress: false,
        // );
        if (model.currentUser!.status == "rejected") {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("📣Attention athlete"),
              content: Text("Your account is not approved yet"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            "/home",
          );
        }
      } else {
        // model.update(loginInProgress: false);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("📣Attention athlete"),
            content: Text("Something went wrong, please try again later"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // model.update(loginInProgress: false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("📣Attention athlete"),
          content: Text("Something went wrong, please try again later"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // get user data by calling the user endpoint
  Future<void> getUserData(context, String userName) async {
    try {
      var url = Uri.http(
          STAGING_URL, "/api/users/by-username/", {"username": userName});
      var response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        print("okaaayyy id");
        var jsonResponse = convert.jsonDecode(response.body);
        var currentUser = CurrentUserType.fromJson(jsonResponse);
        model.update(currentUser: currentUser, id: jsonResponse["id"]);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("📣Attention athlete"),
          content: Text("Something went wrong, please try again later"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> getAllUsers(context, String userName) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/users/");
      var response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        List users = [];

        for (var responseItem in jsonResponse) {
          var user = CurrentUserType.fromJson(responseItem);
          users.add(user);
        }
        model.update(listOfUsers: users);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("📣Attention athlete"),
          content: Text("Something went wrong, please try again later"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> deleteUser(context, int id) async {
    try {
      var url = Uri.http(STAGING_URL, "/api/users/", {"id": id.toString()});
      var response = await http.delete(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("📣Attention athlete"),
          content: Text("Something went wrong, please try again later"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> acceptUser(context, int id) async {
    try {
      var url =
          Uri.http(STAGING_URL, "/api/user/accept/", {"id": id.toString()});
      var response = await http.delete(
        url,
        headers: {
          'Authorization':
              'Bearer ${Momentum.controller<AuthController>(context).model.tempToken}',
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("📣Attention athlete"),
          content: Text("Something went wrong, please try again later"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // void goToHomePage(context, Ticket? toBeRatedTicket) {
  //   Navigator.push(
  //     context,
  //     CupertinoPageRoute(
  //         builder: (context) =>
  //             NavigationBarViewNew(toBeRatedTicket: toBeRatedTicket),
  //         fullscreenDialog: true),
  //   );
  // }

  // Future<void> handleAppBoot(context, fromSplash,
  //     {fromSurveyOrLogin = false, Ticket? toBeRatedTicket}) async {
  //   debugPrint("In handle app boot");
  //   debugPrint("isPhoneVerified: ${model.currentUser.isPhoneVerified}");
  //   debugPrint("Phone number: ${model.currentUser.phoneNumber}");
  //   if (model?.currentUser?.accessToken != null) {
  //     if (model.currentUser.isPhoneVerified) {
  //       Navigator.of(context).pop();
  //       goToHomePage(context, toBeRatedTicket);
  //     } else {
  //       notifyError(
  //         context,
  //         title: "📣Attention athlete",
  //         message: "Please verify your phone number to start competing🏆",
  //       );
  //       // Ask user to verify phone number
  //       if (fromSurveyOrLogin) {
  //         Momentum.controller<AuthController>(context)
  //             .handleSendCodeForPhoneVerification(
  //           "+2" + model.currentUser.phoneNumber,
  //           context,
  //         );
  //       }
  //       showModalBottomSheet<void>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return PinCodeVerificationScreen(
  //             phoneNumber: model.currentUser.phoneNumber,
  //             verifyingPhoneNumber: true,
  //           );
  //         },
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(
  //             top: Radius.circular(
  //               (25.0),
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   } else {
  //     goToLoginPage(context);
  //   }
  // }

  // validateEmailLogin(String email, String password) {
  //   var result = {"valid": false, "error": ""};
  //   if (email.length > 0) {
  //     if (password.length > 0) {
  //       result["valid"] = true;
  //     } else {
  //       result["error"] = "The password field cannot be empty!";
  //     }
  //   } else {
  //     result["error"] = "The email field cannot be empty!";
  //   }
  //   return result;
  // }

  // validateEmailSignUp(
  //     String firstName, String lastName, String email, String password) {
  //   var result = {"valid": false, "error": ""};
  //   if (firstName.length > 0) {
  //     if (lastName.length > 0) {
  //       if (email.length > 0) {
  //         if (password.length > 0) {
  //           result["valid"] = true;
  //         } else {
  //           result["error"] = "The password field cannot be empty!";
  //         }
  //       } else {
  //         result["error"] = "The email field cannot be empty!";
  //       }
  //     } else {
  //       result["error"] = "The lastname field cannot be empty!";
  //     }
  //   } else {
  //     result["error"] = "The firstname field cannot be empty!";
  //   }

  //   return result;
  // }

// // handle the login via email
//   void handleEmailLogin(email, password, context) async {
//     try {
//       final validation = validateEmailLogin(email, password);
//       if (validation["valid"]) {
//         model.update(
//           loginInProgress: true,
//         );
//         var url = Uri.https(STAGING_URL, "/api/v1/users/login");
//         var response = await http.post(
//           url,
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(
//               <String, String>{'emailOrPhone': email, 'password': password}),
//         );
//         debugPrint("LOGIN RESPONSE:  ${response.body}");
//         if (response.statusCode == 200) {
//           var jsonResponse =
//               convert.jsonDecode(response.body) as Map<String, dynamic>;
//           print(jsonResponse['user']['location']);
//           model.update(
//             currentUser: CurrentUserType(
//               id: jsonResponse['user']['_id'],
//               accessToken: jsonResponse['token'],
//               firstName: jsonResponse['user']['firstName'],
//               lastName: jsonResponse['user']['lastName'],
//               phoneNumber: jsonResponse['user']['phone'],
//               isNotificationEnabled: jsonResponse['user']
//                   ['isNotificationEnabled'],
//               area: jsonResponse['user']['area'],
//               isPhoneVerified: jsonResponse['user']['isPhoneVerified'],
//             ),
//             email: jsonResponse['user']['email'],
//             area: jsonResponse['user']['area'],
//             isNotificationEnabled: jsonResponse['user']
//                 ['isNotificationEnabled'],
//             loginInProgress: true,
//           );
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setString(
//             'token',
//             jsonResponse['token'],
//           );
//           model.update(loginInProgress: false);
//           await Momentum.controller<TicketsController>(context)
//               .getUserFieldsTickets(
//                   Momentum.controller<AuthController>(context)
//                       .model
//                       .currentUser
//                       .id,
//                   context);
//           await Momentum.controller<TicketsController>(context)
//               .getUserSportsEventsPlayerTickets(context);
//           await Momentum.controller<TicketsController>(context)
//               .getUserSportsEventsSpectatorTickets(context);
//           Ticket? toBeRatedTicket =
//               Momentum.controller<TicketsController>(context)
//                   .getBookingToBeRated();
//           handleAppBoot(context, false,
//               fromSurveyOrLogin: true, toBeRatedTicket: toBeRatedTicket);
//         } else {
//           var jsonResponse =
//               convert.jsonDecode(response.body) as Map<String, dynamic>;
//           model.update(loginInProgress: false);

//           notifyError(context, message: jsonResponse['message']);

//           print('Request failed with status: ${response.statusCode}.');
//         }
//       } else {}
//     } catch (e) {
//       debugPrint('Caught error in handleEmailLogin: ${e.toString()}');
//     }
//   }

//   void handleEmailSignUp(firstName, lastName, email, password, confirmPassword,
//       phoneNumber, context) async {
//     final validation =
//         validateEmailSignUp(firstName, lastName, email, password);
//     print(firstName);
//     print(lastName);
//     print(email);
//     print("passsword:" + password);
//     print("confirmPassword:" + confirmPassword);
//     if (validation["valid"]) {
//       try {
//         model.update(
//           email: email,
//           signUpInProgress: true,
//         );
//         var url = Uri.https(STAGING_URL, "/api/v1/users");
//         var response = await http.post(
//           url,
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(<String, String>{
//             'firstName': firstName,
//             'lastName': lastName,
//             'email': email,
//             'password': password,
//             'confirmPassword': confirmPassword,
//             'phone': phoneNumber,
//           }),
//         );
//         print('register:');
//         if (response.statusCode == 200) {
//           var jsonResponse =
//               convert.jsonDecode(response.body) as Map<String, dynamic>;
//           model.update(
//             currentUser: CurrentUserType(
//               id: jsonResponse['user']['_id'],
//               accessToken: jsonResponse['token'],
//               firstName: jsonResponse['user']['firstName'],
//               lastName: jsonResponse['user']['lastName'],
//               phoneNumber: jsonResponse['user']['phone'],
//               area: jsonResponse['user']['area'],
//               isPhoneVerified: jsonResponse['user']['isPhoneVerified'],
//             ),
//             area: jsonResponse['user']['area'],
//             email: jsonResponse['user']['email'],
//             isNotificationEnabled: jsonResponse['user']
//                 ['isNotificationEnabled'],
//             signUpInProgress: true,
//           );
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setString(
//             'token',
//             jsonResponse['token'],
//           );
//           goToSurveyPage(context);
//           model.update(signUpInProgress: false);
//         } else {
//           model.update(signUpInProgress: false);
//           var jsonResponse =
//               convert.jsonDecode(response.body) as Map<String, dynamic>;
//           notifyError(context, message: jsonResponse['message']);
//           print('Request failed with status: ${response.statusCode}.');
//         }
//       } catch (e) {
//         debugPrint('Caught error in handleEmailSignUp: ${e.toString()}');
//       }
//     } else {}
//   }

  // Future<void> getCurrentUserByToken(token, context, String? fcmToken) async {
  //   try {
  //     var url = Uri.https(STAGING_URL, "/api/v1/users/me");
  //     var response = await http.get(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     debugPrint("getCurrentUserByToken RESPONSE:  ${response.body}");
  //     if (response.statusCode == 200) {
  //       var jsonResponse =
  //           convert.jsonDecode(response.body) as Map<String, dynamic>;
  //       debugPrint("FCM TOKEN");
  //       debugPrint(fcmToken.toString());
  //       debugPrint(jsonResponse['user']['fcmToken'].toString());
  //       if (jsonResponse['user']['fcmToken'] != fcmToken) {
  //         await setFcmToken(fcmToken, token);
  //       }
  //       model.update(
  //         currentUser: CurrentUserType(
  //           id: jsonResponse['user']['_id'],
  //           accessToken: token,
  //           firstName: jsonResponse['user']['firstName'],
  //           lastName: jsonResponse['user']['lastName'],
  //           phoneNumber: jsonResponse['user']['phone'],
  //           gender: jsonResponse['user']['gender'],
  //           birthDate: jsonResponse['user']['birthDate'],
  //           favoriteSport: jsonResponse['user']['favoriteSport'],
  //           area: jsonResponse['user']['area'],
  //           isPhoneVerified: jsonResponse['user']['isPhoneVerified'],
  //         ),
  //         email: jsonResponse['user']['email'],
  //         area: jsonResponse['user']['area'],
  //         isNotificationEnabled: jsonResponse['user']['isNotificationEnabled'],
  //       );
  //       model.update(verified: true);

  //       await Momentum.controller<TicketsController>(context)
  //           .getUserFieldsTickets(
  //               Momentum.controller<AuthController>(context)
  //                   .model
  //                   .currentUser
  //                   .id,
  //               context);
  //       await Momentum.controller<TicketsController>(context)
  //           .getUserSportsEventsPlayerTickets(context);
  //       await Momentum.controller<TicketsController>(context)
  //           .getUserSportsEventsSpectatorTickets(context);

  //       Ticket? toBeRatedTicket =
  //           Momentum.controller<TicketsController>(context)
  //               .getBookingToBeRated();
  //       handleAppBoot(context, false, toBeRatedTicket: toBeRatedTicket);
  //     } else {
  //       model.update(surveyInProgress: false);

  //       print('Request failed with status: ${response.statusCode}.');

  //       Navigator.push(
  //         context,
  //         CupertinoPageRoute(
  //             builder: (context) => OnBoardView(), fullscreenDialog: true),
  //       );
  //       model.update(verified: false);
  //     }
  //   } catch (e) {
  //     debugPrint('Caught error in getCurrentUserByToken: ${e.toString()}');
  //   }
  // }

  // handles the phone number verification

  // Future<void> setFcmToken(String? fcmToken, token) async {
  //   var url = Uri.https(STAGING_URL, "/api/v1/users/me/firebase-token");
  //   try {
  //     var response = await http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       },
  //       body: jsonEncode(
  //           <String, String>{'firebaseRegistrationToken': fcmToken.toString()}),
  //     );
  //     print(response.body);
  //   } catch (e) {
  //     debugPrint("Error caught in setFcmToken ${e.toString()}");
  //   }
  // }
}

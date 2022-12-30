// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/views/matches-view.dart';
import 'package:world_cup_system_frontend_web/views/sign-in-view.dart';
import 'package:world_cup_system_frontend_web/views/tickets-view.dart';

class NavigationBarViewNew extends StatefulWidget {
  const NavigationBarViewNew({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationBarViewNew> createState() => _NavigationBarState();
}

class _NavigationBarState extends MomentumState<NavigationBarViewNew>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void goToSearch() {
    setState(() {});
  }

  @override
  void initMomentumState() {
    var auth = Momentum.controller<AuthController>(context).model;
    var role = "Guest";
    if (auth.currentUser != null) {
      if (auth.currentUser.role.any((role) => role.name == "ADMIN")) {
        role = "ADMIN";
      } else if (auth.currentUser.role.any((role) => role.name == "MANAGER")) {
        role = "MANAGER";
      } else if (auth.currentUser.role.any((role) => role.name == "USER")) {
        role = "USER";
      }
    }

    _tabController = TabController(
        vsync: this,
        length: role == "ADMIN"
            ? 5
            : (role == 'MANAGER')
                ? 4
                : role == 'USER'
                    ? 3
                    : 1,
        initialIndex: 0)
      ..addListener(() {
        setState(() {
          switch (_tabController.index) {
            case 0:
              // some code here
              // Home(callbackSearch: goToSearch);
              SignIn();

              break;

            case 1:
              // SearchCategoriesView();
              SignIn();

              break;
            // some code here
            case 2:
              // SearchSportsView();
              SignIn();

              break;
            case 3:
              // BookingsView();
              SignIn();
              break;

            case 4:
              SignIn();

              break;
            case 5:
              SignIn();

              break;
          }
        });
      });

    print("object");
    super.initMomentumState();
  }

  late StreamSubscription _connectivitySubscription;
  bool? _isConnectionSuccessful;

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isConnectionSuccessful = false;
      });
    }
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return MomentumBuilder(
        controllers: [AuthController],
        builder: (context, snapshot) {
          // var authModel = Momentum.controller<AuthController>(context).model;
          var auth = Momentum.controller<AuthController>(context).model;
          var role = "Guest";
          if (auth.currentUser != null) {
            if (auth.currentUser.role.any((role) => role.name == "ADMIN")) {
              role = "ADMIN";
            } else if (auth.currentUser.role
                .any((role) => role.name == "MANAGER")) {
              role = "MANAGER";
            } else if (auth.currentUser.role
                .any((role) => role.name == "USER")) {
              role = "USER";
            }
          }

          return DefaultTabController(
            length: role == 'ADMIN'
                ? 5
                : (role == 'MANAGER')
                    ? 4
                    : role == 'USER'
                        ? 3
                        : 1,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.settings,
                        color: secondary,
                      ))
                ],
                leadingWidth: 100,
                // titleSpacing: -5,
                // centerTitle: false,
                // title: Image.asset(
                //   "lib/assets/World-Cup-logo-landscape-on-dark.webp",
                //   height: 50,
                //   width: 200,
                // ),
                leading: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "lib/assets/World-Cup-logo-landscape-on-dark.webp",
                  ),
                ),
                backgroundColor: Color(0xFF56042C),
                title: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: primary,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF56042C),
                          Color.fromARGB(255, 86, 4, 38),
                        ],
                      ),
                    ),
                    child: role == 'USER'
                        ? TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(
                                iconMargin: EdgeInsets.all(5),
                                text: 'Matches',
                              ),
                              Tab(
                                text: 'Tickets',
                              ),
                              Tab(
                                text: 'Profile',
                              ),
                            ],
                            labelStyle: TextStyle(
                                fontSize: 11.0, fontFamily: 'SfProRounded'),
                            labelColor: secondary,
                            unselectedLabelColor: Colors.white,

                            // indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: secondary,
                          )
                        : role == 'Guest'
                            ? TabBar(
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    iconMargin: EdgeInsets.all(5),
                                    text: 'Matches',
                                  )
                                ],
                                labelStyle: TextStyle(
                                    fontSize: 11.0, fontFamily: 'SfProRounded'),
                                labelColor: secondary,
                                unselectedLabelColor: Colors.white,

                                // indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: secondary,
                              )
                            : (role == 'MANAGER')
                                ? TabBar(
                                    controller: _tabController,
                                    tabs: [
                                      Tab(
                                        iconMargin: EdgeInsets.all(5),
                                        text: 'Matches',
                                      ),
                                      Tab(
                                        text: 'Tickets',
                                      ),
                                      Tab(
                                        text: 'Stadiums',
                                      ),
                                      Tab(
                                        text: 'Profile',
                                      ),
                                    ],
                                    labelStyle: TextStyle(
                                        fontSize: 11.0,
                                        fontFamily: 'SfProRounded'),
                                    labelColor: secondary,
                                    unselectedLabelColor: Colors.white,

                                    // indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: secondary,
                                  )
                                : TabBar(
                                    controller: _tabController,
                                    tabs: [
                                      Tab(
                                        iconMargin: EdgeInsets.all(5),
                                        text: 'Matches',
                                      ),
                                      Tab(
                                        text: 'Tickets',
                                      ),
                                      Tab(
                                        text: 'Stadiums',
                                      ),
                                      Tab(
                                        text: 'Users',
                                      ),
                                      Tab(
                                        text: 'Profile',
                                      ),
                                    ],
                                    labelStyle: TextStyle(
                                        fontSize: 11.0,
                                        fontFamily: 'SfProRounded'),
                                    labelColor: secondary,
                                    unselectedLabelColor: Colors.white,

                                    // indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: secondary,
                                  )),
              ),
              body: GestureDetector(
                onTap: () {
                  if (_isConnectionSuccessful == false) {
                    _tryConnection();
                  }
                },
                child: Stack(
                  children: [
                    role == 'USER'
                        ? TabBarView(
                            controller: _tabController,
                            children: [
                              MatchView(),
                              TicketsView(),
                              MatchView(),
                            ],
                          )
                        : (role == 'MANAGER')
                            ? TabBarView(
                                controller: _tabController,
                                children: [
                                  MatchView(),
                                  TicketsView(),
                                  MatchView(),
                                  MatchView(),
                                ],
                              )
                            : (role == 'ADMIN')
                                ? TabBarView(
                                    controller: _tabController,
                                    children: [
                                      MatchView(),
                                      TicketsView(),
                                      MatchView(), //stadiums
                                      MatchView(), //users
                                      MatchView(), //profile
                                    ],
                                  )
                                : TabBarView(
                                    controller: _tabController,
                                    children: [
                                      MatchView(),
                                    ],
                                  ),
                  ],
                ),
              ),
              // getBodymodel(_selectedIndex),
              // widgetOptions.elementAt(_selectedIndex),
              backgroundColor: Color(0xFFECEFFD),

              // BottomNavigationBar(
              //   landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              //   backgroundColor: secondary,
              //   unselectedFontSize: 10,
              //   selectedFontSize: 10,
              //   items: <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.home_outlined),
              //       label: 'Home',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.search),
              //       label: 'Explore',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.book_sharp),
              //       label: 'Bookings',
              //     ),
              //   ],
              //   currentIndex: _selectedIndex,
              //   selectedItemColor: primary,
              //   unselectedItemColor: Colors.white,
              //   onTap: _onItemTapped,
              // ),
            ),
          );
        });
  }
}

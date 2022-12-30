// ignore: import_of_legacy_library_into_null_safe
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/auth-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';

import '../controllers/match-controller.dart';

// View models are models which are associated to a View.
// Don't confuse these with the ViewModels of MVVM architecture.
// These are simply models which hold data for a view. The actions/events are still under the domain of a controller.

class MatchModel extends MomentumModel<MatchController> {
  final firstTeam;
  final secondTeam;
  final stadium;
  final dateTime;
  final mainReferee;
  final firstLinesman;
  final secondLinesman;
  final seatsLeft;

  MatchModel(MatchController controller,
      {this.firstTeam,
      this.secondTeam,
      this.stadium,
      this.dateTime,
      this.mainReferee,
      this.firstLinesman,
      this.secondLinesman,
      this.seatsLeft})
      : super(controller);

  @override
  void update(
      {String? firstTeam,
      String? secondTeam,
      String? stadium,
      DateTime? dateTime,
      String? mainReferee,
      String? firstLinesman,
      String? secondLinesman,
      int? seatsLeft}) {
    MatchModel(controller,
            firstTeam: firstTeam ?? this.firstTeam,
            secondTeam: secondTeam ?? this.secondTeam,
            stadium: stadium ?? this.stadium,
            dateTime: dateTime ?? this.dateTime,
            mainReferee: mainReferee ?? this.mainReferee,
            firstLinesman: firstLinesman ?? this.firstLinesman,
            secondLinesman: secondLinesman ?? this.secondLinesman,
            seatsLeft: seatsLeft ?? this.seatsLeft)
        .updateMomentum();
  }
}

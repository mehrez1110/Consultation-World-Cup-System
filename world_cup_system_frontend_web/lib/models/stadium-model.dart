import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';

// View models are models which are associated to a View.
// Don't confuse these with the ViewModels of MVVM architecture.
// These are simply models which hold data for a view. The actions/events are still under the domain of a controller.

class StadiumModel extends MomentumModel<StadiumController> {
  final stadiumslist;

  final List<String>? stadiumsNames;

  StadiumModel(
    StadiumController controller, {
    this.stadiumslist,
    this.stadiumsNames,
  }) : super(controller);

  @override
  void update({
    id,
    name,
    shape,
    seatsCount,
    vipLounge,
    stadiumslist,
    List<String>? stadiumsNames,
  }) {
    StadiumModel(
      controller,
      stadiumslist: stadiumslist ?? this.stadiumslist,
      stadiumsNames: stadiumsNames ?? this.stadiumsNames,
    ).updateMomentum();
  }

  static fromJson2(responseItem) {
    return StadiumModel(
      StadiumController(),
    );
  }
}

class Stadium {
  final id;
  final name;
  final shape;
  final seatsCount;
  final vipSeatsCount;
  final vipRows;
  final vipColumns;

  Stadium({
    this.id,
    this.name,
    this.shape,
    this.seatsCount,
    this.vipSeatsCount,
    this.vipRows,
    this.vipColumns,
  });

  static fromJson(responseItem) {
    return Stadium(
      id: responseItem['id'],
      name: responseItem['name'],
      shape: responseItem['shape'],
      seatsCount: responseItem['seatsCount'],
      vipSeatsCount: responseItem['vipLounge'],
      vipColumns: responseItem['vipColumns'],
      vipRows: responseItem['vipRows'],
    );
  }

  // convert to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'shape': shape,
        'seatsCount': seatsCount,
        'vipSeatsCount': vipSeatsCount,
        'vipColumns': vipColumns,
        'vipRows': vipRows,
      };
}

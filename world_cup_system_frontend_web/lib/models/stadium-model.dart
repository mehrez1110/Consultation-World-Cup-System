import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/stadium-controller.dart';

// View models are models which are associated to a View.
// Don't confuse these with the ViewModels of MVVM architecture.
// These are simply models which hold data for a view. The actions/events are still under the domain of a controller.

class StadiumModel extends MomentumModel<StadiumController> {
  final id;
  final name;
  final shape;
  final seatsCount;
  final vipLounge;
  final stadiumslist;

  StadiumModel(
    StadiumController controller, {
    this.id,
    this.name,
    this.shape,
    this.seatsCount,
    this.vipLounge,
    this.stadiumslist,
  }) : super(controller);

  @override
  void update({
    id,
    name,
    shape,
    seatsCount,
    vipLounge,
    stadiumslist,
  }) {
    StadiumModel(
      controller,
      id: id ?? this.id,
      name: name ?? this.name,
      shape: shape ?? this.shape,
      seatsCount: seatsCount ?? this.seatsCount,
      vipLounge: vipLounge ?? this.vipLounge,
      stadiumslist: stadiumslist ?? this.stadiumslist,
    ).updateMomentum();
  }

  static fromJson2(responseItem) {
    return StadiumModel(
      StadiumController(),
      id: responseItem['id'],
      name: responseItem['name'],
      shape: responseItem['shape'],
      seatsCount: responseItem['seatsCount'],
      vipLounge: responseItem['vipLounge'],
    );
  }
}

import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/models/match-model.dart';
import 'package:world_cup_system_frontend_web/models/ticket-model.dart';

class TicketController extends MomentumController<TicketModel> {
  @override
  TicketModel init() {
    return TicketModel(
      this,
      // ticketMatch: MatchModel(this),
      seatNo: '',
      price: 0,
      isVip: false,
      ticketOwner: CurrentUserType(),
      ticketId: 0,
    );
  }
}

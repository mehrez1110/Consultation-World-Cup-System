import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/models/match-model.dart';

class TicketModel extends MomentumModel<TicketController> {
  // MatchModel ticketMatch;
  String seatNo;
  int price;
  bool isVip;
  CurrentUserType ticketOwner;
  int ticketId;

  TicketModel(TicketController controller,
      {
      // required this.ticketMatch,
      required this.seatNo,
      required this.price,
      required this.isVip,
      required this.ticketOwner,
      required this.ticketId})
      : super(controller);

  @override
  void update(
      {
      // MatchModel? ticketMatch,
      String? seatNo,
      int? price,
      bool? isVip,
      CurrentUserType? ticketOwner,
      int? ticketId}) {
    TicketModel(
      controller,
      // ticketMatch: ticketMatch ?? this.ticketMatch,
      seatNo: seatNo ?? this.seatNo,
      price: price ?? this.price,
      isVip: isVip ?? this.isVip,
      ticketOwner: ticketOwner ?? this.ticketOwner,
      ticketId: ticketId ?? this.ticketId,
    ).updateMomentum();
  }
}

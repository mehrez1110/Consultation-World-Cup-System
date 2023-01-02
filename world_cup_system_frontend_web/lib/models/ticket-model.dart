import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/models/match-model.dart';

class TicketModel extends MomentumModel<TicketController> {
  // MatchModel ticketMatch;
  final seatNo;
  final price;

  final ticketOwner;
  final userTickets;
  final matchTickets;
  final userVipTickets;
  final ticketId;
  TicketModel(TicketController controller,
      {this.userTickets,
      this.userVipTickets,
      this.matchTickets,
      // required this.ticketMatch,
      this.seatNo,
      this.price,
      this.ticketOwner,
      this.ticketId})
      : super(controller);

  @override
  void update(
      {
      // MatchModel? ticketMatch,
      List? userTickets,
      final matchTickets,
      List? userVipTickets,
      int? price,
      bool? isVip,
      CurrentUserType? ticketOwner,
      int? ticketId}) {
    TicketModel(
      controller,
      // ticketMatch: ticketMatch ?? this.ticketMatch,
      matchTickets: matchTickets ?? this.matchTickets,
      seatNo: seatNo ?? this.seatNo,
      userTickets: userTickets ?? this.userTickets,
      userVipTickets: userVipTickets ?? this.userVipTickets,
      price: price ?? this.price,
      ticketOwner: ticketOwner ?? this.ticketOwner,
      ticketId: ticketId ?? this.ticketId,
    ).updateMomentum();
  }
}

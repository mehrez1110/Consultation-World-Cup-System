import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/controllers/ticket-controller.dart';
import 'package:world_cup_system_frontend_web/data_models/current-user-type.dart';
import 'package:world_cup_system_frontend_web/data_models/vip-lounge-type.dart';
import 'package:world_cup_system_frontend_web/models/match-model.dart';

import '../controllers/vip-ticket-controller.dart';

class VipTicketModel extends MomentumModel<VipTicketController> {
  // MatchModel ticketMatch;
  final seatNo;
  final price;
  final vipLounge;
  final ticketOwner;
  final userTickets;
  final userVipTickets;
  final ticketId;
  VipTicketModel(VipTicketController controller,
      {this.userTickets,
      this.userVipTickets,
      this.seatNo,
      this.price,
      this.vipLounge,
      this.ticketOwner,
      this.ticketId})
      : super(controller);

  @override
  void update(
      {
      // MatchModel? ticketMatch,
      List? userTickets,
      List? userVipTickets,
      int? price,
      bool? isVip,
      VipLounge? vipLounge,
      CurrentUserType? ticketOwner,
      int? ticketId}) {
    VipTicketModel(
      controller,
      // ticketMatch: ticketMatch ?? this.ticketMatch,
      vipLounge: vipLounge ?? this.vipLounge,
      seatNo: seatNo ?? this.seatNo,
      userTickets: userTickets ?? this.userTickets,
      userVipTickets: userVipTickets ?? this.userVipTickets,
      price: price ?? this.price,
      ticketOwner: ticketOwner ?? this.ticketOwner,
      ticketId: ticketId ?? this.ticketId,
    ).updateMomentum();
  }
}

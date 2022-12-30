import 'package:flutter/cupertino.dart';
import 'package:world_cup_system_frontend_web/common/components/ticket.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
      width: _width * 0.7,
      child: Column(
        children: [
          const Text("My Tickets: ",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: primary)),
          Ticket(),
          Ticket(
            firstTeam: "Egypt",
            secondTeam: "France",
            vip: true,
          ),
          Ticket(
            firstTeam: "Brazil",
            secondTeam: "Argentina",
            vip: true,
          ),
        ],
      ),
    ));
  }
}

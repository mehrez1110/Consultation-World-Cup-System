import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:world_cup_system_frontend_web/common/components/seat-component.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';
import 'package:world_cup_system_frontend_web/controllers/vip-ticket-controller.dart';
import 'package:world_cup_system_frontend_web/models/vip-ticket-model.dart';

class VipComponent extends StatefulWidget {
  const VipComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<VipComponent> createState() => _VipComponentState();
}

class _VipComponentState extends MomentumState<VipComponent> {
  @override
  void initMomentumState() {
    super.initMomentumState();
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MomentumBuilder(
        controllers: [VipTicketController],
        builder: (context, snapshot) {
          var model = snapshot<VipTicketModel>();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // centerTitle: true,
              backgroundColor: primary,
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: secondary,
                      size: (30 / 844) * _height,
                    )),
              ],
              title: Container(
                  child: Text(
                "Welcome to Vip Lounge 👑",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              )),
            ),
            body: Container(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "lib/assets/unnamed.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (model.userTickets.length != null)
                                ? model.userTickets.length
                                : 0,
                            itemBuilder: (context, index) {
                              return model.userTickets[index];
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (_width) / (1.2 * _height),
                              crossAxisCount: (model.vipLounge.columns != null)
                                  ? model.vipLounge.columns
                                  : 0,
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x4D85BE01),
                                  spreadRadius: 0,
                                  blurRadius: 34,
                                  offset: Offset(0, 10),
                                )
                              ],
                              border: Border.all(color: secondary, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 60,
                            child: Center(
                              child: Text(
                                "PITCH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

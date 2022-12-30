import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_cup_system_frontend_web/common/components/seat-component.dart';
import 'package:world_cup_system_frontend_web/common/constants.dart';

class VipComponent extends StatelessWidget {
  const VipComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/unnamed.jpeg",
            fit: BoxFit.cover,
          ),
          Container(
            height: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                GridView.count(
                  addRepaintBoundaries: false,
                  addAutomaticKeepAlives: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 10,
                  children: [
                    SeatsComponent(index: 0),
                    SeatsComponent(index: 1),
                    SeatsComponent(index: 2),
                    SeatsComponent(index: 3),
                    SeatsComponent(index: 9),
                    SeatsComponent(index: 10, status: "vilable"),
                    SeatsComponent(index: 11),
                    SeatsComponent(index: 12, status: "vilable"),
                    SeatsComponent(index: 13),
                    SeatsComponent(index: 14),
                    SeatsComponent(index: 15, status: "vilable"),
                    SeatsComponent(index: 16),
                    SeatsComponent(index: 17),
                    SeatsComponent(index: 12),
                    SeatsComponent(index: 13),
                    SeatsComponent(index: 14, status: "vilable"),
                    SeatsComponent(index: 15),
                    SeatsComponent(index: 16, status: "vilable"),
                    SeatsComponent(index: 17, status: "vilable"),
                    SeatsComponent(index: 17, status: "vilable"),
                  ],
                ),
                Container(
                  height: 20,
                ),
                GridView.count(
                  addRepaintBoundaries: false,
                  addAutomaticKeepAlives: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 10,
                  children: [
                    SeatsComponent(index: 0),
                    SeatsComponent(index: 1),
                    SeatsComponent(index: 2),
                    SeatsComponent(index: 3),
                    SeatsComponent(index: 9),
                    SeatsComponent(index: 10),
                    SeatsComponent(index: 10, status: "vilable"),
                    SeatsComponent(index: 11),
                    SeatsComponent(index: 12, status: "vilable"),
                    SeatsComponent(index: 13),
                    SeatsComponent(index: 14),
                    SeatsComponent(index: 15, status: "vilable"),
                    SeatsComponent(index: 16),
                    SeatsComponent(index: 17),
                    SeatsComponent(index: 12),
                    SeatsComponent(index: 13),
                    SeatsComponent(index: 14, status: "vilable"),
                    SeatsComponent(index: 15),
                    SeatsComponent(index: 16, status: "vilable"),
                    SeatsComponent(index: 17, status: "vilable"),
                  ],
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
        ],
      ),
    );
  }
}

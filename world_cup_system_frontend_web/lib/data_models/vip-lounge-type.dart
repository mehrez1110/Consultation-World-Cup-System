import 'package:flutter/material.dart';
import 'package:world_cup_system_frontend_web/data_models/stadium.dart';
import 'package:world_cup_system_frontend_web/models/stadium-model.dart';

class VipLounge {
  final id;
  final rows;
  final columns;
  Stadium stadium;

  VipLounge({this.id, this.rows, this.columns, required this.stadium});

  static fromJson(responseItem) {
    return VipLounge(
        id: responseItem['id'],
        rows: responseItem['vipRows'],
        columns: responseItem['vipColumns'],
        stadium: Stadium.fromJson(responseItem["stadium"]));
  }
}

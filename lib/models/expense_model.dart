import 'package:flutter/material.dart';

class ExpenseModel {

  String title;
  DateTime dateTime;
  String value;

  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'dateTime': dateTime,
      'value': value,
    };
  }

  ExpenseModel({
    @required this.title,
    @required this.dateTime,
    @required this.value,
  });

}
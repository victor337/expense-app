import 'package:expense_app/controllers/base_controller.dart';
import 'package:expense_app/views/expenses/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (baseController){
        if(baseController.index == 0){
          return ExpensesScreen();
        } else{
          return Container();
        }
      },
    );
  }
}
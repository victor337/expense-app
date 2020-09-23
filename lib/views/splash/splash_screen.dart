import 'package:expense_app/controllers/data/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      init: DataController(),
      builder: (dataController){
        return Scaffold(
          body: Center(
            child: Card(
              child: Column(
                children: const [
                  Text(
                    'Minhas despesas'
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'package:get/get.dart';


class AddExpenseController extends GetxController {

  String title;
  void settitle(String settitle){
    title = settitle;
    update();
  }

  String value;
  void setvalue(String setvalue){
    value = setvalue;
    update();
  }

}
import 'package:expense_app/models/expense_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {

  List<ExpenseModel> expenses = [];

  void addExpense(ExpenseModel expenseModel){
    expenses.add(expenseModel);
    update();
  }

  void deleteExpense(int index){
    expenses.removeAt(index);
    update();
  }


  @override
  void onInit() {
    Future.delayed(
      const Duration(
        seconds: 2
      )
    ).then((value) => Get.offAllNamed('/base'));
    super.onInit();
  }
}
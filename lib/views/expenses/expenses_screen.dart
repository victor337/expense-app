import 'package:expense_app/controllers/data/data_controller.dart';
import 'package:expense_app/views/expenses/components/add_expense_screen.dart';
import 'package:expense_app/views/expenses/components/expense_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white,),
            itemBuilder: (ctx) => <PopupMenuEntry> [
              const PopupMenuItem(
                value: 0,
                child: Text('Adicionar despesa'),
              ),
            ],
            onSelected: (index){
              if(index == 0){
                Get.bottomSheet(
                  AddExpense()
                );
              }
            },
          ),
        ],
      ),
      body: GetBuilder<DataController>(
        builder: (dataController){
          if(dataController.expenses.isEmpty){
            return Center(
              child: Card(
                elevation: 8,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Ainda não há despesas adicionadas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                      Icon(
                        Icons.history,
                        size: 35,
                        color: Colors.white
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              itemCount: dataController.expenses.length,
              itemBuilder: (_, index){
                return ExpenseWidget(
                  expenseModel: dataController.expenses[index],
                  onDelete: (side){
                    dataController.deleteExpense(index);
                  }
                );
              },
            );
          }         
        },
      ),
    );
  }
}
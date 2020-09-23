import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseWidget extends StatelessWidget {
  
  final ExpenseModel expenseModel;
  final Function(DismissDirection) onDelete;
  
  const ExpenseWidget({
    @required this.expenseModel,
    @required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Stack(
        children: [
          Container(color: Colors.red,),
          const Center(
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      onDismissed: onDelete,
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child: ListTile(
        title: Text(expenseModel.title),
        subtitle: Text(expenseModel.dateTime.toString()),
        trailing: Text(expenseModel.value),
      ),
    );
  }
}
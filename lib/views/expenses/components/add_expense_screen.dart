import 'package:brasil_fields/brasil_fields.dart';
import 'package:expense_app/controllers/data/data_controller.dart';
import 'package:expense_app/controllers/expenses/add_expense.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/views/expenses/components/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class AddExpense extends StatelessWidget {

  final FocusNode expense = FocusNode();
  final FocusNode value = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController){
        return BottomSheet(
          onClosing: (){},
          builder: (_){
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: GetBuilder<AddExpenseController>(
                init: AddExpenseController(),
                builder: (addControll){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              title: 'Despesa',
                              hintText: 'Ex: Chocolate',
                              initialValue: addControll.title,
                              focusNode: expense,
                              textInputAction: TextInputAction.next,
                              keyBoardType: TextInputType.text,
                              icon: Icons.title,
                              onChanged: addControll.settitle,
                              onSubmitted: (text){
                                expense.unfocus();
                                FocusScope.of(context).requestFocus(value);
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomFormField(
                              title: 'Valor',
                              hintText: 'Ex: 29,99',
                              initialValue: addControll.value,
                              focusNode: value,
                              textInputAction: TextInputAction.done,
                              keyBoardType: TextInputType.number,
                              formatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                RealInputFormatter(
                                  centavos: true
                                ),
                              ],
                              icon: Icons.attach_money,
                              onChanged: addControll.setvalue,
                              onSubmitted: (text){
                                value.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () => Get.back(),
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                          const SizedBox(width: 25,),
                          RaisedButton(
                            color: const Color.fromARGB(255, 20, 20, 20),
                            onPressed: (){

                              final ExpenseModel expenseModel = ExpenseModel(
                                title: addControll.title,
                                dateTime: DateTime.now(),
                                value: addControll.value
                              );

                              dataController.addExpense(expenseModel);

                              addControll.settitle(null);
                              addControll.setvalue(null);
                            },
                            child: const Text(
                              'Adicionar',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            );
          }
        );
      },
    );
  }
}
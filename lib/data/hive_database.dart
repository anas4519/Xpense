import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveDataBase{
  //reference box
  final _myBox = Hive.box("expense_database2");

  //write data
  void saveData(List<ExpenseItem> allExpense){
    /*
    
    Hive can store only strings and dateTime, and not custom objects
    covert expense item objects to types that can be stored
    allExpense = [
      ExpenseItem(name/amount/dateTime)
    ]

    -->
    [
      [name,amount,dateTime],
    ]
    */
    List<List<dynamic>> allExpensesFormatted = [];
    for(var expense in allExpense){
      //convert each expenseItem into a list of storable types
      List<dynamic> expenseFormatted = [
        expense.name, expense.amount, expense.dateTime
      ];
      allExpensesFormatted.add(expenseFormatted);
    }

    //fianlly store in our database
    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  //read data
  List<ExpenseItem> readData(){
    /*
    Data stored in hive needs to be converted to ExpenseItem objects
    */
    List savedExpenses = _myBox.get("ALL_EXPENSES")??[];
    List<ExpenseItem> allExpense = [];
    for(int i = 0; i<savedExpenses.length; i++){
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      //create expense item
      ExpenseItem expense = ExpenseItem(amount: amount, dateTime: dateTime, name: name);
      allExpense.add(expense);
    }
    return allExpense;
  }

}

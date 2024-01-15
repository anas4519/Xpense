import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  //initialize hive
  await Hive.initFlutter();
  //open a hive box
  await Hive.openBox("expense_database2");


  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ExpenseData(),
      builder: (context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,        
        home: HomePage(),
        theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(),
          
        ),
      ),
      
      );
  }
}

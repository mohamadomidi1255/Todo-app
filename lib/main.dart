import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo_list_model.dart';
import 'package:todo_app/view/home/home_screen.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListModelAdapter());
  await Hive.openBox("Todo_List");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: Locale("fa"),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

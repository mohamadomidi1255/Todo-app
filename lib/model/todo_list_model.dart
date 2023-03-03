import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_list_model.g.dart';

@HiveType(typeId: 0)
class TodoListModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? text;

  TodoListModel({this.text, this.title});
}

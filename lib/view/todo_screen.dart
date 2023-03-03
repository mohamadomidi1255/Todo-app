import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constant/my_colors.dart';
import 'package:todo_app/model/todo_list_model.dart';
import 'package:todo_app/view/home/home_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var titleController = TextEditingController();
  var textController = TextEditingController();

  void saveData() async {
    log("saveData ");
    var box = await Hive.openBox("Todo_List");
    // Box<TodoListModel> box = Hive.box("Todo_List");
    box.add(
        TodoListModel(text: textController.text, title: titleController.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appbarcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    saveData();
                    navigator!.pop(HomeScreen());
                  });
                },
                child: const SizedBox(
                    width: 80,
                    height: 60,
                    child: Center(child: Text("دخیره")))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255))),
                    hintText: "عنوان",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)))),
              ),
            ),
            TextField(
              controller: textController,
              maxLines: 30,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  hintText: "شروع به تایپ کردن کنید",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)))),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constant/my_colors.dart';
import 'package:todo_app/model/todo_list_model.dart';
import 'package:todo_app/view/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.appbarcolor,
          title: Row(
            children: const [
              Text(
                "یاداشت ها",
                style: TextStyle(
                  fontSize: 23,
                ),
              )
            ],
          ),
        ),
        body: SizedBox(
          height: Get.height,
          child: listview(),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.flobuttoncolor,
          onPressed: (() {
            Get.to(const TodoScreen());
          }),
          child: const Icon(Icons.add),
        ));
  }

  Widget listview() {
    var box = Hive.box("Todo_List");
    return ListView.builder(
      itemCount: box.values.length,
      itemBuilder: (context, index) {
        TodoListModel? res = box.getAt(index);
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Dismissible(
            background: Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: Get.width / 1.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.delete,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            key: UniqueKey(),
            onDismissed: (direction) {
              box.deleteAt(index);
            },
            child: Center(
              child: Container(
                // height: Get.height / 6,
                width: Get.width / 1.04,
                decoration: BoxDecoration(
                    color: MyColors.listcolor,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            res!.title.toString(),
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ExpandableText(
                        expandText: "بیشتر",
                        collapseText: "کمتر",
                        maxLines: 2,
                        res.text.toString(),
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

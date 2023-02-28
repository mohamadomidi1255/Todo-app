import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:todo_app/constant/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 12,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                // height: Get.height / 6,
                width: Get.width / 1.03,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "mohammad",
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ExpandableText(
                        expandText: "sho",
                        collapseText: "uu",
                        maxLines: 2,
                        "روی پیوند نمایش بیشتر در پایان یا خود متن، آن را گسترش داد. پس از گسترش متن، نمی توان آن را دوباره جمع کردروی پیوند نمایش بیشتر در پایان یا خود متن، آن را گسترش داد. پس از گسترش متن، نمی توان آن را دوباره جمع کردروی پیوند نمایش بیشتر در پایان یا خود متن، آن را گسترش داد. پس از گسترش متن، نمی توان آن را دوباره جمع کرد",
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.bgflobuttoncolor,
          onPressed: (() {}),
          child: Icon(Icons.add),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:kun_rejasi/database/database_helper.dart';
import 'package:kun_rejasi/main_provider.dart';
import 'package:kun_rejasi/model/card_modul.dart';
import 'package:kun_rejasi/model/task.dart';
import 'package:provider/provider.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key});

  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Consumer<MainProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            SizedBox(
                height: size.height * 0.3,
                child: FutureBuilder(
                  future: DatabaseHelper.intancee.getTask(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Task>> snapshot) {
                    return snapshot.hasData
                        ? PageView.builder(
                            itemCount: snapshot.data?.length,
                            onPageChanged: (value) {
                              setState(() {
                                selectedIndex = value;
                              });
                            },
                            itemBuilder: (context, index) {
                              return myBody(snapshot.data![index]);
                            })
                        : ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                  },
                )),
            SizedBox(
              height: 26,
              child: FutureBuilder(
                future: DatabaseHelper.intancee.getTask(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          padding: EdgeInsets.only(left: size.height * 0.17),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return myBody2(index);
                          })
                      : ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget myBody2(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: index == selectedIndex
                ? const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                        Color(0xff9C2CF3),
                        Color(0xff3A49F9),
                      ])
                : const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                        Colors.grey,
                        Colors.grey,
                        Colors.grey,
                      ]),
            borderRadius: BorderRadius.circular(20)),
        width: index == selectedIndex ? 40 : 10,
      ),
    );
  }

  Widget myBody(Task task) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/bg.png"),
                alignment: Alignment.topRight),
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff9C2CF3),
                  Color(0xff3A49F9),
                ]),
            borderRadius: BorderRadius.circular(20)),
        width: size.height * 0.2,
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    width: size.height * 0.05,
                    height: size.height * 0.05,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    task.title!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Expanded(
                child: Text(
                  task.description!,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                task.yearAndMonth!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

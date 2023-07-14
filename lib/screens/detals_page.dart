import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kun_rejasi/model/task.dart';

class DetailsPage extends StatelessWidget {
  final Task task;

  const DetailsPage(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("More info task",
            style: TextStyle(color: Colors.deepPurpleAccent)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              alignment: Alignment.centerRight),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff9C2CF3),
                Color(0xff3A49F9),
              ]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height*0.5,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cardTime(context, "Create Time", task.time!),
                        cardTime(context, "Create Date", task.yearAndMonth!,
                            iconData: Icons.date_range),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cardTime(context, "Start Time", task.startTime!,
                            iconData: Icons.run_circle),
                        cardTime(context, "End Time", task.endTime!,
                            iconData: Icons.task_alt),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:size.height*0.3,
                  child: SingleChildScrollView(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Task name: ${task.title}\n",style: const TextStyle(color: Colors.white,fontSize: 24)),
                        Text("Task Description :\n${task.description}",style: const TextStyle(color: Colors.white,fontSize: 20)),
                      ],
                    ),
                  )))
            ],
          ),
        ),
      ),
    );
  }

  Widget cardTime(context, text, String task,
      {IconData iconData = Icons.watch_later_outlined}) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Container(
      width: size.height * 0.2,
      height: size.height * 0.2,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              alignment: Alignment.topRight),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff9C2CF3),
                Color(0xff3A49F9),
              ]),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                  size: size.height * 0.08,
                ),
                Text(
                  task,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

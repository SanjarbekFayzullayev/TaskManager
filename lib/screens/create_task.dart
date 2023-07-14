import 'package:flutter/material.dart';
import 'package:kun_rejasi/database/database_helper.dart';
import 'package:kun_rejasi/main_provider.dart';
import 'package:kun_rejasi/model/task.dart';
import 'package:kun_rejasi/widgets/catigores.dart';
import 'package:provider/provider.dart';

class CreateTask extends StatefulWidget {
  Task? createTask;

  CreateTask({this.createTask, Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late TimeOfDay time;
  late TimeOfDay time2;
  late TimeOfDay picket;
  late TimeOfDay picket2;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String h = "";
  String m = "";

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
    time2 = TimeOfDay.now();

    if (widget.createTask != null) {
      _nameController.text = widget.createTask?.title ?? "No Create a Task";
      _descriptionController.text =
          widget.createTask?.description ?? "No Create a Description";
    }
  }

  //selected time
  Future<void> selectTime(BuildContext context) async {
    picket = (await showTimePicker(context: context, initialTime: time))!;
    if (picket != null) {
      setState(() {
        time = picket;
      });
    }
  }

  Future<void> selectTime2(BuildContext context) async {
    picket2 = (await showTimePicker(context: context, initialTime: time2))!;
    if (picket2 != null) {
      setState(() {
        time2 = picket2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color(0xff3A49F9),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                    begin: FractionalOffset(1.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.03, right: size.height * 0.03),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: size.height * 0.05,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.createTask == null
                                  ? "Create a Tack"
                                  : "Update a Task",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.03),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          size: size.height * 0.05,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _nameController,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.03),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Name",
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 3),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 3),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            DateTime.now().hour > 9
                                ? Text(
                                    h = DateTime.now().hour.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 3),
                                  )
                                : Text(
                                    h = "0${DateTime.now().hour.toString()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 3),
                                  ),
                            DateTime.now().minute > 9
                                ? Text(
                                    m = ":${DateTime.now().minute.toString()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 3),
                                  )
                                : Text(
                                    m = ":0${DateTime.now().minute.toString()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 3),
                                  ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.03, right: size.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Time(context),
                    const Divider(
                      thickness: 1,
                      color: Color(0xffBFC8E8),
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(color: Color(0xffBFC8E8), fontSize: 20),
                    ),
                    TextField(
                      maxLines: 5,
                      controller: _descriptionController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.03,
                          decorationColor: Colors.black),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBFC8E8),
                          ),
                        ),
                        hintMaxLines: 5,
                        hintText: "Lorem ipsum dolor sit amet, "
                            "er disciplining elite, sed diathermy "
                            "nib modernism dolor sit amet, er disciplining elite, "
                            "sed diathermy nib modernism.",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 3),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(color: Color(0xffBFC8E8), fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Catigoriy(),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          widget.createTask == null
                              ? createTask()
                              : updateTask();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xff9C2CF3),
                                  Color(0xff3A49F9),
                                ]),
                          ),
                          child: Text(
                            widget.createTask == null
                                ? "Create Tack"
                                : "Update Task",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget Time(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  selectTime(context);
                },
                child: Text(
                  "   Start Time",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: const Color(0xffBFC8E8),
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: size.height * 0.07,
            ),
            InkWell(
              onTap: () {
                selectTime2(context);
              },
              child: Text("End Time",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: const Color(0xffBFC8E8),
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.height * 0.03,
            ),
            InkWell(
              onTap: () => selectTime(context),
              child: Text(
                "${time.hour}:${(time.minute < 10) ? '0${time.minute}' : '${time.minute}'}",
                style: TextStyle(
                    fontSize: size.height * 0.04,
                    color: const Color(0xff2E3A59)),
              ),
            ),
            SizedBox(
              width: size.height * 0.09,
            ),
            InkWell(
              onTap: () => selectTime2(context),
              child: Text(
                "${time2.hour}:${(time2.minute < 10) ? '0${time2.minute}' : '${time2.minute}'} ",
                style: TextStyle(
                    fontSize: size.height * 0.04,
                    color: const Color(0xff2E3A59)),
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }

  void createTask() async {
    Task newTask = Task(
        _nameController.text,
        _descriptionController.text,
        h + m,
        picket.hour > 9
            ? "${picket.hour.toString()}:${picket.minute.toString()}"
            : "0${picket.hour.toString()}:0${picket.minute.toString()}",
        picket.hour > 9
            ? "${picket.hour.toString()}:${picket.minute.toString()}"
            : "0${picket.hour.toString()}:0${picket.minute.toString()}",
        "${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()}");
    var res = await DatabaseHelper.intancee.insert(newTask);
    print("ISLADI: $res");
    Navigator.pop(context);
  }

  void updateTask() async {
    Task currentTask = Task.withId(
        widget.createTask?.id,
        _nameController.text,
        _descriptionController.text,
        "${h + m} Edit",
        picket.hour > 9
            ? "${picket.hour.toString()}:${picket.minute.toString()}"
            : "0${picket.hour.toString()}:0${picket.minute.toString()}",
        picket.hour > 9
            ? "${picket.hour.toString()}:${picket.minute.toString()}"
            : "0${picket.hour.toString()}:0${picket.minute.toString()}",
        "${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()} Edit");

    var res = await DatabaseHelper.intancee.update(currentTask);
    print("Update Bo'ldi: $res");
    Navigator.pop(context);
  }
}

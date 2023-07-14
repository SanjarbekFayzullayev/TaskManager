import 'package:flutter/material.dart';
import 'package:kun_rejasi/screens/bottom_navigator_bar.dart';
import 'package:kun_rejasi/screens/create_task.dart';
import 'package:kun_rejasi/widgets/addTaskButton.dart';
import 'package:kun_rejasi/widgets/scrool_menyu.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FF),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              backgroundColor: Colors.white,
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size.height * 0.5),
                        bottomRight: Radius.circular(size.height * 0.5),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.01,
                        vertical: size.height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                              style: TextStyle(
                                  fontSize: size.height * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                            const AddTaskButton(),

                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 20,
                          child: SfDateRangePicker(
                            headerHeight: 0,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 0.0,
                child: Center(
                  child: Text(' '),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.03,
                          vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tasks",
                            style: TextStyle(
                                fontSize: size.height * 0.04,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E3A59)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: const ScrollMenu())
                        ],
                      ));
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// Column(
// children: [
// Container(
// width: double.infinity,
// height: 100,
// color: Colors.white,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// "Oct,2020",
// style: TextStyle(
// color: Color(0xff2E3A59),
// fontWeight: FontWeight.bold,
// fontSize: 28),
// ),
// Container(
// alignment: Alignment.center,
// width: 90,
// height: 40,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// gradient: const LinearGradient(
// begin: Alignment.bottomCenter,
// end: Alignment.topCenter,
// colors: [
// Color(0xff9C2CF3),
// Color(0xff3A49F9),
// ]),
// ),
// child:  InkWell(
// onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTask(),)),
// child: const Text("+ Add Tack",
// style: TextStyle(color: Colors.white)),
// ),
// )
// ],
// ),
// ),
// ),
// Container(
// alignment: Alignment.topLeft,
// child: const Padding(
// padding: EdgeInsets.all(16),
// child: Text("Tasks",
// style: TextStyle(
// color: Color(0xff2E3A59),
// fontSize: 20,
// fontWeight: FontWeight.bold),
// textAlign: TextAlign.center),
// )),
// const Expanded(
// child: Padding(
// padding: EdgeInsets.only(right: 8.0, left: 8),
// child: ScrollMenu(),
// ),
// )
// ],
// )

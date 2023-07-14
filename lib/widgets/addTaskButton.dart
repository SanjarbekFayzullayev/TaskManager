import 'package:flutter/material.dart';
import 'package:kun_rejasi/main_provider.dart';
import 'package:kun_rejasi/screens/create_task.dart';
import 'package:provider/provider.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => CreateTaskPage(),
        // )).then((value) => updateTaskList(context));
      },
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFF9C2CF3),
              Color(0xFF3A49F9),
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  CreateTask(),
                      )).then((value) => updateList(context));
                },
                child: const Text(
                  "+ Add Task",
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    );
  }
  void updateList(context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.updateList();
  }
}

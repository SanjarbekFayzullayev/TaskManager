import 'package:flutter/material.dart';
import 'package:kun_rejasi/database/database_helper.dart';
import 'package:kun_rejasi/main_provider.dart';
import 'package:kun_rejasi/model/task.dart';
import 'package:kun_rejasi/screens/create_task.dart';
import 'package:kun_rejasi/screens/detals_page.dart';
import 'package:provider/provider.dart';

class ScrollMenu extends StatelessWidget {
  const ScrollMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: DatabaseHelper.intancee.getTask(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return myBody(snapshot.data![index], context);
                    })
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
          },
        );
      },
    );
  }
}

void updateList(context) async {
  final mainProvider = Provider.of<MainProvider>(context, listen: false);
  mainProvider.updateList();
}


Widget myBody(Task task, BuildContext context) {

  return Column(
    children: [
      const SizedBox(
        height: 12,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: ListTile(
          title: Text(
            task.title ?? "No Create title",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(task.time ?? "No Create time"),
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: const Text('Edit'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: const Text('Delete'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  value: 'more',
                  child: const Text('More'),
                  onTap: () {},
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'edit') {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => CreateTask(createTask: task),
                ))
                    .then((value) {
                  updateList(context);
                });
              } else if (value == "delete") {
                _alderDialog(context,task);
              }else if(value=="more"){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(task),
                    ));
              }
            },
          ),
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage(task)));
            },
            child: Container(
              height: 61.0,
              width: 61.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF9C2CF3),
                      Color(0xFF3A49F9),
                    ],
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Image.asset(
                  'assets/todolist.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );


}
void _alderDialog(context,task) async {
  await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "This task delete really?",
          style:  TextStyle(fontSize: 20, color: Colors.deepPurple),
        ),
        actions: [
          ElevatedButton(
              style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
              onPressed: ()  {

                deletedTask(context, task);

              },
              child: const Text("Yes")),
          ElevatedButton(
              style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).pop(false);
              },
              child:const Text("No")),
        ],
      ));


}
void deletedTask(context,task)async{
  DatabaseHelper.intancee.delete(task.id!);
  updateList(context);
  Navigator.pop(context);
}
// MiniMenu(
// const Icon(Icons.account_circle_rounded),
// const Text(
// "Desgin Chendes",
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// ),
// const Text(
// "2 Days ago",
// style: TextStyle(fontSize: 12, color: Colors.grey),
// )),

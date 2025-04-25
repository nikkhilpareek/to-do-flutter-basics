import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List ToDoList = [
    ['Learn Web Development', false],
    ['Learn Flutter Development', true],
    ['Do Leetcode POTD', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,

      appBar: AppBar(
        title: Text('ToDo App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoList(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add New ToDo Item',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

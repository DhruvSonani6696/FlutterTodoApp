import 'package:fluttertodoapp/controlllers/todo_controller.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      initState: (_) {},
      builder: (todoController) {
        todoController.getData();
        return Scaffold(
            body: Center(
              child: todoController.isLoading
                  ? const SizedBox(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: todoController.taskList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Checkbox(
                              onChanged: (value) => todoController.addTodo(
                                  todoController.taskList[index].task,
                                  !todoController.taskList[index].isDone,
                                  todoController.taskList[index].id),
                              value: todoController.taskList[index].isDone),
                          title: Text(todoController.taskList[index].task),
                          trailing: SizedBox(
                            width: 80,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => addTaskDialog(
                                      todoController,
                                      'Update Task',
                                      todoController.taskList[index].id,
                                      todoController.taskList[index].task),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () => todoController.deleteTask(
                                      todoController.taskList[index].id),
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async =>
                  await addTaskDialog(todoController, 'Add ToDo', '', ''),
            ));
      },
    );
  }

  Future<dynamic> addTaskDialog(
      TodoController todoController, String title, String id, String task) {
    if (task.isNotEmpty) {
      _taskController.text = task;
    }

    return Get.defaultDialog(
      title: title,
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _taskController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'field can not be empty or null';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await todoController.addTodo(
                    _taskController.text.trim(), false, id);

                _taskController.clear();
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

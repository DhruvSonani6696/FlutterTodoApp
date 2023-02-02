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
    final todoController = Get.find<TodoController>();

    return Scaffold(
        body: const Center(
          child: Text('Home Screen'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Get.defaultDialog(
            title: 'Add your todo',
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _taskController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field can not be empty';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async => await todoController.addTodo(
                        _taskController.text.trim(), false),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

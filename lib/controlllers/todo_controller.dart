import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertodoapp/screens/intro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:fluttertodoapp/models/task_model.dart';

class TodoController extends GetxController {
  var isLoading = false;
  var taskList = <TaskModel>[];
  Future<void> addTodo(String task, bool done, String id) async {
//    print('todo');
    await FirebaseFirestore.instance
        .collection('fluttertodoappDhruv')
        .doc(id != '' ? id : null)
        .set(
      {
        'task': task,
        'isDone': done,
      },
      SetOptions(merge: true),
    ).then(
      (value) => Get.back(),
    );
  }

  Future<void> getData() async {
    try {
      QuerySnapshot _taskSnap = await FirebaseFirestore.instance
          .collection('fluttertodoappDhruv')
          .orderBy('task')
          .get();
      taskList.clear();
      for (var item in _taskSnap.docs) {
        taskList.add(TaskModel(item.id, item['task'], item['isDone']));
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance
        .collection('fluttertodoappDhruv')
        .doc(id)
        .delete();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertodoapp/screens/intro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TodoController extends GetxController {
  Future<void> addTodo(String task, bool done) async {
//    print('todo');
    await FirebaseFirestore.instance
        .collection('fluttertodoappDhruv')
        .doc()
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
}

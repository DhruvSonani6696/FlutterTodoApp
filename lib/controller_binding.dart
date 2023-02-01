import 'package:fluttertodoapp/controlllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertodoapp/screens/intro.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TodoController>(TodoController());
    // TODO: implement dependencies
  }
}

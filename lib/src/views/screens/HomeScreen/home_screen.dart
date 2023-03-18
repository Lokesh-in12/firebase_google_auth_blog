import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_google_auth/src/controllers/blogs_controller/blogs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  DataBaseController dbController = Get.put(DataBaseController());

  @override
  Widget build(BuildContext context) {
    print("currentUser=>>  ${auth.currentUser}");
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Center(child: Text("HomeScreen")),
                Text(auth.currentUser!.email.toString()),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      hintText: "Title",
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 237, 237)),
                ),
                TextField(
                  controller: _descController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 237, 237)),
                ),
                TextButton(
                    onPressed: () => dbController.saveToDb(
                        _titleController.text.trim(),
                        _descController.text.trim()),
                    child: Text("Save to db")),
                Expanded(
                    child: StreamBuilder(
                      stream: ,
                    ),
                )
              ],
            ),
          ),
        ));
  }
}

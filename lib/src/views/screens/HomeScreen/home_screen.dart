import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  void saveToDb(String title, String desc) async {
    await dbRef.child("blogs").set({"title": title, "desc": desc});
  }

  @override
  Widget build(BuildContext context) {
    print("currentUser=>>  ${auth.currentUser}");
    return Scaffold(
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
                  filled: true, fillColor: Color.fromARGB(255, 238, 237, 237)),
            ),
            TextButton(
                onPressed: () => saveToDb(
                    _titleController.text.trim(), _descController.text.trim()),
                child: Text("Save to db"))
          ],
        ),
      ),
    );
  }
}

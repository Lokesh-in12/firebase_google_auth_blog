import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController {
  dynamic blogs = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataFromDb();
  }

  static final dbRef = FirebaseDatabase.instance.ref();

  void saveToDb(String title, String desc) async {
    await dbRef.child("blogs").push().set({"title": title, "desc": desc});
  }

  Future<DataSnapshot> getDataFromDb() async {
    DataSnapshot data = await dbRef.child("blogs").get();
    print("data is => ${data.value}");
    blogs.value = [data.value];
    return data;
  }
}

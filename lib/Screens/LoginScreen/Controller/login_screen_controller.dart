import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class LoginScreenController extends GetxController {
  final userId = "null".obs;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late final CollectionReference mainCollection;
  late final DocumentReference documentReferencer;
  @override
  void onInit() {
    mainCollection = fireStore.collection('users');
    // DocumentReference documentReferencer = mainCollection.doc(userId.value).collection('users').doc();
    super.onInit();
  }

  Future<void> addItem({required Map<String, dynamic> data}) async {
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kw_versions/model/user_model.dart';

class UserRepository {
  final firestore = FirebaseFirestore.instance.collection("cust");

  Stream<List<User>> streamUsers() =>
      firestore.snapshots().map((event) => event.docs
          .map(
            (e) => User.fromJson(e.data(), e.reference.id),
          )
          .toList());

  Future<void> deleteUser(String id) async {
    await firestore
        .doc(id)
        .delete()
        .catchError((error) => throw "Failed to delete todo");
  }

  Future<void> addUser(User user, String docId) async {
    await firestore
        .doc(docId)
        .set(user.toJson())
        .catchError((event) => throw "Can't add new todo due to error");
  }
}

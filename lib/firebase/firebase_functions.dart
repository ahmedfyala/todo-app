import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/model/user_model.dart';

class FirebaseFunctions {
  BuildContext? context;
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJson(),
        );
  }

  static void addTask(TaskModel taskModel) {
    var collection = getTaskCollection();

    var docRef = collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    CollectionReference<TaskModel> collection = getTaskCollection();

    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return getTaskCollection().doc(model.id).update(model.toJson());
  }

  static createAccountSignUp(
    String email,
    String password, {
    required String userName,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: email,
        userName: userName,
        age: '',
        phone: '',
      );
      addUser(userModel);
      onSuccess();

      var val = credential.user?.emailVerified ?? true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
      print(e);
    }
  }

  static loginUser(
    String email,
    String password, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      onSuccess(credential.user?.displayName ?? "");
      print(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      onError(e.toString());
    } catch (e) {
      onError(e.toString());
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.toJson(),
        );
  }

  static Future<void> addUser(UserModel userModel) {
    CollectionReference<UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDoc = userCollection.doc();

    userModel.id = userDoc.id;

    return userDoc.set(userModel);
  }
}

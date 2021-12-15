import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'register_form_controller.g.dart';

class RegisterFormController = _RegisterFormControllerBase
    with _$RegisterFormController;

abstract class _RegisterFormControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  bool gender = true;

  @observable
  DateTime? birthDate;

  @action
  void setBirthDate(DateTime newBirthDate) {
    birthDate = newBirthDate;
  }

  @action
  void setGender() {
    gender = !gender;
  }

  @action
  Future<bool> saveRegister(Map<String, dynamic> data, bool photo) async {
    loading = true;

    try {
      if (photo) {
        FirebaseStorage storageReference = FirebaseStorage.instance;
        Reference ref = storageReference
            .ref()
            .child('users')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child(data['perfilPhoto']);
        await ref.putFile(File(data['perfilPhoto'])).whenComplete(() async {
          print('Upload completed');

          await ref.getDownloadURL().then((value) {
            print(value);
            data['perfilPhoto'] = value;
          });
        });
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(data)
          .then(
        (value) {
          return true;
        },
      );
    } catch (e) {
      error = Exception('Erro ao salvar usuario');
      return false;
    } finally {
      loading = false;
    }

    return true;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  UserModel? user;

  @action
  Future<void> loadCurrentUser() async {
    loading = true;

    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      var response = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      final data = jsonEncode(response.data());

      user = UserModel.fromJson(data);
    } catch (e) {
      error = Exception('Erro ao carregar usuario!');
    } finally {
      loading = false;
    }
  }

  @action
  Future<bool> changePhoto(String imagePath) async {
    loading = true;

    try {
      String urlUpload = '';
      FirebaseStorage storageReference = FirebaseStorage.instance;
      Reference ref = storageReference
          .ref()
          .child('users')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(imagePath);
      await ref.putFile(File(imagePath)).whenComplete(() async {
        print('Upload completed');

        await ref.getDownloadURL().then((value) {
          print(value);
          urlUpload = value;
        });
      });

      user!.perfilPhoto = urlUpload;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update(user!.toMap())
          .then(
        (value) {
          return true;
        },
      );
    } catch (e) {
      error = Exception('Erro ao carregar a imagem!');
    } finally {
      loading = false;
    }
    return false;
  }
}

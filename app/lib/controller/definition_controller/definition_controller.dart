import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'definition_controller.g.dart';

class DefinitionController = _DefinitionControllerBase
    with _$DefinitionController;

abstract class _DefinitionControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  RegisterFormModel? userData;

  @observable
  bool indentification = true;

  @action
  void setIndentification() {
    indentification = !indentification;
  }

  @action
  void setUser(RegisterFormModel? user) {
    userData = user;
  }

  @action
  Future<bool> saveFirebase(Map<String, dynamic> model) async {
    loading = true;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(model);
      return true;
    } catch (e) {
      error = Exception('Erro ao carregar os dados');
      return false;
    } finally {
      loading = false;
    }
  }

  Future<void> loadData() async {
    loading = true;

    try {
      final response = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final data = jsonEncode(response.data());

      userData = RegisterFormModel.fromJson(data);
    } catch (e) {
      error = Exception('Erro ao carregar os dados');
    } finally {
      loading = false;
    }
  }
}

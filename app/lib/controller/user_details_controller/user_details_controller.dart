import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'user_details_controller.g.dart';

class UserDetailsController = _UserDetailsControllerBase
    with _$UserDetailsController;

abstract class _UserDetailsControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  UserModel? user;

  @action
  Future<void> loadUser(String uid) async {
    loading = true;

    try {
      var response =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      final data = jsonEncode(response.data());

      user = UserModel.fromJson(data);
    } catch (e) {
      error = Exception('Erro ao carregar usuario!');
    } finally {
      loading = false;
    }
  }
}

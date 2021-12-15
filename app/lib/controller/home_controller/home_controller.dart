import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/models/user_model.dart';
import 'package:connect_proj/pages/tabs/connections_tab/connections_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  int selectedIndex = 0;

  @observable
  UserModel? user;

  @observable
  PageController pageController = PageController();

  @observable
  List<Widget> peoplesWidget = [];

  @observable
  List<UserModel> peoplesList = [];

  @observable
  List<UserModel> chatPeoples = [];

  @action
  setIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<void> loadCurrentUser(BuildContext context) async {
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
  Stream<QuerySnapshot> response() {
    return FirebaseFirestore.instance
        .collection('users')
        .where('definition', isEqualTo: user!.definition == 0 ? 1 : 0)
        .snapshots();
  }

  @action
  void setPeoples(List<QueryDocumentSnapshot<Object?>> docs) {
    peoplesList = [];
    peoplesWidget = [];
    chatPeoples = [];

    docs.forEach((doc) {
      peoplesList.add(UserModel.fromJson(jsonEncode(doc.data())));
    });

    if (user!.likes!.isNotEmpty) {
      user!.likes!.forEach((uidLike) {
        peoplesList.forEach((element) {
          element.likes!.forEach((uidLike) {
            if (uidLike == user!.uid) {
              chatPeoples.add(element);
            }
          });
        });
        peoplesList.removeWhere((element) => element.uid == uidLike);
      });

      peoplesList.forEach(
          (element) => peoplesWidget.add(ConnectionCard(user: element)));
    } else {
      peoplesList.forEach(
          (element) => peoplesWidget.add(ConnectionCard(user: element)));
    }
  }

  @action
  Future<void> onLike(String uid) async {
    try {
      final userUpdate = user;

      userUpdate!.likes!.add(uid);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update(userUpdate.toMap())
          .then((value) async {
        var response = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

        final data = jsonEncode(response.data());

        user = UserModel.fromJson(data);
      });

      peoplesList.removeAt(0);
      peoplesWidget.removeAt(0);
    } catch (e) {
      error = Exception('Erro ao carregar usuario!');
    }
  }

  @action
  void onDislike() {
    peoplesList.removeAt(0);
    peoplesWidget.removeAt(0);
  }
}

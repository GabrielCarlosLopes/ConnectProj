import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'edit_infos_controller.g.dart';

class EditInfosController = _EditInfosControllerBase with _$EditInfosController;

abstract class _EditInfosControllerBase with Store {
  @observable
  bool loading = false;

  @observable
  Exception? error;

  @observable
  RegisterFormModel? userEdited;

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
  void setUser(RegisterFormModel? registerModel) {
    userEdited = registerModel;

    nameController.text = userEdited!.name!;
    githubController.text = userEdited!.github!;
    linkedinController.text = userEdited!.linkedin!;
    descriptionController.text = userEdited!.description!;

    birthDate = DateFormat('d/MM/yyyy').parse(userEdited!.birthDate!);

    gender = userEdited!.gender!;
  }

  @action
  void setUserList(RegisterFormModel newUser) {
    userEdited = newUser;
  }

  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController githubController = TextEditingController();
  @observable
  TextEditingController linkedinController = TextEditingController();
  @observable
  TextEditingController descriptionController = TextEditingController();

  @action
  Future<void> updateData() async {
    loading = true;

    try {
      userEdited!.birthDate = DateFormat('dd/MM/y').format(birthDate!);
      userEdited!.description = descriptionController.text;
      userEdited!.linkedin = linkedinController.text;
      userEdited!.github = githubController.text;
      userEdited!.name = nameController.text;
      userEdited!.gender = gender;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEdited!.uid)
          .update(userEdited!.toMap());
    } catch (e) {
      error = Exception('Erro ao carregar a imagem!');
    } finally {
      loading = false;
    }
  }
}

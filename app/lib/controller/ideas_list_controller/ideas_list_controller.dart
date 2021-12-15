import 'package:connect_proj/models/idea_model.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'ideas_list_controller.g.dart';

class IdeasListController = _IdeasListControllerBase with _$IdeasListController;

abstract class _IdeasListControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  bool newIdea = false;

  @observable
  var idea;

  @observable
  int index = -1;

  @observable
  RegisterFormModel? user;

  void setUser(RegisterFormModel newUser) {
    user = newUser;
  }

  void setList(List<IdeaModel>? newListIdea) {
    ideaList = ObservableList<IdeaModel>.of(newListIdea!);
  }

  @action
  void setIndex(int newIndex) {
    index = newIndex;
  }

  @action
  void setIndexNull() {
    index = -1;
  }

  @action
  void setIdea(IdeaModel newIdea) {
    idea = newIdea;
  }

  @action
  void setIdeaNull() {
    idea = null;
  }

  @action
  void setNewIdea() {
    newIdea = !newIdea;
  }

  @action
  void disposeControllers() {
    githubIdeiaController.text = '';
    titleIdeaController.text = '';
    descriptionIdeaController.text = '';
  }

  @observable
  TextEditingController githubIdeiaController = TextEditingController();

  @observable
  TextEditingController titleIdeaController = TextEditingController();

  @observable
  TextEditingController descriptionIdeaController = TextEditingController();

  @observable
  var ideaList = ObservableList<IdeaModel>();

  @action
  void addIdea(IdeaModel? idea) {
    ideaList.add(idea!);
  }

  @action
  void removeIdea(int index) {
    ideaList.removeAt(index);
  }

  @action
  void updateIdea(int index, IdeaModel model) {
    ideaList.removeAt(index);
    ideaList.insert(index, model);
  }

  @action
  void addList() {
    user = user!.copyWith(ideas: ideaList);
  }

  @observable
  bool github = false;

  @observable
  bool participantes = false;

  @observable
  int selectedIndex = 0;

  @action
  setIndexMembers(int? index) {
    selectedIndex = index!;
  }
}

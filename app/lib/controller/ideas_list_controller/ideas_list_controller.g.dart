// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideas_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdeasListController on _IdeasListControllerBase, Store {
  final _$errorAtom = Atom(name: '_IdeasListControllerBase.error');

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_IdeasListControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$newIdeaAtom = Atom(name: '_IdeasListControllerBase.newIdea');

  @override
  bool get newIdea {
    _$newIdeaAtom.reportRead();
    return super.newIdea;
  }

  @override
  set newIdea(bool value) {
    _$newIdeaAtom.reportWrite(value, super.newIdea, () {
      super.newIdea = value;
    });
  }

  final _$ideaAtom = Atom(name: '_IdeasListControllerBase.idea');

  @override
  dynamic get idea {
    _$ideaAtom.reportRead();
    return super.idea;
  }

  @override
  set idea(dynamic value) {
    _$ideaAtom.reportWrite(value, super.idea, () {
      super.idea = value;
    });
  }

  final _$indexAtom = Atom(name: '_IdeasListControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$userAtom = Atom(name: '_IdeasListControllerBase.user');

  @override
  RegisterFormModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(RegisterFormModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$githubIdeiaControllerAtom =
      Atom(name: '_IdeasListControllerBase.githubIdeiaController');

  @override
  TextEditingController get githubIdeiaController {
    _$githubIdeiaControllerAtom.reportRead();
    return super.githubIdeiaController;
  }

  @override
  set githubIdeiaController(TextEditingController value) {
    _$githubIdeiaControllerAtom.reportWrite(value, super.githubIdeiaController,
        () {
      super.githubIdeiaController = value;
    });
  }

  final _$titleIdeaControllerAtom =
      Atom(name: '_IdeasListControllerBase.titleIdeaController');

  @override
  TextEditingController get titleIdeaController {
    _$titleIdeaControllerAtom.reportRead();
    return super.titleIdeaController;
  }

  @override
  set titleIdeaController(TextEditingController value) {
    _$titleIdeaControllerAtom.reportWrite(value, super.titleIdeaController, () {
      super.titleIdeaController = value;
    });
  }

  final _$descriptionIdeaControllerAtom =
      Atom(name: '_IdeasListControllerBase.descriptionIdeaController');

  @override
  TextEditingController get descriptionIdeaController {
    _$descriptionIdeaControllerAtom.reportRead();
    return super.descriptionIdeaController;
  }

  @override
  set descriptionIdeaController(TextEditingController value) {
    _$descriptionIdeaControllerAtom
        .reportWrite(value, super.descriptionIdeaController, () {
      super.descriptionIdeaController = value;
    });
  }

  final _$ideaListAtom = Atom(name: '_IdeasListControllerBase.ideaList');

  @override
  ObservableList<IdeaModel> get ideaList {
    _$ideaListAtom.reportRead();
    return super.ideaList;
  }

  @override
  set ideaList(ObservableList<IdeaModel> value) {
    _$ideaListAtom.reportWrite(value, super.ideaList, () {
      super.ideaList = value;
    });
  }

  final _$githubAtom = Atom(name: '_IdeasListControllerBase.github');

  @override
  bool get github {
    _$githubAtom.reportRead();
    return super.github;
  }

  @override
  set github(bool value) {
    _$githubAtom.reportWrite(value, super.github, () {
      super.github = value;
    });
  }

  final _$participantesAtom =
      Atom(name: '_IdeasListControllerBase.participantes');

  @override
  bool get participantes {
    _$participantesAtom.reportRead();
    return super.participantes;
  }

  @override
  set participantes(bool value) {
    _$participantesAtom.reportWrite(value, super.participantes, () {
      super.participantes = value;
    });
  }

  final _$selectedIndexAtom =
      Atom(name: '_IdeasListControllerBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_IdeasListControllerBaseActionController =
      ActionController(name: '_IdeasListControllerBase');

  @override
  void setIndex(int newIndex) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setIndex');
    try {
      return super.setIndex(newIndex);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexNull() {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setIndexNull');
    try {
      return super.setIndexNull();
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdea(IdeaModel newIdea) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setIdea');
    try {
      return super.setIdea(newIdea);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdeaNull() {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setIdeaNull');
    try {
      return super.setIdeaNull();
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewIdea() {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setNewIdea');
    try {
      return super.setNewIdea();
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeControllers() {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.disposeControllers');
    try {
      return super.disposeControllers();
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addIdea(IdeaModel? idea) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.addIdea');
    try {
      return super.addIdea(idea);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeIdea(int index) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.removeIdea');
    try {
      return super.removeIdea(index);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIdea(int index, IdeaModel model) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.updateIdea');
    try {
      return super.updateIdea(index, model);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addList() {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.addList');
    try {
      return super.addList();
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndexMembers(int? index) {
    final _$actionInfo = _$_IdeasListControllerBaseActionController.startAction(
        name: '_IdeasListControllerBase.setIndexMembers');
    try {
      return super.setIndexMembers(index);
    } finally {
      _$_IdeasListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
newIdea: ${newIdea},
idea: ${idea},
index: ${index},
user: ${user},
githubIdeiaController: ${githubIdeiaController},
titleIdeaController: ${titleIdeaController},
descriptionIdeaController: ${descriptionIdeaController},
ideaList: ${ideaList},
github: ${github},
participantes: ${participantes},
selectedIndex: ${selectedIndex}
    ''';
  }
}

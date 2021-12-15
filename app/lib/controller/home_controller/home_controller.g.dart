// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$errorAtom = Atom(name: '_HomeControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

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

  final _$selectedIndexAtom = Atom(name: '_HomeControllerBase.selectedIndex');

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

  final _$userAtom = Atom(name: '_HomeControllerBase.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$pageControllerAtom = Atom(name: '_HomeControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$peoplesWidgetAtom = Atom(name: '_HomeControllerBase.peoplesWidget');

  @override
  List<Widget> get peoplesWidget {
    _$peoplesWidgetAtom.reportRead();
    return super.peoplesWidget;
  }

  @override
  set peoplesWidget(List<Widget> value) {
    _$peoplesWidgetAtom.reportWrite(value, super.peoplesWidget, () {
      super.peoplesWidget = value;
    });
  }

  final _$peoplesListAtom = Atom(name: '_HomeControllerBase.peoplesList');

  @override
  List<UserModel> get peoplesList {
    _$peoplesListAtom.reportRead();
    return super.peoplesList;
  }

  @override
  set peoplesList(List<UserModel> value) {
    _$peoplesListAtom.reportWrite(value, super.peoplesList, () {
      super.peoplesList = value;
    });
  }

  final _$chatPeoplesAtom = Atom(name: '_HomeControllerBase.chatPeoples');

  @override
  List<UserModel> get chatPeoples {
    _$chatPeoplesAtom.reportRead();
    return super.chatPeoples;
  }

  @override
  set chatPeoples(List<UserModel> value) {
    _$chatPeoplesAtom.reportWrite(value, super.chatPeoples, () {
      super.chatPeoples = value;
    });
  }

  final _$loadCurrentUserAsyncAction =
      AsyncAction('_HomeControllerBase.loadCurrentUser');

  @override
  Future<void> loadCurrentUser(BuildContext context) {
    return _$loadCurrentUserAsyncAction
        .run(() => super.loadCurrentUser(context));
  }

  final _$onLikeAsyncAction = AsyncAction('_HomeControllerBase.onLike');

  @override
  Future<void> onLike(String uid) {
    return _$onLikeAsyncAction.run(() => super.onLike(uid));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setIndex(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> response() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.response');
    try {
      return super.response();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeoples(List<QueryDocumentSnapshot<Object?>> docs) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPeoples');
    try {
      return super.setPeoples(docs);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDislike() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onDislike');
    try {
      return super.onDislike();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
selectedIndex: ${selectedIndex},
user: ${user},
pageController: ${pageController},
peoplesWidget: ${peoplesWidget},
peoplesList: ${peoplesList},
chatPeoples: ${chatPeoples}
    ''';
  }
}

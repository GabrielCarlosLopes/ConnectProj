// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DefinitionController on _DefinitionControllerBase, Store {
  final _$errorAtom = Atom(name: '_DefinitionControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_DefinitionControllerBase.loading');

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

  final _$userDataAtom = Atom(name: '_DefinitionControllerBase.userData');

  @override
  RegisterFormModel? get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(RegisterFormModel? value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  final _$indentificationAtom =
      Atom(name: '_DefinitionControllerBase.indentification');

  @override
  bool get indentification {
    _$indentificationAtom.reportRead();
    return super.indentification;
  }

  @override
  set indentification(bool value) {
    _$indentificationAtom.reportWrite(value, super.indentification, () {
      super.indentification = value;
    });
  }

  final _$saveFirebaseAsyncAction =
      AsyncAction('_DefinitionControllerBase.saveFirebase');

  @override
  Future<bool> saveFirebase(Map<String, dynamic> model) {
    return _$saveFirebaseAsyncAction.run(() => super.saveFirebase(model));
  }

  final _$_DefinitionControllerBaseActionController =
      ActionController(name: '_DefinitionControllerBase');

  @override
  void setIndentification() {
    final _$actionInfo = _$_DefinitionControllerBaseActionController
        .startAction(name: '_DefinitionControllerBase.setIndentification');
    try {
      return super.setIndentification();
    } finally {
      _$_DefinitionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(RegisterFormModel? user) {
    final _$actionInfo = _$_DefinitionControllerBaseActionController
        .startAction(name: '_DefinitionControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_DefinitionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
userData: ${userData},
indentification: ${indentification}
    ''';
  }
}

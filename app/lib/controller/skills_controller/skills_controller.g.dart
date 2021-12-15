// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SkillsController on _SkillsControllerBase, Store {
  final _$errorAtom = Atom(name: '_SkillsControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_SkillsControllerBase.loading');

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

  final _$userAtom = Atom(name: '_SkillsControllerBase.user');

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

  final _$listSkillsAtom = Atom(name: '_SkillsControllerBase.listSkills');

  @override
  List<String>? get listSkills {
    _$listSkillsAtom.reportRead();
    return super.listSkills;
  }

  @override
  set listSkills(List<String>? value) {
    _$listSkillsAtom.reportWrite(value, super.listSkills, () {
      super.listSkills = value;
    });
  }

  final _$_SkillsControllerBaseActionController =
      ActionController(name: '_SkillsControllerBase');

  @override
  void addInList(String skill) {
    final _$actionInfo = _$_SkillsControllerBaseActionController.startAction(
        name: '_SkillsControllerBase.addInList');
    try {
      return super.addInList(skill);
    } finally {
      _$_SkillsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setList() {
    final _$actionInfo = _$_SkillsControllerBaseActionController.startAction(
        name: '_SkillsControllerBase.setList');
    try {
      return super.setList();
    } finally {
      _$_SkillsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInList(String skill) {
    final _$actionInfo = _$_SkillsControllerBaseActionController.startAction(
        name: '_SkillsControllerBase.removeInList');
    try {
      return super.removeInList(skill);
    } finally {
      _$_SkillsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSkills() {
    final _$actionInfo = _$_SkillsControllerBaseActionController.startAction(
        name: '_SkillsControllerBase.addSkills');
    try {
      return super.addSkills();
    } finally {
      _$_SkillsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
user: ${user},
listSkills: ${listSkills}
    ''';
  }
}

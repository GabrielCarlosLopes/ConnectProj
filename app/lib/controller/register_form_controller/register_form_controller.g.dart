// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterFormController on _RegisterFormControllerBase, Store {
  final _$errorAtom = Atom(name: '_RegisterFormControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_RegisterFormControllerBase.loading');

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

  final _$nameControllerAtom =
      Atom(name: '_RegisterFormControllerBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$genderAtom = Atom(name: '_RegisterFormControllerBase.gender');

  @override
  bool get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(bool value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$birthDateAtom = Atom(name: '_RegisterFormControllerBase.birthDate');

  @override
  DateTime? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$saveRegisterAsyncAction =
      AsyncAction('_RegisterFormControllerBase.saveRegister');

  @override
  Future<bool> saveRegister(Map<String, dynamic> data, bool photo) {
    return _$saveRegisterAsyncAction.run(() => super.saveRegister(data, photo));
  }

  final _$_RegisterFormControllerBaseActionController =
      ActionController(name: '_RegisterFormControllerBase');

  @override
  void setBirthDate(DateTime newBirthDate) {
    final _$actionInfo = _$_RegisterFormControllerBaseActionController
        .startAction(name: '_RegisterFormControllerBase.setBirthDate');
    try {
      return super.setBirthDate(newBirthDate);
    } finally {
      _$_RegisterFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender() {
    final _$actionInfo = _$_RegisterFormControllerBaseActionController
        .startAction(name: '_RegisterFormControllerBase.setGender');
    try {
      return super.setGender();
    } finally {
      _$_RegisterFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
nameController: ${nameController},
gender: ${gender},
birthDate: ${birthDate}
    ''';
  }
}

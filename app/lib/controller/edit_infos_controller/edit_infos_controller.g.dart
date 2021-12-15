// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_infos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditInfosController on _EditInfosControllerBase, Store {
  final _$loadingAtom = Atom(name: '_EditInfosControllerBase.loading');

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

  final _$errorAtom = Atom(name: '_EditInfosControllerBase.error');

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

  final _$userEditedAtom = Atom(name: '_EditInfosControllerBase.userEdited');

  @override
  RegisterFormModel? get userEdited {
    _$userEditedAtom.reportRead();
    return super.userEdited;
  }

  @override
  set userEdited(RegisterFormModel? value) {
    _$userEditedAtom.reportWrite(value, super.userEdited, () {
      super.userEdited = value;
    });
  }

  final _$genderAtom = Atom(name: '_EditInfosControllerBase.gender');

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

  final _$birthDateAtom = Atom(name: '_EditInfosControllerBase.birthDate');

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

  final _$nameControllerAtom =
      Atom(name: '_EditInfosControllerBase.nameController');

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

  final _$githubControllerAtom =
      Atom(name: '_EditInfosControllerBase.githubController');

  @override
  TextEditingController get githubController {
    _$githubControllerAtom.reportRead();
    return super.githubController;
  }

  @override
  set githubController(TextEditingController value) {
    _$githubControllerAtom.reportWrite(value, super.githubController, () {
      super.githubController = value;
    });
  }

  final _$linkedinControllerAtom =
      Atom(name: '_EditInfosControllerBase.linkedinController');

  @override
  TextEditingController get linkedinController {
    _$linkedinControllerAtom.reportRead();
    return super.linkedinController;
  }

  @override
  set linkedinController(TextEditingController value) {
    _$linkedinControllerAtom.reportWrite(value, super.linkedinController, () {
      super.linkedinController = value;
    });
  }

  final _$descriptionControllerAtom =
      Atom(name: '_EditInfosControllerBase.descriptionController');

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  final _$updateDataAsyncAction =
      AsyncAction('_EditInfosControllerBase.updateData');

  @override
  Future<void> updateData() {
    return _$updateDataAsyncAction.run(() => super.updateData());
  }

  final _$_EditInfosControllerBaseActionController =
      ActionController(name: '_EditInfosControllerBase');

  @override
  void setBirthDate(DateTime newBirthDate) {
    final _$actionInfo = _$_EditInfosControllerBaseActionController.startAction(
        name: '_EditInfosControllerBase.setBirthDate');
    try {
      return super.setBirthDate(newBirthDate);
    } finally {
      _$_EditInfosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender() {
    final _$actionInfo = _$_EditInfosControllerBaseActionController.startAction(
        name: '_EditInfosControllerBase.setGender');
    try {
      return super.setGender();
    } finally {
      _$_EditInfosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(RegisterFormModel? registerModel) {
    final _$actionInfo = _$_EditInfosControllerBaseActionController.startAction(
        name: '_EditInfosControllerBase.setUser');
    try {
      return super.setUser(registerModel);
    } finally {
      _$_EditInfosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserList(RegisterFormModel newUser) {
    final _$actionInfo = _$_EditInfosControllerBaseActionController.startAction(
        name: '_EditInfosControllerBase.setUserList');
    try {
      return super.setUserList(newUser);
    } finally {
      _$_EditInfosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
userEdited: ${userEdited},
gender: ${gender},
birthDate: ${birthDate},
nameController: ${nameController},
githubController: ${githubController},
linkedinController: ${linkedinController},
descriptionController: ${descriptionController}
    ''';
  }
}

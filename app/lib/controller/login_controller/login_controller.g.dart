// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$errorAtom = Atom(name: '_LoginControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

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

  final _$googleSignInAtom = Atom(name: '_LoginControllerBase.googleSignIn');

  @override
  GoogleSignIn get googleSignIn {
    _$googleSignInAtom.reportRead();
    return super.googleSignIn;
  }

  @override
  set googleSignIn(GoogleSignIn value) {
    _$googleSignInAtom.reportWrite(value, super.googleSignIn, () {
      super.googleSignIn = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  GoogleSignInAccount? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(GoogleSignInAccount? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$displayNameAtom = Atom(name: '_LoginControllerBase.displayName');

  @override
  String? get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String? value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  final _$photoUrlAtom = Atom(name: '_LoginControllerBase.photoUrl');

  @override
  String? get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String? value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  final _$googleLoginAsyncAction =
      AsyncAction('_LoginControllerBase.googleLogin');

  @override
  Future<String> googleLogin() {
    return _$googleLoginAsyncAction.run(() => super.googleLogin());
  }

  @override
  String toString() {
    return '''
error: ${error},
loading: ${loading},
googleSignIn: ${googleSignIn},
user: ${user},
displayName: ${displayName},
photoUrl: ${photoUrl}
    ''';
  }
}

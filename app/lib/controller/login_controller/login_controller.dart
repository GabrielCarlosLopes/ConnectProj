import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  var googleSignIn = GoogleSignIn();

  @observable
  GoogleSignInAccount? user;

  @observable
  String? displayName;

  @observable
  String? photoUrl;

  @action
  Future<String> googleLogin() async {
    loading = true;

    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        user = googleUser;
      }

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      displayName = user?.displayName;
      photoUrl = user?.photoUrl;

      final auth = await FirebaseAuth.instance.signInWithCredential(credential);

      final userExist = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.user!.uid)
          .get();

      if (userExist.exists) {
        return 'true';
      } else {
        return 'false';
      }
    } catch (e) {
      error = Exception('Erro ao realizar login com sua conta google!');
      return 'erro';
    } finally {
      loading = false;
    }
  }

  Future<bool> logout() async {
    loading = true;
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      user = null;
      return true;
    } catch (e) {
      error = Exception('Erro ao se desconectar');
    } finally {
      loading = false;
    }
    return false;
  }

  Future<bool> deleteAndLogoutUser() async {
    loading = true;
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .delete();

      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      user = null;
      return true;
    } catch (e) {
      error = Exception('Erro ao se desconectar');
    } finally {
      loading = false;
    }
    return false;
  }

  // SERÁ IMPLEMENTADO EM BREVE

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}

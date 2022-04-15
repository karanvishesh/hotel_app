import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googelSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogIn() async {
    final googleUser = await _googelSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    var customUser =
        await FirebaseAuth.instance.signInWithCredential(credential);
    var ref = FirebaseFirestore.instance
        .collection("users")
        .doc(customUser.user!.uid);
    ref.get().then((value) {
      if (!value.exists) {
        ref.set({
          "name": _user!.displayName,
          "email": _user!.email,
          "photoUrl": _user!.photoUrl,
        });
      }
    });
    if (kDebugMode) {
      print(_user!.email);
    }
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future GoogleLogOut() async {
    final _googelSignIn = GoogleSignIn();
    await _googelSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}

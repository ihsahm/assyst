import 'package:assyst/Authentication/login.dart';
import 'package:assyst/Shared/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool isloged = false;
  String name;
  String email;

  /* Observable<User> user;
  Observable<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  AuthService() {
    user = Observable(_auth.authStateChanges());

    profile = user.switchMap((User u) {
      if (u != null) {
        return db
            .collection('users')
            .doc(u.uid)
            .snapshots()
            .map((snap) => snap.data());
      } else {
        return Observable.just({});
      }
    });
  }

  Future<User> googleSignin() async {
    loading.add(true);

    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User user = (await _auth.signInWithCredential(credential)).user;

    updateUserData(user);

    print('signed in ' + user.displayName);

    loading.add(false);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    name = user.displayName;
    email = user.email;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    return user;
  }
*/
  void updateUserData(User user) async {
    DocumentReference ref = db.collection('users').doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    });
  }
}

class AuthPhone {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Navigation();
        } else {
          return Login();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds) async {
    FirebaseAuth.instance.signInWithCredential(authCreds);
    // var phoneNumber = FirebaseAuth.instance.currentUser.phoneNumber;
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(smsCode: smsCode, verificationId: verId);

    signIn(authCreds);
  }
}

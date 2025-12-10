import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Login
  Future<User?> login(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return cred.user;
    } on FirebaseAuthException catch (e) {
      throw (e.message ?? 'Login error');
    }
  }

  // Signup + create user doc in Firestore
  Future<User?> signup({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final user = cred.user;
      if (user != null) {
        // create user doc in Firestore
        final model = UserModel(
          uid: user.uid,
          email: user.email ?? email,
          name: name,
          role: 'user', // by default
        );
        await _db.collection('users').doc(user.uid).set(model.toJson());
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw (e.message ?? 'Signup error');
    }
  }

  // Update user interests after onboarding
  Future<void> updateUserInterests(String uid, {
    List<String>? sports,
    List<String>? leagues,
    List<String>? teams,
    List<String>? players,
  }) async {
    final data = <String, dynamic>{};
    if (sports != null) data['sports'] = sports;
    if (leagues != null) data['leagues'] = leagues;
    if (teams != null) data['teams'] = teams;
    if (players != null) data['players'] = players;
    await _db.collection('users').doc(uid).update(data);
  }

  // Get user doc
  Future<UserModel?> getUserModel(String uid) async {
    final snap = await _db.collection('users').doc(uid).get();
    if (!snap.exists) return null;
    return UserModel.fromJson(snap.data()!);
  }

  // Sign out
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Forgot Password
  Future<void> resetPassword(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email.trim());
  } on FirebaseAuthException catch (e) {
    throw e.message ?? "خطأ أثناء إرسال رابط إعادة التعيين";
  }
}

}

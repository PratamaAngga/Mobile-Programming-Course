import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // cek user yang lagi login
  User? get currentUser => _auth.currentUser;

  // stream buat dengerin perubahan status login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // register
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Register gagal";
    }
  }

  // login
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login gagal";
    }
  }

  // logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
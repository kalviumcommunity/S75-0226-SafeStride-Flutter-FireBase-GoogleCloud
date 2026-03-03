// In lib/services/auth_service.dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signInWithGoogle() async {
  try {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // user cancelled

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result.user;
  } catch (e) {
    debugPrint('Google sign-in error: $e');
    return null;
  }
}
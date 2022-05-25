import 'package:bobtail_assignment/app/data/model/response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  Future<ResponseModel> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
      return ResponseModel(success: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ResponseModel(error: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ResponseModel(error: 'Wrong password provided for that user.');
      }
    }
    return ResponseModel();
  }
}

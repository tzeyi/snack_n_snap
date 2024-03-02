import "dart:io";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";


class Authentication {

  FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up
  Future<void> registerUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String username,
    required File profile,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty){
        if (password == confirmPassword){
          await _auth.createUserWithEmailAndPassword(
            email: email, 
            password: password,
          );
        } else {
          throw Exception("passwords don't match!");
        }
      } else {
        throw Exception("field is empty");
      }
    // display errors
    } on FirebaseAuthException catch(e) {
      throw Exception(e.message.toString());
    }
  }

  // sign in
  void loginUser({
    required email, 
    required password
    }) async {
    // sign user in
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
    }
    // display errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.message.toString());
    }
  }
}


class StorageMethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(String name, File file) async {
    Reference ref = _storage.ref().child(name).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}


import 'package:firebase_auth/firebase_auth.dart';
// adding google package or the sign in
import 'package:google_sign_in/google_sign_in.dart';

class Firebaseauthservice {
  final auth = FirebaseAuth.instance;
  final googlesignin = GoogleSignIn();

  sigingoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googlesignin.signIn();
      // google sign in account to get info of google accountants
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        //- If the user signed in, get their ID token and access token.
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        //- Converts the Google tokens into a format Firebase understands.
        auth.signInWithCredential(authCredential);
        //Uses the credential to sign the user into Firebase.
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      // TODO
    }
  }
}

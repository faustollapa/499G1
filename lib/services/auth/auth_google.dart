import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/* This the source that I used to implement the google signin part of this file.
  https://youtu.be/1U8_Mq1QdX4
*/

class GoogleAuthService {
  // Google Sign in
  signInWithGoogle() async {
    // Begins interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    
      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Creates a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally, let us sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

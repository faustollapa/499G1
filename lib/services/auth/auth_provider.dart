import 'package:tales_of_tourists/services/auth/auth_user.dart';

/* This the source that I used to implement the user authentication part of this file.
  https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
*/

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser> logIn ({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
}

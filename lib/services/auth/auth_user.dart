import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

/* This the source that I used to implement the user authentication part of this file.
  https://youtu.be/VPvVD8t02U8 from 7:31:31 - 14:16:21
*/

@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser({required this.isEmailVerified});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(isEmailVerified: user.emailVerified);
}

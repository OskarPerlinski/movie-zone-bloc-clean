import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/data/auth/models/user_creation_req.dart';
import 'package:movie_zone/data/auth/models/user_signin_req.dart';

abstract class AuthFirebaseService {
  Future<Either> singup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendResetPasswordEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> singup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
        },
      );
      return const Right(
        'Sign up was successfull',
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right('Sign in was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password or email';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendResetPasswordEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
        'Password reset email is sent',
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}

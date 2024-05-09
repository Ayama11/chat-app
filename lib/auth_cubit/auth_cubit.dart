import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registierUser(
      {required String email, required String password}) async {
    emit(RegisterLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(RegisterSucss());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: ' weak-password '));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: ' email-already-in-use '));
      }
    } on Exception {
      emit(RegisterFailure(errorMessage: 'something is wrong'));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSucsees());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: ' user not foun'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: ' wrong password'));
      }
    } on Exception {
      emit(LoginFailure(errorMessage: 'something is wrong'));
    }
  }
}

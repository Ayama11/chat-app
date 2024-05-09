import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoding());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);

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
    });
  }
}

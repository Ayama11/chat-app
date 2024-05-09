// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   Future<void> login({required String email, required String password}) async {
//     emit(LoginLoding());
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(LoginSucsees());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailure(errorMessage: ' user not foun'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailure(errorMessage: ' wrong password'));
//       }
//     } on Exception {
//       emit(LoginFailure(errorMessage: 'something is wrong'));
//     }
//   }
// }

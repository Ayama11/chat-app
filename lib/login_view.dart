import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:teste/auth_cubit/auth_cubit.dart';

import 'package:teste/chat_view.dart';
import 'package:teste/cubits/login_cubit/chat/chat_cubit.dart';

import 'helper/snakbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  bool isLoding = false;

  String? email, password;

  GlobalKey<FormState> keyfor = GlobalKey();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      // bloclistener is dont rebuild ui so i am use bloc consumer
      listener: (context, state) {
        if (state is LoginLoding) {
          isLoding = true;
        } else if (state is LoginSucsees) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Get.to(() => ChatView(), arguments: email);

          isLoding = false;
        } else if (state is LoginFailure) {
          showSnakbar(context, state.errorMessage);
          isLoding = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Scaffold(
          body: Form(
            key: keyfor,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                      hintText: 'email',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                      hintText: 'password',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (keyfor.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .login(email: email!, password: password!);
                    }
                  },
                  child: const Text('register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}

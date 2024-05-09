import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:teste/bloc/auth_bloc.dart';

import 'package:teste/helper/snakbar.dart';
import 'package:teste/views/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isLoding = false;

  String? email, password;

  GlobalKey<FormState> keyfor = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoding) {
            isLoding = true;
          } else if (state is RegisterSucss) {
            Get.to(() => const LoginView());

            isLoding = false;
          } else if (state is RegisterFailure) {
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (keyfor.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    password: password!, email: email!));
                          }
                        },
                        child: const Text('register'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account ? ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 22, 21, 21)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const LoginView());
                            },
                            child: const Text(
                              '   log in  ',
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 36, 36, 0.973)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<void> registierUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}

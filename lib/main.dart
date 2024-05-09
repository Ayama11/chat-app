import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/auth_cubit/auth_cubit.dart';
import 'package:teste/bloc/auth_bloc.dart';
import 'package:teste/cubits/login_cubit/chat/chat_cubit.dart';
import 'package:teste/firebase_options.dart';
import 'package:teste/helper/observes.dart';
import 'package:teste/regester_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  BlocOverrides.runZoned(
    () {
      runApp(const ChatApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => LoginCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => RegisterCubit(),
        // ),

        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: const GetMaterialApp(
        home: RegisterView(),
      ),
    );
  }
}

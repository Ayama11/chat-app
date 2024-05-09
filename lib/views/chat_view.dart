import 'package:flutter/material.dart';

import 'package:teste/cubits/login_cubit/chat/chat_cubit.dart';
import 'package:teste/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final TextEditingController controller = TextEditingController();
  final controllers = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat App'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  var messageslist =
                      BlocProvider.of<ChatCubit>(context).messageslist;
                  return ListView.builder(
                      reverse: true,
                      controller: controllers,
                      itemCount: messageslist.length,
                      itemBuilder: (context, index) {
                        return messageslist[index].id == email
                            ? ChatBuble(message: messageslist[index])
                            : ChatBubleForAnthor(message: messageslist[index]);
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onSubmitted: (data) {
                  // messages.add({
                  //   kMessage: data,
                  //   kCreatat: DateTime.now(),
                  //   kEmail: email,
                  // });

                  BlocProvider.of<ChatCubit>(context)
                      .sendMessages(message: data, email: email);
                  controller.clear();
                  controllers.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(199),
                    borderSide:
                        const BorderSide(color: Color(0xffd6d9f1), width: 2.5),
                  ),
                  hintText: "Send massage",
                  suffixIcon: const Icon(
                    Icons.send_outlined,
                  ),
                ),
                controller: controller,
              ),
            ),
          ],
        ));
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding:
            const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32)),
            color: Colors.cyan),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubleForAnthor extends StatelessWidget {
  const ChatBubleForAnthor({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding:
            const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: Colors.grey),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

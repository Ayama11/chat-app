import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:teste/helper/consts.dart';
import 'package:teste/models/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessage);
  List<Message> messageslist = [];
  void sendMessages({required String message, required String email}) {
    try {
      messages.add({
        kMessage: message,
        kCreatat: DateTime.now(),
        kEmail: email,
      });
    } on Exception {}
  }

  void getMessages() {
    messages.orderBy(kCreatat, descending: true).snapshots().listen((event) {
      messageslist.clear();
      for (var doc in event.docs) {
        messageslist.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messageslist));
    });
  }
}

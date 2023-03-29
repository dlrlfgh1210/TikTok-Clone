import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tiktok/features/inbox/models/message.dart';

class MessagesRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    await _db
        .collection("chat_rooms")
        .doc("Fn8OZbZv6WqwJZMqQdmO")
        .collection("texts")
        .add(
      message.toJson(),
    );
    }
}

final messagesRepo = Provider(
    (ref) => MessagesRepo(),
);
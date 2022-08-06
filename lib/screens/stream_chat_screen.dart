import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamChatScreen extends StatefulWidget {
  StreamChatScreen({Key key}) : super(key: key);

  @override
  State<StreamChatScreen> createState() => _StreamChatScreenState();
}

class _StreamChatScreenState extends State<StreamChatScreen> {
  @override
  Widget build(BuildContext context) {
    const apiKey = "ykrpttzachfq";
    const userToken =
        "mcp2k4ucc7ndu7u8vsvyb6s2kkja8e8672bjg7wds5jv4q4hy2368ce8cdzdy644";

    final client = StreamChatClient(apiKey, logLevel: Level.INFO);
    return StreamChat(
      client: client,
    );
  }
}

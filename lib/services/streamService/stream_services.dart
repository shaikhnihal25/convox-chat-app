import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamServices {
  initialize() async {
    const apiKey = "ykrpttzachfq";
    const userToken =
        "mcp2k4ucc7ndu7u8vsvyb6s2kkja8e8672bjg7wds5jv4q4hy2368ce8cdzdy644";

    final client = StreamChatClient(apiKey, logLevel: Level.INFO);
    var devToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGhlaHlicmlibGFicyJ9.CldRP5ei0nEx6IXdj1je_MVpDqyVgowFtsYD9NQswnQ";

    await client.connectUser(
        User(
          id: "billowing-sky-6",
          name: "billowing",
          image: "https://bit.ly/2u9Vc0r",
        ),
        devToken);
    var channel = client.channel("messaging", id: "thehybrildlabs");

    await channel.watch();
  }
}

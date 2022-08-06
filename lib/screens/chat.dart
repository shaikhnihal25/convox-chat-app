// ignore_for_file: prefer_const_constructors

import 'package:convox/screens/home.dart';
import 'package:convox/services/server/server_config.dart';
import 'package:convox/utils/iColors.dart';
import 'package:convox/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  String title;

  ChatScreen({Key key, this.title}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: IColors.background,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: IColors.title),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => HomeScreen())));
          },
          child: Icon(
            CupertinoIcons.back,
            size: 28,
            color: IColors.placeholderText,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: "Calling " + widget.title);
            },
            child: Icon(
              Icons.call,
              color: IColors.green,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: "Calling " + widget.title);
            },
            child: Icon(
              CupertinoIcons.videocam_fill,
              color: IColors.green,
              size: 28,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: height / 16,
              width: width,
              decoration: BoxDecoration(color: IColors.background),
              child: Row(
                children: [
                  SizedBox(
                    width: width / 50,
                  ),
                  CircleAvatar(
                    backgroundColor: IColors.placeholder,
                    child: Icon(
                      Icons.add,
                      size: 22,
                      color: IColors.title,
                    ),
                  ),
                  SizedBox(
                    width: width / 60,
                  ),
                  Flexible(
                      child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Type message..."),
                  )),
                  Padding(
                      padding: EdgeInsets.only(
                          right: width / 50,
                          bottom: height / 150,
                          top: height / 150),
                      child: GestureDetector(
                        onTap: () {
                          // ServerConfig().sendMessage("message", 1, 4);
                        },
                        child: Container(
                          height: height / 25,
                          width: width / 8,
                          decoration: BoxDecoration(
                              color: IColors.placeholder,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

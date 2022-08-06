// ignore_for_file: prefer_const_constructors

import 'package:convox/screens/chat.dart';
import 'package:convox/screens/login.dart';
import 'package:convox/utils/iBottomSheet.dart';
import 'package:convox/utils/iColors.dart';
import 'package:convox/utils/router.dart';
import 'package:convox/utils/theme_model.dart';
import 'package:convox/widgets/addChatFields.dart';
import 'package:convox/widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ChatList extends StatefulWidget {
  ChatList({Key key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<String> images = [
    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1542206395-9feb3edaa68d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  ];
  List<String> title = [
    "Wesley Manwaring",
    "Ellery Ferguson",
    "Stephan Cunningham",
    "Norman Guerrero",
    "Ava Sowle",
    "Luna Boyd",
    "Stewart Berry",
    "Don Fennimore",
    "Abe Soto",
    "Gene Covington"
  ];
  List<String> subtitle = [
    "Wesleymanwaring@gmail.com",
    "Elleryferguson@gmail.com",
    "Stephancunningham@gmail.com",
    "Normanguerrero@gmail.com",
    "Avasowle@gmail.com",
    "Lunaboyd@gmail.com",
    "Stewartberry@gmail.com",
    "Donfennimore@gmail.com",
    "Abesoto@gmail.com",
    "Genecovington@gmail.com"
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? IColors.title : IColors.background,
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor:
        //       themeNotifier.isDark ? IColors.title : IColors.background,
        //   title: Text(
        //     "Chats",
        //     style: TextStyle(
        //         // fontFamily: GoogleFonts.mavenPro().fontFamily,
        //         color:
        //             themeNotifier.isDark ? IColors.background : IColors.title,
        //         fontSize: 34,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return Padding(
        //                     padding: EdgeInsets.only(top: height / 1.250),
        //                     child: Column(
        //                       children: [
        //                         GestureDetector(
        //                           onTap: () {
        //                             themeNotifier.isDark
        //                                 ? themeNotifier.isDark = false
        //                                 : themeNotifier.isDark = true;
        //                           },
        //                           child: Container(
        //                             height: height / 15,
        //                             width: width / 1.1,
        //                             decoration: BoxDecoration(
        //                                 color: IColors.yellow,
        //                                 borderRadius:
        //                                     BorderRadius.circular(12)),
        //                             child: Center(
        //                               child: Text(
        //                                 "Change Theme",
        //                                 style: TextStyle(
        //                                     decoration: TextDecoration.none,
        //                                     color: IColors.title,
        //                                     fontWeight: FontWeight.bold,
        //                                     fontFamily:
        //                                         GoogleFonts.roboto().fontFamily,
        //                                     fontSize: 20),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: height / 60,
        //                         ),
        //                         GestureDetector(
        //                           onTap: () {
        //                             Navigator.pushReplacement(
        //                                 context,
        //                                 MaterialPageRoute(
        //                                     builder: ((context) =>
        //                                         LoginScreen())));
        //                           },
        //                           child: Container(
        //                             height: height / 15,
        //                             width: width / 1.1,
        //                             decoration: BoxDecoration(
        //                                 color: IColors.red,
        //                                 borderRadius:
        //                                     BorderRadius.circular(12)),
        //                             child: Center(
        //                               child: Text(
        //                                 "Logout?",
        //                                 style: TextStyle(
        //                                     decoration: TextDecoration.none,
        //                                     color: IColors.title,
        //                                     fontWeight: FontWeight.bold,
        //                                     fontFamily:
        //                                         GoogleFonts.roboto().fontFamily,
        //                                     fontSize: 20),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ));
        //               });
        //         },
        //         icon: Icon(
        //           Iconsax.setting,
        //           color:
        //               themeNotifier.isDark ? IColors.background : IColors.title,
        //         ))
        //   ],
        // ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //------------------------//
              MyAppBar(title: "Chats"),
              //-------------------------------//
              Padding(
                padding: EdgeInsets.only(top: height / 30, left: width / 60),
                child: Container(
                  height: height / 20,
                  width: width / 1.080,
                  decoration: BoxDecoration(
                      color: themeNotifier.isDark
                          ? Colors.grey.shade800
                          : IColors.placeholder,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 30, right: width / 60, bottom: 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          suffixIcon: Icon(
                            Icons.search,
                            color: IColors.placeholderText,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 80,
              ),
              // ChatList()
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: images.isEmpty ? 1 : images.length,
                itemBuilder: (context, index) {
                  if (images.isEmpty) {
                    return Center(
                      child: Text(
                        "No Chats",
                        style: TextStyle(
                          color: IColors.placeholderText,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    ChatScreen(title: title[index]))));
                      },
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height / 3),
                                    child: Container(
                                      height: height / 2.4,
                                      width: width / 1.2,
                                      decoration: BoxDecoration(
                                          color: themeNotifier.isDark
                                              ? IColors.title
                                              : IColors.background,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 60,
                                                left: width / 30),
                                            child: Container(
                                              height: height / 6.5,
                                              width: width / 1.3,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/map.png'),
                                                      fit: BoxFit.cover),
                                                  color: IColors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 7.8,
                                                left: width / 2.9),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: height / 12,
                                                width: width / 6,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                    border: Border.all(
                                                      width: 4,
                                                      color: themeNotifier
                                                              .isDark
                                                          ? IColors.title
                                                          : IColors.background,
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            images[index]),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 6,
                                                left: width / 5.5),
                                            child: Container(
                                              height: height / 5,
                                              width: width / 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    title[index],
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          GoogleFonts.mavenPro()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: themeNotifier
                                                              .isDark
                                                          ? IColors.background
                                                          : IColors.title,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height / 180,
                                                  ),
                                                  Text(
                                                    subtitle[index],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 16,
                                                        fontFamily: GoogleFonts
                                                                .mavenPro()
                                                            .fontFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: IColors
                                                            .placeholderText),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          //----------Buttons---------//
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 3.1,
                                                left: width / 3.5),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Fluttertoast.showToast(
                                                        msg: "Audio call to  " +
                                                            title[index]);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: height / 30,
                                                    backgroundColor:
                                                        IColors.blue,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.call,
                                                        color:
                                                            IColors.background,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 30,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Fluttertoast.showToast(
                                                        msg: "Video call to " +
                                                            title[index]);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: height / 30,
                                                    backgroundColor:
                                                        IColors.blue,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.video_call,
                                                        color:
                                                            IColors.background,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                            backgroundColor: IColors.placeholderText,
                            backgroundImage: NetworkImage(images[index]),
                          ),
                        ),
                        title: Text(
                          title[index],
                          style: TextStyle(
                              color: themeNotifier.isDark
                                  ? IColors.background
                                  : IColors.title,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(subtitle[index]),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: "tapped");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => AddChatField())));
            },
            child: CircleAvatar(
              radius: height / 35,
              backgroundColor:
                  themeNotifier.isDark ? IColors.background : IColors.title,
              child: Center(
                child: Icon(
                  Icons.add,
                  color:
                      themeNotifier.isDark ? IColors.title : IColors.background,
                  size: 28,
                ),
              ),
            )),
      );
    });
  }
}

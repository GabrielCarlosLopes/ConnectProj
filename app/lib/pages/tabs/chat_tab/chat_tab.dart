import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/models/user_model.dart';
import 'package:connect_proj/pages/tabs/chat_tab/chat.dart';
import 'package:connect_proj/pages/user_details/user_details.dart';
import 'package:flutter/material.dart';

import 'package:connect_proj/controller/home_controller/home_controller.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:google_fonts/google_fonts.dart';

class ChatTab extends StatefulWidget {
  final HomeController homeController;
  const ChatTab({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  void _handlePressed(
      types.User otherUser, BuildContext context, UserModel user) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          room: room,
          user: user,
        ),
      ),
    );

    // Navigate to the Chat screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.homeController.response(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: green),
            );
          }

          if (widget.homeController.chatPeoples.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma conexão :(',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }

          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: widget.homeController.chatPeoples.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      tileColor: greyLight,
                      title: Text(
                        widget.homeController.chatPeoples[index].name!,
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetails(
                                userUid: widget
                                    .homeController.chatPeoples[index].uid!,
                              ),
                            ),
                          );
                        },
                        icon: CircleAvatar(
                          backgroundImage: NetworkImage(
                            widget
                                .homeController.chatPeoples[index].perfilPhoto!,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: grey,
                      ),
                      onTap: () => _handlePressed(
                        types.User(
                          id: widget.homeController.chatPeoples[index].uid!,
                        ),
                        context,
                        widget.homeController.chatPeoples[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

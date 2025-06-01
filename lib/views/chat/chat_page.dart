

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {

  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  late List<ChatMessage> messages;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages = [
      ChatMessage(
        text: 'Hey!',
        user: user,
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),*/
      body: Row(
        children: [

          Expanded(child: Card(
            child: Column(
              children: [
                for(String name in ['1Chat', '2Chat'])
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(name[0]),
                    ),
                    title: Text(name),
                  )
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: Column(
              children: [

                ListTile(
                  title: Text('Chat'),
                ),
                Expanded(
                  child: DashChat(
                    currentUser: user,
                    onSend: (ChatMessage m) {
                      setState(() {
                        messages.insert(0, m);
                      });
                    },
                    messages: messages,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

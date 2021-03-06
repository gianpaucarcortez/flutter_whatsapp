import 'package:flutter/material.dart';
import 'package:flutter_codigo3_whatsapp/data/data_dummy.dart';
import 'package:flutter_codigo3_whatsapp/models/chat_message.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  bool isWriting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE4DD),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
            ),
            SizedBox(width: 10),
            Flexible(child: Text("Carolina Gonzales")),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: messages[index].messageType == "yo"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: messages[index].messageType == "yo"
                        ? Color(0xffDCF8C6)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: messages[index].messageType=="otro"? Radius.circular(0):Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topRight:messages[index].messageType=="yo"? Radius.circular(0):Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Text(messages[index].messageContent),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: Color(0xff878787),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Escribe un mensaje",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          onChanged: (String value) {
                            if (value.length > 0) {
                              isWriting = true;
                            } else {
                              isWriting = false;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file,
                            color: Color(0xff878787),
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Color(0xff878787),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0),
                child: GestureDetector(
                  onTap: (){
                    messages.add(
                      ChatMessage(messageContent: "Practica Flutter", messageType: "yo")
                    );
                    setState(() {

                    });

                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 27.0,
                    child: !isWriting
                        ? Icon(Icons.mic, color: Colors.white, size: 28)
                        : Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String img;
  final String name;

  const ChatScreen({
    Key? key,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = 'Riri';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = MessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = Sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = MessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = Receiver_id;

      msgController.text = '';

      if (mounted)
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted)
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(widget.img), radius: 16),
            SizedBox(width: 8),
            Text(widget.name,
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ],
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.call, color: Colors.black, size: 20))
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.separated(
              separatorBuilder: (_, i) => Divider(color: Colors.transparent),
              shrinkWrap: true,
              reverse: true,
              controller: scrollController,
              itemCount: msgListing.length,
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
              itemBuilder: (_, index) {
                MessageModel data = msgListing[index];
                var isMe = data.senderId == Sender_id;

                return ChatMessageWidget1(isMe: isMe, data: data);
                //return ChatMessageWidget(isMe: isMe, data: data);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF1D82FC),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgController,
                      focusNode: msgFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintText: personName.isNotEmpty
                            ? 'Write to Riri'
                            : 'Type a something...',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      onSubmitted: (s) {
                        sendClick();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, size: 20, color: Colors.white),
                    alignment: Alignment.center,
                    onPressed: () {
                      sendClick();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());
}

class MessageModel {
  int ? senderId;
  int ? receiverId;
  String ? msg;
  String ? time;

  MessageModel({this.senderId, this.receiverId, this.msg, this.time});
}

List<MessageModel> getChatMsgData() {
  List<MessageModel> list = [];

  MessageModel c1 = MessageModel();
  c1.senderId = Sender_id;
  c1.receiverId = Receiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  MessageModel c2 = MessageModel();
  c2.senderId = Sender_id;
  c2.receiverId = Receiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  MessageModel c3 = MessageModel();
  c3.senderId = Receiver_id;
  c3.receiverId = Sender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  MessageModel c4 = MessageModel();
  c4.senderId = Sender_id;
  c4.receiverId = Receiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  MessageModel c5 = MessageModel();
  c5.senderId = Sender_id;
  c5.receiverId = Receiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  MessageModel c6 = MessageModel();
  c6.senderId = Receiver_id;
  c6.receiverId = Sender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  MessageModel c7 = MessageModel();
  c7.senderId = Sender_id;
  c7.receiverId = Receiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  MessageModel c8 = MessageModel();
  c8.senderId = Receiver_id;
  c8.receiverId = Sender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  MessageModel c9 = MessageModel();
  c9.senderId = Sender_id;
  c9.receiverId = Receiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  MessageModel c10 = MessageModel();
  c10.senderId = Receiver_id;
  c10.receiverId = Sender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  MessageModel c11 = MessageModel();
  c11.senderId = Receiver_id;
  c11.receiverId = Sender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  MessageModel c12 = MessageModel();
  c12.senderId = Sender_id;
  c12.receiverId = Receiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  MessageModel c13 = MessageModel();
  c13.senderId = Sender_id;
  c13.receiverId = Receiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  MessageModel c14 = MessageModel();
  c14.senderId = Receiver_id;
  c14.receiverId = Sender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  MessageModel c15 = MessageModel();
  c15.senderId = Sender_id;
  c15.receiverId = Receiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  MessageModel c16 = MessageModel();
  c16.senderId = Receiver_id;
  c16.receiverId = Sender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  MessageModel c17 = MessageModel();
  c17.senderId = Sender_id;
  c17.receiverId = Receiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  MessageModel c18 = MessageModel();
  c18.senderId = Receiver_id;
  c18.receiverId = Sender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

class ChatMessageWidget1 extends StatelessWidget {
  const ChatMessageWidget1({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final MessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe
              ? EdgeInsets.only(
                  top: 3.0,
                  bottom: 3.0,
                  right: 0,
                  left: (500 * 0.25).toDouble())
              : EdgeInsets.only(
                  top: 4.0,
                  bottom: 4.0,
                  left: 0,
                  right: (500 * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? Colors.red.withOpacity(0.85) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))
                : BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
            border: Border.all(
                color:
                    isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(data.msg.toString(),
                      style: TextStyle(
                          color: !isMe ? Colors.white : Colors.black))),
              Text(data.time.toString(),
                  style: TextStyle(
                      color: !isMe ? Colors.white : Colors.grey, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}

const Sender_id = 1;
const Receiver_id = 2;

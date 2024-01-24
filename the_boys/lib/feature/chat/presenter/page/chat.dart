import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  TextEditingController textEditingController = TextEditingController();

  void _addMessage(String text, bool isMe) {
    setState(() {
      _messages.add(Message(text: text, isSender: isMe));
      textEditingController.clear();
    });
  }

  @override
  void initState() {
    _messages.add(Message(text: "Hi!", isSender: false));
    _messages.add(Message(text: "Its me SKS", isSender: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.transparent,
        elevation: 1,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group Name',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Group member name or about',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildInputArea(),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Container(
      alignment:
          message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isSender
              ? Colors.blue.withOpacity(.5)
              : Theme.of(context).colorScheme.primary.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add_photo_alternate,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(hintText: 'Message'),
            autofocus: true,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                _addMessage(value, true);
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            final text = textEditingController.text.toString();
            if (text.isNotEmpty) {
              _addMessage(text, true);
            }
          },
        ),
      ],
    );
  }
}

class Message {
  String text;
  bool isSender;
  Message({
    required this.text,
    required this.isSender,
  });
}

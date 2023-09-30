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
      _messages.add(Message(text: text, isMe: isMe));
      textEditingController.clear();
    });
  }

  @override
  void initState() {
    _messages.add(Message(text: "Hi!", isMe: false));
    _messages.add(Message(text: "Its me SKS", isMe: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white38,
                ),
                child: const Icon(Icons.person),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Group Name',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    'Group member name or about',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add_photo_alternate,
            size: 30,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(hintText: 'Message'),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                _addMessage(value, true);
              }
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
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
  bool isMe;
  Message({
    required this.text,
    required this.isMe,
  });
}

import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/user.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
                elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Chats",
          style: TextStyle(
            fontSize: 15,
            color: backgroundColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          buildTile(
              context,
              User(
                  name: "John Doa",
                  age: '17',
                  urlImage:
                      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/af93cf2f-b7b4-45e2-b2e5-29f807e64088/dfeq6u3-67723c3c-4b23-4c6a-9158-35db05755d6a.png/v1/fill/w_640,h_832,q_80,strp/hot_oc_anime_character_by_waifustudios_dfeq6u3-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODMyIiwicGF0aCI6IlwvZlwvYWY5M2NmMmYtYjdiNC00NWUyLWIyZTUtMjlmODA3ZTY0MDg4XC9kZmVxNnUzLTY3NzIzYzNjLTRiMjMtNGM2YS05MTU4LTM1ZGIwNTc1NWQ2YS5wbmciLCJ3aWR0aCI6Ijw9NjQwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.KoTpVNFHmygh67sWOV_eYWR98sFsScP2xB7qaG845eY",
                  about: "Designer, Adorable Agency")),
          buildTile(
            context,
            User(
              name: "Lorem Ipsum",
              age: '20',
              urlImage:
                  "https://i.pinimg.com/736x/9d/78/76/9d787605f2ff60329f48726991f7e169.jpg",
              about: "Lorem Ipsum",
            ),
          ),
        ],
      ),
    );
  }

  Container buildTile(BuildContext context, User user) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.red.shade200.withOpacity(.5),
      ),
      child: ListTile(
        leading: ClipOval(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.red.shade200.withOpacity(.5),
              image: DecorationImage(
                image: NetworkImage(user.urlImage),
                fit: BoxFit.cover,
                alignment: const Alignment(0, -1),
              ),
            ),
          ),
        ),
        title: Text(user.name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(user.age),
            const Text(
              ' ● ',
              style: TextStyle(color: Colors.white60, fontSize: 10),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: Text(
                user.about,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserChat(
                user: user,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class UserChat extends StatefulWidget {
  User user;
  UserChat({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State createState() => UserChatState();
}

class UserChatState extends State<UserChat> {
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
    _messages.add(
        Message(text: "Its me ${widget.user.name.split(' ')[0]}", isMe: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: backgroundColor2,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red.shade200.withOpacity(.5),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.urlImage),
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, -1),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.user.name}, ${widget.user.age}',
                  style: const TextStyle(color: backgroundColor2),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    widget.user.about,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: backgroundColor2, fontSize: 12),
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

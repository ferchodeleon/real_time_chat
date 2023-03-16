import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_real_time_chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _messages = [
    // ChatMessage(text: 'Hola mundo', uid: '123'),
    // ChatMessage(text: 'Hola mundo', uid: '123'),
    // ChatMessage(text: 'Hola mundo', uid: '456'),
    // ChatMessage(text: 'Hola mundo', uid: '123'),
    // ChatMessage(text: 'Hola mundo', uid: '456'),
    // ChatMessage(text: 'Hola mundo', uid: '123'),
  ];
  bool _isReading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 15,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            const Text(
              'Maria',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                physics: const BouncingScrollPhysics(),
                reverse: true,
              ),
            ),
            Divider(
              height: 1,
            ),
            //TODO: Caja de texto
            Container(
              color: Colors.white,
              height: 50,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSumit,
                onChanged: (String text) {
                  setState(() {
                    if (text.trim().isNotEmpty) {
                      _isReading = true;
                    } else {
                      _isReading = false;
                    }
                  });
                  //TODO: Cuando hay un valor, para poder postear
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _isReading
                          ? () => _handleSumit(_textController.text)
                          : null,
                      child: const Text('Enviar'),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: _isReading
                              ? () => _handleSumit(_textController.text)
                              : null,
                          icon: const Icon(Icons.send),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  _handleSumit(String text) {
    if (text.isEmpty) return;

    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isReading = false;
    });
  }
}

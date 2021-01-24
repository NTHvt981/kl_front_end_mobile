import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:do_an_ui/models/message.dart';
import 'package:do_an_ui/pages/messages/message_list_view.dart';
import 'package:do_an_ui/routes/router.gr.dart';
import 'package:do_an_ui/services/message_service.dart';
import 'package:do_an_ui/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MessageListPage extends StatefulWidget {
  final String userId;

  MessageListPage({
    Key key,
    @required this.userId
}): super(key: key);

  @override
  _MessageListPageState createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();

    messageService.readAllLive(widget.userId).listen((data) {
      setState(() {
        messages = data;

        log('number of message: ${data.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: MessageListView(
          data: messages,
          onSelect: onSelect,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(MaterialIcons.plus_one,),
        onPressed: createNewMessage,
      ),
    );
  }

  onSelect(Message message) {
    ExtendedNavigator.root.push(
      Routes.messageDetailPage,
      arguments: MessageDetailPageArguments(userId: widget.userId, message: message)
    );
  }

  createNewMessage() {
    ExtendedNavigator.root.push(
        Routes.createMessagePage, arguments: CreateMessagePageArguments(userId: widget.userId)
    );
  }
}

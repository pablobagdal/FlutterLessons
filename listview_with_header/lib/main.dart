import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Listview example"),
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

ListView _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (i) => i % 6 == 0
          ? HeadingItem("Heading item #$i")
          : MessageItem("Sender #$i", "Message body: $i"));

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];

      if (item is HeadingItem) {
        return ListTile(
          title: Text(
            item.heading,
            style: Theme.of(context).textTheme.headline2,
          ),
        );
      } else if (item is MessageItem) {
        return ListTile(
          title: Text(
            item.sender,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: Text(
            item.body,
            style: Theme.of(context).textTheme.headline3,
          ),
          leading: Icon(
            Icons.no_photography,
            color: Colors.red,
          ),
          trailing: Icon(Icons.arrow_back),
        );
      }
      return Container();
    },
  );
}

abstract class ListItem {}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

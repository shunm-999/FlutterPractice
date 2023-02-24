import 'package:flutter/material.dart';

class ListItem {
  const ListItem({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class StableListView extends StatefulWidget {
  const StableListView({super.key, required this.contentList});

  final List<ListItem> contentList;

  @override
  State<StatefulWidget> createState() => _StableListState();
}

class _StableListState extends State<StableListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> data = widget.contentList
        .map((item) => _menuItem(title: item.title, icon: item.icon))
        .toList();
    return ListView(children: data);
  }

  Widget _menuItem({required String title, required IconData icon}) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          trailing: Icon(icon),
        ),
      ),
      onTap: () {
        print("onTap Called");
      },
    );
  }
}

class InfiniteListView extends StatelessWidget {
  const InfiniteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ"];

    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index >= list.length) {
        list.addAll(["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ"]);
      }
      return _messageItem(list[index]);
    });
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
        }, // 長押し
      ),
    );
  }
}

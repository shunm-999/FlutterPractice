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
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Icon(icon),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
            )
          ],
        ),
      ),
      onTap: () {
        print("onTap Called");
      },
    );
  }
}

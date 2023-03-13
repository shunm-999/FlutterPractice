import 'package:flutter/cupertino.dart';

class PhotoItem {
  const PhotoItem({required this.fileName});

  final String fileName;
}

enum GridViewMode { Count, Extent, Builder }

class PhotoGridView extends StatefulWidget {
  const PhotoGridView({
    super.key,
    required this.photoList,
  });

  final List<PhotoItem> photoList;

  @override
  State<StatefulWidget> createState() => _PhotoGridViewState();
}

class _PhotoGridViewState extends State<PhotoGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: widget.photoList.map((e) {
          return _photoItem(fileName: e.fileName);
        }).toList());
  }

  Widget _photoItem({required String fileName}) {
    final assetsImage = "assets/img/$fileName";
    return Image.asset(
      assetsImage,
      fit: BoxFit.cover,
    );
  }
}

class PhotoGridBuilderView extends StatefulWidget {
  const PhotoGridBuilderView({super.key, required this.photoList});

  final List<PhotoItem> photoList;

  @override
  State<StatefulWidget> createState() => _PhotoGridBuilderViewState();
}

class _PhotoGridBuilderViewState extends State<PhotoGridBuilderView> {
  @override
  Widget build(BuildContext context) {
    var grid = widget.photoList.toList();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
        itemBuilder: (BuildContext context, int index) {
          if (index >= grid.length) {
            grid.addAll(widget.photoList);
          }
          return _photoItem(fileName: grid[index].fileName);
        });
  }

  Widget _photoItem({required String fileName}) {
    final assetsImage = "assets/img/$fileName";
    return Image.asset(
      assetsImage,
      fit: BoxFit.cover,
    );
  }
}

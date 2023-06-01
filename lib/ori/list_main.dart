import 'package:flutter/material.dart';

class MyScrollView extends StatefulWidget {
  const MyScrollView({Key? key}) : super(key: key);

  @override
  _MyScrollViewState createState() => _MyScrollViewState();
}

class _MyScrollViewState extends State<MyScrollView> {
final List<String> items = List.generate(50, (index) => 'Item $index');
final _controller = ScrollController();

@override
Widget build(BuildContext context) {
return Scaffold(
body: GestureDetector(
onVerticalDragUpdate: (details) {
final RenderBox box = context.findRenderObject() as RenderBox;
final scrollDelta = details.primaryDelta!;
final offset = box.size.height + box.size.height * 0.2;

setState(() {
if (scrollDelta.isNegative) {
_controller.jumpTo(
_controller.offset - offset * scrollDelta.abs() / 100.0,
);
} else {
_controller.jumpTo(
_controller.offset + offset * scrollDelta.abs() / 100.0,
);
}
});
},
child: CustomScrollView(
controller: _controller,
slivers: [
SliverAppBar(
title: Text('My List'),
floating: true,
),
SliverList(
delegate: SliverChildBuilderDelegate(
(BuildContext context, int index) {
return ListTile(
title: Text(items[index]),
);
},
childCount: items.length,
),
),
],
),
),
);
}
}

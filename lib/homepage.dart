import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Draggable Scrollable Modal Bottom Sheet'),
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${index + 1}"),
                onTap: _onPressed,
              );
            }));
  }

  void _onPressed() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          snap: true,
          builder: (_, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: 30.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 50,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(title: Text('Item $index'));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Drawer Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: Drawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 报错: Scaffold.of() called with a context that does not contain a Scaffold.
            Scaffold.of(context).openDrawer();
          },
          child: Text("click me"),
        ),
        // 或者用 builder
        // child: Builder(
        //   builder: (BuildContext context) {
        //     return ElevatedButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       child: Text("click me"),
        //     );
        //   },
        // ),
        //   child:  CorrectClickMe(),
      ),
    );
  }
}

class CorrectClickMe extends StatelessWidget {
  const CorrectClickMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: Text("click me"),
    );
  }
}
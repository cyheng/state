import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildStatic(),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AnimateLogo()));
          },
          child: const Text('动画'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const KeyPage()));
          },
          child: const Text('Key'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const DrawerPage()));
          },
          child: const Text('Context'),
        ),

      ],
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildStatic() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // const
          // const
          const StaticLogo(),
        ],
      ),
    );
  }
}

class StaticLogo extends StatelessWidget {
  const StaticLogo({super.key});

  @override
  Widget build(BuildContext context) {
    print("logo build");
    return const FlutterLogo(
      size: 50,
    );
  }
}

class AnimateLogo extends StatefulWidget {
  const AnimateLogo({super.key});

  @override
  State<AnimateLogo> createState() => _AnimateLogoState();
}

class _AnimateLogoState extends State<AnimateLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Animate Logo"),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.141592653589793,
              child: Center(
                  child:
                      // const
                      StaticLogo()),
            );
          },
        ));
  }
}

class KeyPage extends StatefulWidget {
  const KeyPage({super.key});

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Key Page"),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Box(color: Colors.blue),
                Box(color: Colors.red),
                Box(color: Colors.green),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberBox(color: Colors.blue),
                NumberBox(color: Colors.green),
                NumberBox(color: Colors.red),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberBox(key: ValueKey(1), color: Colors.blue),
                NumberBox(key: ValueKey(2), color: Colors.red),
                NumberBox(key: ValueKey(3), color: Colors.green),
                // 当然还有 ObjectKey , UniqueKey ,GlobalKey 就不细说了
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

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
    return   ElevatedButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: Text("click me"),
    );
  }
}


class Box extends StatelessWidget {
  const Box({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

class NumberBox extends StatefulWidget {
  const NumberBox({super.key, required this.color});

  final Color color;

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.color,
        width: 100,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text('$_count'),
        ));
  }
}

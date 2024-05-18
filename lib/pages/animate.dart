

import 'package:flutter/material.dart';

import '../main.dart';

class AnimateLogoPage extends StatefulWidget {
  const AnimateLogoPage({super.key});

  @override
  State<AnimateLogoPage> createState() => _AnimateLogoPageState();
}

class _AnimateLogoPageState extends State<AnimateLogoPage>
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

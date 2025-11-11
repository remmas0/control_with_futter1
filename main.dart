import 'package:flutter/material.dart';

void main() {
  runApp(const TurtleApp());
}

class TurtleApp extends StatefulWidget {
  const TurtleApp({super.key});

  @override
  State<TurtleApp> createState() => _TurtleAppState();
}

class _TurtleAppState extends State<TurtleApp> {
  double x = 0;
  double y = 0;

  void move(double dx, double dy) {
    setState(() {
      x += dx;
      y += dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Turtle Simulation 🐢')),
        body: Stack(
          children: [
            // سلحفاة تتحرك داخل الشاشة
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: MediaQuery.of(context).size.width / 2 + x - 25,
              top: MediaQuery.of(context).size.height / 2 + y - 25,
              child: const Text(
                '🐢',
                style: TextStyle(fontSize: 50),
              ),
            ),
            // أزرار التحكم
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => move(0, -20),
                      child: const Text('⬆ Forward'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => move(-20, 0),
                          child: const Text('⬅ Left'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => move(20, 0),
                          child: const Text('➡ Right'),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => move(0, 20),
                      child: const Text('⬇ Backward'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
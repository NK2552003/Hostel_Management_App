import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class BubblesBackground extends StatefulWidget {
  const BubblesBackground({super.key});

  @override
  _BubblesBackgroundState createState() => _BubblesBackgroundState();
}

class _BubblesBackgroundState extends State<BubblesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> _bubbles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    for (int i = 0; i < 50; i++) {
      _bubbles.add(Bubble.random());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: MediaQuery.of(context).size,
          painter: BubblesPainter(bubbles: _bubbles, animation: _controller),
        );
      },
    );
  }
}

class Bubble {
  Offset position;
  double radius;
  double opacity;
  double velocity;
  Color color;

  Bubble({
    required this.position,
    required this.radius,
    required this.opacity,
    required this.velocity,
    required this.color,
  });

  factory Bubble.random() {
    final random = Random();
    final lightGreenColors = [
      // const Color(0xFFB2FF59),
      Colors.green.shade900, // Light green
      Colors.teal.shade300,
      Colors.lightBlue,
      Colors.lightGreen
    ];
    return Bubble(
      position: Offset(
        random.nextDouble() * 400,
        random.nextDouble() * 800,
      ),
      radius: random.nextDouble() * 20 + 10,
      opacity: random.nextDouble() * 0.5 +
          0.5, // Ensure higher opacity for light colors
      velocity: random.nextDouble() * 0.5 + 0.2,
      color: lightGreenColors[random.nextInt(lightGreenColors.length)],
    );
  }

  void update(Size size) {
    position = Offset(position.dx, position.dy - velocity);
    if (position.dy < -radius) {
      position = Offset(position.dx, size.height + radius);
    }
  }
}

class BubblesPainter extends CustomPainter {
  final List<Bubble> bubbles;
  final Animation<double> animation;

  BubblesPainter({required this.bubbles, required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      final paint = Paint()
        ..color = bubble.color.withOpacity(bubble.opacity)
        ..style = PaintingStyle.stroke;

      bubble.update(size);
      canvas.drawCircle(bubble.position, bubble.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

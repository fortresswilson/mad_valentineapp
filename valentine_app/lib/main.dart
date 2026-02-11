import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(const ValentineApp());

class ValentineApp extends StatelessWidget {
  const ValentineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ValentineHome(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class ValentineHome extends StatefulWidget {
  const ValentineHome({super.key});

  @override
  State<ValentineHome> createState() => _ValentineHomeState();
}

<<<<<<< HEAD
class _ValentineHomeState extends State<ValentineHome>
    with SingleTickerProviderStateMixin {
  final List<String> emojiOptions = ['Sweet Heart', 'Party Heart'];
  String selectedEmoji = 'Sweet Heart';

  late final AnimationController _controller;
  final List<_HeartBubble> _bubbles = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )
      ..addListener(() {
        final now = DateTime.now().millisecondsSinceEpoch;
        _bubbles.removeWhere((b) => now - b.birthMs > 1200);
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spawnBubbles() {
    final now = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < 8; i++) {
      _bubbles.add(
        _HeartBubble(
          birthMs: now,
          dx: (i % 4 - 1.5) * 18.0,
          dy: (i ~/ 4 - 0.5) * 10.0,
          size: 10.0 + (i % 4) * 4.0,
          driftX: (i.isEven ? -1 : 1) * (6.0 + i.toDouble()),
        ),
      );
    }

    setState(() {});
  }
=======
class _ValentineHomeState extends State<ValentineHome> {
  final List<String> emojiOptions = ['Sweet Heart', 'Party Heart'];
  String selectedEmoji = 'Sweet Heart';
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cupid\'s Canvas')),
      body: Column(
        children: [
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: selectedEmoji,
            items: emojiOptions
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
<<<<<<< HEAD
            onChanged: (value) =>
                setState(() => selectedEmoji = value ?? selectedEmoji),
=======
            onChanged: (value) => setState(() => selectedEmoji = value ?? selectedEmoji),
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
<<<<<<< HEAD
              child: GestureDetector(
                onTap: () {
                  if (selectedEmoji == 'Sweet Heart') {
                    _spawnBubbles();
                  }
                },
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: HeartEmojiPainter(
                    type: selectedEmoji,
                    animation: _controller,
                    bubbles: _bubbles,
                  ),
                ),
=======
              child: CustomPaint(
                size: const Size(300, 300),
                painter: HeartEmojiPainter(type: selectedEmoji),
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeartEmojiPainter extends CustomPainter {
<<<<<<< HEAD
  HeartEmojiPainter({
    required this.type,
    required this.animation,
    required this.bubbles,
  }) : super(repaint: animation);

  final String type;
  final Animation<double> animation;
  final List<_HeartBubble> bubbles;
=======
  HeartEmojiPainter({required this.type});
  final String type;
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
<<<<<<< HEAD
    final t = animation.value;
    final s = size.width / 300.0;

    // Background radial gradient
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0, -0.2),
        radius: 1.2,
        colors: [
          Color(0xFFFFE3EC),
          Color(0xFFFF6B8A),
          Color(0xFFD81B60),
        ],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, bgPaint);

    // Heart path
    final heartPath = Path()
      ..moveTo(center.dx, center.dy + 60 * s)
      ..cubicTo(center.dx + 110 * s, center.dy - 10 * s,
          center.dx + 60 * s, center.dy - 120 * s,
          center.dx, center.dy - 40 * s)
      ..cubicTo(center.dx - 60 * s, center.dy - 120 * s,
          center.dx - 110 * s, center.dy - 10 * s,
          center.dx, center.dy + 60 * s)
      ..close();

    // Glow trail
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(1.08);
    canvas.translate(-center.dx, -center.dy);

    final auraPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10 * s
      ..color = const Color(0x80FFFFFF)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
    canvas.drawPath(heartPath, auraPaint);
    canvas.restore();

    // Heart gradient fill
    final heartFill = Paint()
=======

    final rect = Offset.zero & size;
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0.0, -0.3),
        radius: 1.0,
        colors: [
          Color(0xFFFFF1F7),
          Color(0xFFFFB3CC),
          Color(0xFFFF3D7F),
        ],
        stops: [0.0, 0.6, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, bgPaint);

    // Heart base path
    final heartPath = Path()
      ..moveTo(center.dx, center.dy + 60)
      ..cubicTo(center.dx + 110, center.dy - 10, center.dx + 60, center.dy - 120,
          center.dx, center.dy - 40)
      ..cubicTo(center.dx - 60, center.dy - 120, center.dx - 110, center.dy - 10,
          center.dx, center.dy + 60)
      ..close();

    final heartRect = Rect.fromCenter(center: center, width: 260, height: 260);
    final heartPaint = Paint()
      ..style = PaintingStyle.fill
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: type == 'Party Heart'
<<<<<<< HEAD
            ? const [Color(0xFFFFB3C7), Color(0xFFFF4D88), Color(0xFFE91E63)]
            : const [Color(0xFFFF5A7A), Color(0xFFE91E63), Color(0xFFB0003A)],
      ).createShader(Rect.fromCenter(
        center: center,
        width: 240 * s,
        height: 240 * s,
      ));
    canvas.drawPath(heartPath, heartFill);

    // Eyes
    final eyeWhite = Paint()..color = Colors.white;
    final eyeBlack = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(center.dx - 30 * s, center.dy - 10 * s),
        12 * s, eyeWhite);
    canvas.drawCircle(Offset(center.dx + 30 * s, center.dy - 10 * s),
        12 * s, eyeWhite);
    canvas.drawCircle(Offset(center.dx - 30 * s, center.dy - 10 * s),
        5 * s, eyeBlack);
    canvas.drawCircle(Offset(center.dx + 30 * s, center.dy - 10 * s),
        5 * s, eyeBlack);

    // Smile
    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = (type == 'Party Heart' ? 5 : 4) * s;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(center.dx, center.dy + 20 * s),
          radius: (type == 'Party Heart' ? 34 : 26) * s),
      0,
      math.pi,
=======
            ? const [Color(0xFFFFC1D6), Color(0xFFFF3D7F)]
            : const [Color(0xFFFF2D55), Color(0xFFB0003A)],
      ).createShader(heartRect);

    canvas.drawPath(heartPath, heartPaint);

    // Face features
    final eyePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(center.dx - 30, center.dy - 10), 10, eyePaint);
    canvas.drawCircle(Offset(center.dx + 30, center.dy - 10), 10, eyePaint);

    final mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(center.dx, center.dy + 20), radius: 30),
      0,
      3.14,
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95
      false,
      mouthPaint,
    );

<<<<<<< HEAD
    // Sweet blush
    if (type == 'Sweet Heart') {
      final blush = Paint()..color = const Color(0x55FFB6C1);
      canvas.drawCircle(
          Offset(center.dx - 55 * s, center.dy + 8 * s), 10 * s, blush);
      canvas.drawCircle(
          Offset(center.dx + 55 * s, center.dy + 8 * s), 10 * s, blush);
    }

    // Party hat + confetti
    if (type == 'Party Heart') {
      _drawConfetti(canvas, center, s);
    }

    // Sparkles
    _drawSparkles(canvas, center, s, t);

    // Heart bubbles
    if (type == 'Sweet Heart') {
      _drawBubbles(canvas, center, s);
    }
  }

  void _drawConfetti(Canvas canvas, Offset c, double s) {
    final colors = [
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    for (int i = 0; i < 20; i++) {
      final angle = (i / 20) * math.pi * 2;
      final p = Offset(
        c.dx + math.cos(angle) * 130 * s,
        c.dy + math.sin(angle) * 130 * s,
      );

      final paint = Paint()..color = colors[i % colors.length];
      canvas.drawCircle(p, 5 * s, paint);
    }
  }

  void _drawSparkles(Canvas canvas, Offset c, double s, double t) {
  for (int i = 0; i < 8; i++) {
    final angle = (i / 8) * math.pi * 2;
    final p = Offset(
      c.dx + math.cos(angle) * 150 * s,
      c.dy + math.sin(angle) * 150 * s,
    );

    // FIXED: clamp opacity to 0..1 so it never becomes negative
    final rawOpacity = 0.4 + 0.6 * math.sin(t * math.pi * 2);
    final opacity = rawOpacity.clamp(0.0, 1.0);

    final sparkle = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(p.dx - 8 * s, p.dy),
      Offset(p.dx + 8 * s, p.dy),
      sparkle,
    );
    canvas.drawLine(
      Offset(p.dx, p.dy - 8 * s),
      Offset(p.dx, p.dy + 8 * s),
      sparkle,
    );
  }
}

  void _drawBubbles(Canvas canvas, Offset center, double s) {
    final now = DateTime.now().millisecondsSinceEpoch;

    for (final b in bubbles) {
      final age = (now - b.birthMs) / 1200;
      final opacity = (1 - age).clamp(0.0, 1.0);

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withOpacity(opacity);

      final x = center.dx + b.dx + b.driftX * age;
      final y = center.dy - 100 * age;

      canvas.drawCircle(Offset(x, y), b.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _HeartBubble {
  _HeartBubble({
    required this.birthMs,
    required this.dx,
    required this.dy,
    required this.size,
    required this.driftX,
  });

  final int birthMs;
  final double dx;
  final double dy;
  final double size;
  final double driftX;
}
=======
    // Party hat
    if (type == 'Party Heart') {
      final hatPaint = Paint()..color = const Color(0xFFFFD54F);
      final hatPath = Path()
        ..moveTo(center.dx, center.dy - 110)
        ..lineTo(center.dx - 40, center.dy - 40)
        ..lineTo(center.dx + 40, center.dy - 40)
        ..close();
      canvas.drawPath(hatPath, hatPaint);
    }
  }


  @override
  bool shouldRepaint(covariant HeartEmojiPainter oldDelegate) => oldDelegate.type != type;
}
>>>>>>> b4d7b26793af46c305fa720f2b00bb9e99476d95

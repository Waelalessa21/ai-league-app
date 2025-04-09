import 'dart:math';
import 'package:ai_league/common/theme/colors.dart';
import 'package:ai_league/common/theme/styles.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final bool? showText;

  const Loader({super.key, this.showText});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: CustomPaint(
                size: const Size(180, 180),
                painter: CircleLoaderPainter(),
              ),
            ),
            Image.asset(
              "assets/images/ball_logo.png",
              width: 100,
              height: 100,
            ),
          ],
        ),
        if (widget.showText != false) ...[
          const SizedBox(height: 24),
          Text(
            "جاري التحقق من البيانات...",
            style: TextStyles.font24BlackBold.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "يرجى الانتظار قليلاً",
            style: TextStyles.font24BlackBold.copyWith(
              color: AppColors.lightGray,
              fontSize: 16,
            ),
          ),
        ],
      ],
    );
  }
}

class CircleLoaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final innerRadius = size.width / 4.0;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    const dotCount = 8;
    for (int i = 0; i < dotCount; i++) {
      final angle = (2 * pi / dotCount) * i;
      final dx = center.dx + innerRadius * cos(angle);
      final dy = center.dy + innerRadius * sin(angle);
      canvas.drawCircle(Offset(dx, dy), 3.5, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

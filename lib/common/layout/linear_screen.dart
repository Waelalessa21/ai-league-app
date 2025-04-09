import 'package:flutter/material.dart';

class LinearScreen extends StatelessWidget {
  final Widget child;
  final bool withAppBar;
  final String? title;
  final Gradient? gradient;
  final Widget barChild;

  const LinearScreen({
    super.key,
    required this.child,
    this.withAppBar = false,
    this.title,
    this.gradient,
    required this.barChild,
  });

  @override
  Widget build(BuildContext context) {
    final defaultGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFD1F5E1),
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
        Color(0xFFD1F5E1),
      ],
      stops: [
        0.0,
        0.4,
        0.8,
        1,
      ],
    );

    return Scaffold(
      appBar: withAppBar
          ? AppBar(
              title: barChild,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: gradient ?? defaultGradient,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

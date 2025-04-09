import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final bool withAppBar;
  final String? title;

  const AppScreen({
    super.key,
    required this.child,
    this.backgroundImage = 'assets/images/background_image.png',
    this.withAppBar = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: withAppBar
          ? AppBar(
              title: Text(title ?? '',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
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

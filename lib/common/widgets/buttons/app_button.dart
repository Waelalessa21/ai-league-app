import 'package:ai_league/common/theme/colors.dart';
import 'package:flutter/material.dart';

///Custom button to be used in different screens for different text and icon
class AppButton extends StatelessWidget {
  final String text;
  final String imgPath;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double spacing;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.imgPath,
    this.onPressed,
    this.backgroundColor = AppColors.lightGreen,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
    this.spacing = 12.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: spacing),
            Image.asset(
              imgPath,
              color: iconColor,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}

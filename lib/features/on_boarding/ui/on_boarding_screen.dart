import 'package:ai_league/common/helper/extension.dart';
import 'package:ai_league/common/layout/main_screen.dart';
import 'package:ai_league/common/routing/routes.dart';
import 'package:ai_league/common/widgets/buttons/app_button.dart';
import 'package:ai_league/features/on_boarding/ui/widgets/on_boarding_text.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const OnBoardingText(),
          const SizedBox(height: 40),
          AppButton(
            text: "سجل دخولك الان",
            imgPath: "assets/icons/enter.png",
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}

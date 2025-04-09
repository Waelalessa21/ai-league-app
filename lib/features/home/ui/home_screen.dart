import 'package:ai_league/common/helper/extension.dart';
import 'package:ai_league/common/layout/main_screen.dart';
import 'package:ai_league/common/routing/routes.dart';
import 'package:ai_league/common/theme/colors.dart';
import 'package:ai_league/common/widgets/buttons/app_button.dart';
import 'package:ai_league/common/widgets/custom_shapes/info_container.dart';
import 'package:ai_league/features/home/ui/widgets/home_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: HomeText(),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Image.asset(
              "assets/images/Alj.png",
            ),
          ),
          const SizedBox(height: 50),
          const InfoContainer(),
          const SizedBox(height: 20),
          AppButton(
            text: "إبدا التوجيه",
            imgPath: "assets/icons/arrow.png",
            backgroundColor: Colors.white,
            textColor: AppColors.darkGreen,
            iconColor: AppColors.darkGreen,
            onPressed: () {
              context.pushNamed(Routes.modelScreen);
            },
          ),
        ],
      ),
    );
  }
}

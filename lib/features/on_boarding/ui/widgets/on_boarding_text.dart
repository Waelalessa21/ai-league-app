import 'package:ai_league/common/theme/colors.dart';
import 'package:ai_league/common/theme/styles.dart';
import 'package:flutter/material.dart';

///Simple text to be shown in the boarding screen to welcome users
class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("الوصول للأمن يبدأ من عندك",
            style: TextStyles.font24BlackBold.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("استمتع بالرحلة",
            style: TextStyles.font24BlackBold.copyWith(
              color: AppColors.lightGray,
              fontSize: 20,
            )),
      ],
    );
  }
}

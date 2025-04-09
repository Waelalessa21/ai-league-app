import 'package:ai_league/common/theme/colors.dart';
import 'package:ai_league/common/theme/styles.dart';
import 'package:flutter/material.dart';

///Simple text to be shown in the boarding screen to welcome users
class HomeText extends StatelessWidget {
  const HomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("اهلًا وائل",
            style: TextStyles.font24BlackBold.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text("استاد الملك عبدالله",
              style: TextStyles.font24BlackBold.copyWith(
                color: AppColors.lightGray,
                fontSize: 20,
              )),
        ),
      ],
    );
  }
}

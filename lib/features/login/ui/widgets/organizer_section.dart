import 'package:ai_league/features/login/ui/widgets/orgnaizer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgnaizerSection extends StatelessWidget {
  const OrgnaizerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const Opacity(
          opacity: 0.4,
          child: OrganizerForm(),
        ),
        Container(
          padding: EdgeInsets.all(64.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "قريبًا",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

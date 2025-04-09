import 'package:ai_league/common/theme/colors.dart';
import 'package:flutter/material.dart';

void showResultDialog(BuildContext context,
    {required bool success, required int count}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Result",
    pageBuilder: (_, __, ___) => Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                offset: Offset(0, 6),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 500),
                child: Icon(
                  success ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  size: 100,
                  color: success ? AppColors.mainGreen : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                success ? 'المسار متاح!' : 'عدد الأشخاص كبير جداً!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: success ? AppColors.mainGreen : Colors.red.shade800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                success ? 'أستمتع برحلتك' : 'تجنب المسار!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: success ? AppColors.mainGreen : Colors.red.shade600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'عدد الأشخاص: $count',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: success ? AppColors.mainGreen : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    'إغلاق',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, -0.3), end: Offset.zero)
            .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutBack)),
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );
}

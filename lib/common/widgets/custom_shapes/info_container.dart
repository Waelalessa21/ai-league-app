import 'package:ai_league/common/theme/colors.dart';
import 'package:ai_league/common/widgets/custom_shapes/seat_info.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "تفاصيل المقعد",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.mainGreen,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatInfoContainer(
                  title: 'رقم المقعد',
                  desc: 'A5',
                ),
                SeatInfoContainer(
                  title: 'رقم الصف',
                  desc: '23',
                ),
                SeatInfoContainer(
                  title: 'رقم المقعد',
                  desc: '12',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

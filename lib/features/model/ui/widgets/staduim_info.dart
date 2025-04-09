import 'package:ai_league/common/widgets/custom_shapes/seat_info.dart';
import 'package:flutter/material.dart';

class StaduimInfo extends StatelessWidget {
  const StaduimInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SeatInfoContainer(
          title: 'رقم المقعد',
          desc: 'A5',
          isCol: false,
        ),
        SeatInfoContainer(
          title: 'رقم الصف',
          desc: '23',
          isCol: false,
        ),
        SeatInfoContainer(
          title: 'رقم المقعد',
          desc: '12',
          isCol: false,
        ),
      ],
    );
  }
}

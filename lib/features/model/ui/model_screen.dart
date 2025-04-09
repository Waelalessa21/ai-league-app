import 'dart:typed_data';
import 'package:ai_league/common/helper/extension.dart';
import 'package:ai_league/common/layout/linear_screen.dart';
import 'package:ai_league/common/theme/styles.dart';
import 'package:ai_league/common/widgets/buttons/app_button.dart';
import 'package:ai_league/common/widgets/popup/loader.dart';
import 'package:ai_league/common/widgets/popup/message_popup.dart';
import 'package:ai_league/common/widgets/popup/model_popup.dart';
import 'package:ai_league/features/model/ui/widgets/staduim_info.dart';
import 'package:ai_league/features/model/ui/widgets/upload_container.dart';
import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    return LinearScreen(
      withAppBar: true,
      barChild: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "استاد الملك عبدالله الدولي",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      child: Column(
        children: [
          const StaduimInfo(),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "تاكد من المسار قبل تتوجه له",
              style: TextStyles.font18darkGreenBold,
            ),
          ),
          const SizedBox(height: 30),
          UploadFile(
            onFileSelected: (file) {
              setState(() {
                selectedImage = file;
              });
              if (file == null) {
                showToastMessage(
                  context,
                  "لم يتم إدخال اي صور",
                  'assets/icons/mark.png',
                  isError: true,
                );
              }
            },
          ),
          const SizedBox(height: 50),
          AppButton(
              text: "تحليل",
              imgPath: "assets/icons/enter.png",
              onPressed: () async {
                if (selectedImage != null) {
                  showLoadingOverlay(context);
                  Future.delayed(const Duration(seconds: 2), () {
                    context.pop();
                    int peopleCount = 90;
                    showResultDialog(
                      context,
                      success: peopleCount < 100,
                      count: peopleCount,
                    );
                  });
                } else {
                  showToastMessage(
                    context,
                    "يرجى التأكد من إدخال جميع الحقول بشكل صحيح",
                    'assets/icons/mark.png',
                    isError: true,
                  );
                }
              }),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

void showLoadingOverlay(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (BuildContext context) {
      return const Center(
        child: Loader(
          showText: false,
        ),
      );
    },
  );
}

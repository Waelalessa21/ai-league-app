import 'package:ai_league/common/widgets/buttons/form_button.dart';
import 'package:ai_league/common/widgets/custom_shapes/form_container.dart';
import 'package:ai_league/common/widgets/custom_shapes/form_field.dart';
import 'package:ai_league/common/widgets/popup/loader.dart';
import 'package:ai_league/common/widgets/popup/message_popup.dart';
import 'package:flutter/material.dart';

class OrganizerForm extends StatefulWidget {
  const OrganizerForm({super.key});

  @override
  State<OrganizerForm> createState() => OrganizerFormState();
}

class OrganizerFormState extends State<OrganizerForm> {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  void showLoadingOverlay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      },
    );
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      showLoadingOverlay(context);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
        debugPrint("تم التحقق من البيانات بنجاح");
      });
    } else {
      showToastMessage(
        context,
        "يرجى التأكد من إدخال جميع الحقول بشكل صحيح",
        'assets/icons/mark.png',
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          FormContinaer(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomFormField(
                    labelText: 'رقم الهوية',
                    hintText: 'أدخل رقم البطاقة الوطنية',
                    prefixIcon: Icons.wallet,
                    controller: idController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم الهوية';
                      }
                      if (value.length < 10) {
                        return 'رقم الهوية يجب أن يتكون من 10 أرقام على الأقل';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  FormButton(
                    onPressed: submitForm,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ai_league/common/helper/extension.dart';
import 'package:ai_league/common/routing/routes.dart';
import 'package:ai_league/common/widgets/buttons/form_button.dart';
import 'package:ai_league/common/widgets/custom_shapes/form_container.dart';
import 'package:ai_league/common/widgets/custom_shapes/form_field.dart';
import 'package:ai_league/common/widgets/popup/loader.dart';
import 'package:ai_league/common/widgets/popup/message_popup.dart';
import 'package:ai_league/features/login/logic/login_bloc.dart';
import 'package:ai_league/features/login/logic/login_event.dart';
import 'package:ai_league/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => UserFormState();
}

class UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final ticketController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    ticketController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      context.read<VerificationBloc>().add(
            SubmitVerification(
              idController.text,
              ticketController.text,
            ),
          );
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
    return BlocConsumer<VerificationBloc, VerificationState>(
      listener: (context, state) {
        if (state is VerificationLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black.withOpacity(0.4),
            builder: (context) => const Center(child: Loader()),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is VerificationSuccess) {
          context.pushNamed(
            Routes.homeScreen,
            arguments: state.user,
          );
        }

        if (state is VerificationFailure) {
          showToastMessage(
            context,
            "فشل التحقق: ${state.error}",
            'assets/icons/mark.png',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 24),
            FormContinaer(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      labelText: 'رقم الهوية',
                      hintText: '1119295093',
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
                    const SizedBox(height: 24),
                    CustomFormField(
                      labelText: 'رقم التذكرة',
                      hintText: 'TKT-1001',
                      prefixIcon: Icons.stadium_outlined,
                      controller: ticketController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم التذكرة';
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
        );
      },
    );
  }
}

import 'package:ai_league/common/layout/main_screen.dart';
import 'package:ai_league/features/login/data/api_service.dart';
import 'package:ai_league/features/login/logic/login_bloc.dart';
import 'package:ai_league/features/login/ui/widgets/login_tab_bar.dart';
import 'package:ai_league/features/login/ui/widgets/login_text.dart';
import 'package:ai_league/features/login/ui/widgets/organizer_section.dart';
import 'package:ai_league/features/login/ui/widgets/user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/ball_logo.png"),
          const SizedBox(height: 20),
          const LoginText(),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
            child: LoginTabBar(tabController: tabController),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                BlocProvider(
                  create: (_) => VerificationBloc(ApiService()),
                  child: const UserForm(),
                ),
                const OrgnaizerSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

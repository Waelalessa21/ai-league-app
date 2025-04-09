import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_league/ai_app.dart';
import 'package:ai_league/common/routing/app_router.dart';
import 'package:ai_league/features/login/data/api_service.dart';
import 'package:ai_league/features/login/logic/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  runApp(
    BlocProvider(
      create: (_) => VerificationBloc(ApiService()),
      child: AiApp(appRouter: AppRouter()),
    ),
  );
}

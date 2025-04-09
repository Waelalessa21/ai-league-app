import 'package:ai_league/features/login/data/model.dart';
import 'package:ai_league/features/login/logic/login_event.dart';
import 'package:ai_league/features/login/logic/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api_service.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final ApiService apiService;

  VerificationBloc(this.apiService) : super(VerificationInitial()) {
    on<SubmitVerification>((event, emit) async {
      emit(VerificationLoading());
      try {
        final result = await apiService.verify(
          VerifyRequest(
              nationalId: event.nationalId, ticketNumber: event.ticketNumber),
        );
        emit(VerificationSuccess(result.user));
      } catch (e) {
        emit(VerificationFailure(e.toString()));
      }
    });
  }
}

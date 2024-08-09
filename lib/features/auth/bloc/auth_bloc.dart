import 'package:bloc/bloc.dart';
import 'package:dashboard/features/auth/data/models/admin_login_response_model.dart';
import 'package:dashboard/features/auth/data/repositories/auth_repo.dart';
import 'package:dashboard/services/service_fun.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<GetAdminLoginEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: AuthStatus.loading));
      final result = await AuthRepo().adminLogin(event.name, event.password);
      result.fold((left) {
        emit(state.copyWith(authModelStatus: AuthStatus.authFailed));
      }, (right) {
        emit(state.copyWith(
            authModel: right.data, authModelStatus: AuthStatus.authSuccess));
      });
    });
    on<CheckAuthEvent>((event, emit) async {
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        emit(state.copyWith(authModelStatus: AuthStatus.authSuccess));
      } else {
        emit(state.copyWith(authModelStatus: AuthStatus.authFailed));
      }
    });
     on<GetLogoutEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: AuthStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await AuthRepo().getLogout(token);
        result.fold((left) {}, (right) {
          emit(state.copyWith(authModelStatus: AuthStatus.authFailed));
        });
      }
    });
  }
}

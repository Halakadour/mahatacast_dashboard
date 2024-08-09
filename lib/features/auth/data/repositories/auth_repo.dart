
import 'package:dartz/dartz.dart';
import 'package:dashboard/core/api/failures.dart';
import 'package:dashboard/core/api/handling_exception_manager.dart';
import 'package:dashboard/features/auth/data/datasource/auth_datasource.dart';
import 'package:dashboard/features/auth/data/models/admin_login_response_model.dart';
import 'package:dashboard/features/auth/data/models/logout_response_model.dart';

class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, AdminLoginResponseModel>> adminLogin(String name,String password) {
    return wrapHandling(tryCall: () async {
      final result =
          await AuthDataSource().adminLogin(name, password);
      return Right(result);
    });
  }

  Future<Either<Failure, LogoutResponseModel>> getLogout(String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await AuthDataSource().logout(token);
        return Right(result);
      },
    );
  }
}

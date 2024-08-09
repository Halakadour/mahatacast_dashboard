import 'package:dashboard/core/api/post_api.dart';
import 'package:dashboard/core/api/post_api_with_token.dart';
import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/features/auth/data/models/admin_login_response_model.dart';
import 'package:dashboard/features/auth/data/models/logout_response_model.dart';

class AuthDataSource {
  Future<AdminLoginResponseModel> adminLogin(
      String name, String password) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/admin/login"),
      body: ({
        'name': name,
        'password': password,
      }),
      fromJson: adminLoginResponseModelFromJson,
    );
    return await result.call();
  }

  Future<LogoutResponseModel> logout(String token) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/logout"),
        token: token,
        body: ({}),
        fromJson: logoutResponseModelFromJson);
    return await result.call();
  }
}

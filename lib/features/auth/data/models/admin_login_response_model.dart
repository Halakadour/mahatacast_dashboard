
import 'dart:convert';

AdminLoginResponseModel adminLoginResponseModelFromJson(String str) => AdminLoginResponseModel.fromJson(json.decode(str));

String adminLoginResponseModelToJson(AdminLoginResponseModel data) => json.encode(data.toJson());

class AdminLoginResponseModel {
    final int? status;
    final String? msg;
    final LoginModel? data;

    AdminLoginResponseModel({
        this.status,
        this.msg,
        this.data,
    });

    factory AdminLoginResponseModel.fromJson(Map<String, dynamic> json) => AdminLoginResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : LoginModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
    };
}

class LoginModel {
    final String? token;
    final String? name;

    LoginModel({
        this.token,
        this.name,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
    };
}

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    final int? status;
    final String? msg;
    final List<dynamic>? data;

    ResponseModel({
        this.status,
        this.msg,
        this.data,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}

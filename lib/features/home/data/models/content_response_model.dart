
import 'dart:convert';

ContentResponseModel contentResponseModelFromJson(String str) => ContentResponseModel.fromJson(json.decode(str));

String contentResponseModelToJson(ContentResponseModel data) => json.encode(data.toJson());

class ContentResponseModel {
    final int? status;
    final String? msg;
    final List<ContentModel>? data;

    ContentResponseModel({
        this.status,
        this.msg,
        this.data,
    });

    factory ContentResponseModel.fromJson(Map<String, dynamic> json) => ContentResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<ContentModel>.from(json["data"]!.map((x) => ContentModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ContentModel {
    final int? contentId;
    final String? contentName;

    ContentModel({
        this.contentId,
        this.contentName,
    });

    factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        contentId: json["content_id"],
        contentName: json["content_name"],
    );

    Map<String, dynamic> toJson() => {
        "content_id": contentId,
        "content_name": contentName,
    };
}

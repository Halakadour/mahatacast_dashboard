
import 'dart:convert';

import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';

RepotedPodcastResponseModel repotedPodcastResponseModelFromJson(String str) => RepotedPodcastResponseModel.fromJson(json.decode(str));

String repotedPodcastResponseModelToJson(RepotedPodcastResponseModel data) => json.encode(data.toJson());

class RepotedPodcastResponseModel {
    final int? status;
    final String? msg;
    final List<PodcastModel>? data;

    RepotedPodcastResponseModel({
        this.status,
        this.msg,
        this.data,
    });

    factory RepotedPodcastResponseModel.fromJson(Map<String, dynamic> json) => RepotedPodcastResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<PodcastModel>.from(json["data"]!.map((x) => PodcastModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}


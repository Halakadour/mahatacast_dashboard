import 'package:dashboard/core/api/get_api.dart';
import 'package:dashboard/core/api/get_with_token_api.dart';
import 'package:dashboard/core/api/post_api_with_token.dart';
import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/features/home/data/models/content_response_model.dart';
import 'package:dashboard/features/home/data/models/reported_podcast_responce_model.dart';
import 'package:dashboard/features/home/data/models/response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_channel_response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';

class HomeDataSource {
  Future<UnApprovedPodcastResponseModel> showUnApprovedPodcast(
      String token) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/unapproved/podcasts"),
        token: token,
        fromJson: unApprovedPodcastResponseModelFromJson);
    return await result.callRequest();
  }

  Future<RepotedPodcastResponseModel> showRepotedPodcast(String token) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/podcasts/reported"),
        token: token,
        fromJson: repotedPodcastResponseModelFromJson);
    return await result.callRequest();
  }

  Future<ResponseModel> approvePodcast(String token, int podcastId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/approves/podcast/$podcastId"),
        token: token,
        fromJson: responseModelFromJson);
    return await result.callRequest();
  }

  Future<ResponseModel> adminDeletePodcast(String token, int podcastId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/admin/delete/podcast/$podcastId"),
        token: token,
        fromJson: responseModelFromJson);
    return await result.callRequest();
  }

  Future<ResponseModel> createContent(
      String token, List<String> contentList) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/create/contents"),
        token: token,
        body: ({"name": contentList}),
        fromJson: responseModelFromJson);
    return await result.call();
  }

  Future<ContentResponseModel> showContent() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/all/content"),
        fromJson: contentResponseModelFromJson);
    return await result.callRequest();
  }

  Future<UnApprovedChannelResponseModel> showUnApprovedChannel(
      String token) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/unapproved/channels"),
        token: token,
        fromJson: unApprovedChannelResponseModelFromJson);
    return await result.callRequest();
  }

  Future<ResponseModel> approveChannel(String token, int channelId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/approve/channel/$channelId"),
        token: token,
        fromJson: responseModelFromJson);
    return await result.callRequest();
  }

  Future<ResponseModel> adminDeleteChannel(String token, int channelId) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/delete/channel/$channelId"),
        token: token,
        fromJson: responseModelFromJson);
    return await result.callRequest();
  }

  Future<UnApprovedChannelResponseModel> showUnActiveChannel(
      String token) async {
    final result = GetWithTokenApi(
        uri: Uri.parse("$baseUri/api/show/un/active/channels"),
        token: token,
        fromJson: unApprovedChannelResponseModelFromJson);
    return await result.callRequest();
  }
}

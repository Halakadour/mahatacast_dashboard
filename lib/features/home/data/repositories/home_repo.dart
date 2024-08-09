import 'package:dartz/dartz.dart';
import 'package:dashboard/core/api/failures.dart';
import 'package:dashboard/core/api/handling_exception_manager.dart';
import 'package:dashboard/features/home/data/datasource/home_datasource.dart';
import 'package:dashboard/features/home/data/models/content_response_model.dart';
import 'package:dashboard/features/home/data/models/reported_podcast_responce_model.dart';
import 'package:dashboard/features/home/data/models/response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_channel_response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';

class HomeRepo with HandlingExceptionManager {
  Future<Either<Failure, UnApprovedPodcastResponseModel>> showUnApprovedPodcast(
      String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().showUnApprovedPodcast(token);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, RepotedPodcastResponseModel>> showReportedPodcast(
      String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().showRepotedPodcast(token);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, ResponseModel>> approvePodcast(
      String token, int podcastId) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().approvePodcast(token, podcastId);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, ResponseModel>> adminDeletePodcast(
      String token, int podcastId) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await HomeDataSource().adminDeletePodcast(token, podcastId);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, ResponseModel>> createContent(
      String token, List<String> contentList) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().createContent(token, contentList);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, ContentResponseModel>> showContent() {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().showContent();
        return Right(result);
      },
    );
  }

  Future<Either<Failure, UnApprovedChannelResponseModel>> showUnApprovedChannel(
      String token) {
    return wrapHandling(
      tryCall: () async {
        final reult = await HomeDataSource().showUnApprovedChannel(token);
        return Right(reult);
      },
    );
  }

  Future<Either<Failure, ResponseModel>> approveChannel(
      String token, int channelId) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().approveChannel(token, channelId);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, ResponseModel>> adminDeleteChannel(
      String token, int channelId) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await HomeDataSource().adminDeleteChannel(token, channelId);
        return Right(result);
      },
    );
  }

  Future<Either<Failure, UnApprovedChannelResponseModel>> showUnActiveChannel(
      String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource().showUnActiveChannel(token);
        return Right(result);
      },
    );
  }
}

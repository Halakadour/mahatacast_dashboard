import 'package:bloc/bloc.dart';
import 'package:dashboard/features/home/data/models/content_response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_channel_response_model.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';
import 'package:dashboard/features/home/data/repositories/home_repo.dart';
import 'package:dashboard/services/service_fun.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetUnApprovedPodcastListEvent>((event, emit) async {
      emit(state.copyWith(unapprovedPodcastListStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().showUnApprovedPodcast(token);
        result.fold(
            (left) => emit(
                state.copyWith(unapprovedPodcastListStatus: HomeStatus.failed)),
            (right) => emit(state.copyWith(
                unapprovedPodcastList: right.podcastList,
                unapprovedPodcastListStatus: HomeStatus.success)));
      }
    });
    on<GetRepotedPodcastListEvent>((event, emit) async {
      emit(state.copyWith(reportedPodcastListStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().showReportedPodcast(token);
        result.fold(
            (left) => emit(
                state.copyWith(reportedPodcastListStatus: HomeStatus.failed)),
            (right) => emit(state.copyWith(
                reportedPodcastList: right.data,
                reportedPodcastListStatus: HomeStatus.success)));
      }
    });
    on<ApprovePodcastEvent>((event, emit) async {
      emit(state.copyWith(approvedPodcastStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().approvePodcast(token, event.podcastId);
        result.fold(
            (left) =>
                emit(state.copyWith(approvedPodcastStatus: HomeStatus.failed)),
            (right) => emit(
                state.copyWith(approvedPodcastStatus: HomeStatus.success)));
      }
    });
    on<DeletePodcastEvent>((event, emit) async {
      emit(state.copyWith(deletePodcastStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result =
            await HomeRepo().adminDeletePodcast(token, event.podcastId);
        result.fold(
            (left) =>
                emit(state.copyWith(deletePodcastStatus: HomeStatus.failed)),
            (right) =>
                emit(state.copyWith(deletePodcastStatus: HomeStatus.success)));
      }
    });
    on<GetUnApprovedChannelListEvent>((event, emit) async {
      emit(state.copyWith(unapprovedChannelListStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().showUnApprovedChannel(token);
        result.fold(
            (left) => emit(
                state.copyWith(unapprovedChannelListStatus: HomeStatus.failed)),
            (right) => emit(state.copyWith(
                unapprovedChannelList: right.channelList,
                unapprovedChannelListStatus: HomeStatus.success)));
      }
    });
    on<ApproveChannelEvent>((event, emit) async {
      emit(state.copyWith(approvedChannelStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().approveChannel(token, event.channelId);
        result.fold(
            (left) =>
                emit(state.copyWith(approvedChannelStatus: HomeStatus.failed)),
            (right) => emit(
                state.copyWith(approvedChannelStatus: HomeStatus.success)));
      }
    });
    on<DeleteChannelEvent>((event, emit) async {
      emit(state.copyWith(deleteChannelStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result =
            await HomeRepo().adminDeleteChannel(token, event.channelId);
        result.fold(
            (left) =>
                emit(state.copyWith(deleteChannelStatus: HomeStatus.failed)),
            (right) =>
                emit(state.copyWith(deleteChannelStatus: HomeStatus.success)));
      }
    });
    on<CreateContentEvent>((event, emit) async {
      emit(state.copyWith(createContentStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().createContent(token, event.contentList);
        result.fold(
            (left) =>
                emit(state.copyWith(createContentStatus: HomeStatus.failed)),
            (right) =>
                emit(state.copyWith(createContentStatus: HomeStatus.success)));
      }
    });
    on<GetContentEvent>((event, emit) async {
      emit(state.copyWith(contentListStatus: HomeStatus.loading));
      final result = await HomeRepo().showContent();
      result.fold(
          (left) => emit(state.copyWith(contentListStatus: HomeStatus.failed)),
          (right) => emit(state.copyWith(
              contentList: right.data, contentListStatus: HomeStatus.success)));
    });
    on<GetUnActiveChannelListEvent>((event, emit) async {
      emit(state.copyWith(unapprovedChannelListStatus: HomeStatus.loading));
      final String? token = await ServiceFunctions.getUserToken();
      if (token != null) {
        final result = await HomeRepo().showUnActiveChannel(token);
        result.fold(
            (left) => emit(
                state.copyWith(unapprovedChannelListStatus: HomeStatus.failed)),
            (right) => emit(state.copyWith(
                unapprovedChannelList: right.channelList,
                unapprovedChannelListStatus: HomeStatus.success)));
      }
    });
  }
}

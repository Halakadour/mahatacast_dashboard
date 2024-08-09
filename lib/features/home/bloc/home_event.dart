part of 'home_bloc.dart';

class HomeEvent {}

class GetUnApprovedPodcastListEvent extends HomeEvent {}

class GetRepotedPodcastListEvent extends HomeEvent {}

class ApprovePodcastEvent extends HomeEvent {
  int podcastId;
  ApprovePodcastEvent({
    required this.podcastId,
  });
}

class DeletePodcastEvent extends HomeEvent {
  int podcastId;
  DeletePodcastEvent({
    required this.podcastId,
  });
}

class GetUnApprovedChannelListEvent extends HomeEvent {}

class ApproveChannelEvent extends HomeEvent {
  int channelId;
  ApproveChannelEvent({
    required this.channelId,
  });
}

class DeleteChannelEvent extends HomeEvent {
  int channelId;
  DeleteChannelEvent({
    required this.channelId,
  });
}

class CreateContentEvent extends HomeEvent {
  List<String> contentList;
  CreateContentEvent({
    required this.contentList,
  });
}

class GetContentEvent extends HomeEvent {}

class GetUnActiveChannelListEvent extends HomeEvent {}


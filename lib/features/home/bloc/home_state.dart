part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failed }

class HomeState {
  HomeStatus unapprovedPodcastListStatus;
  List<PodcastModel> unapprovedPodcastList;
    HomeStatus reportedPodcastListStatus;
  List<PodcastModel> reportedPodcastList;
  HomeStatus approvedPodcastStatus;
  HomeStatus deletePodcastStatus;
  HomeStatus unapprovedChannelListStatus;
  List<ChannelModel> unapprovedChannelList;
  HomeStatus approvedChannelStatus;
  HomeStatus deleteChannelStatus;
  HomeStatus createContentStatus;
  HomeStatus contentListStatus;
  List<ContentModel> contentList;
  HomeState({
    this.unapprovedPodcastListStatus = HomeStatus.initial,
    this.unapprovedPodcastList = const [],
    this.reportedPodcastListStatus = HomeStatus.initial,
    this.reportedPodcastList = const [],
    this.approvedPodcastStatus = HomeStatus.initial,
    this.deletePodcastStatus = HomeStatus.initial,
    this.unapprovedChannelListStatus = HomeStatus.initial,
    this.unapprovedChannelList = const [],
    this.approvedChannelStatus = HomeStatus.initial,
    this.deleteChannelStatus = HomeStatus.initial,
    this.createContentStatus = HomeStatus.initial,
    this.contentListStatus = HomeStatus.initial,
    this.contentList = const [],
  });

  HomeState copyWith({
    HomeStatus? unapprovedPodcastListStatus,
    List<PodcastModel>? unapprovedPodcastList,
    HomeStatus? reportedPodcastListStatus,
    List<PodcastModel>? reportedPodcastList,
    HomeStatus? approvedPodcastStatus,
    HomeStatus? deletePodcastStatus,
    HomeStatus? unapprovedChannelListStatus,
    List<ChannelModel>? unapprovedChannelList,
    HomeStatus? approvedChannelStatus,
    HomeStatus? deleteChannelStatus,
    HomeStatus? createContentStatus,
    HomeStatus? contentListStatus,
    List<ContentModel>? contentList,
  }) {
    return HomeState(
      unapprovedPodcastListStatus: unapprovedPodcastListStatus ?? this.unapprovedPodcastListStatus,
      unapprovedPodcastList: unapprovedPodcastList ?? this.unapprovedPodcastList,
      reportedPodcastListStatus: reportedPodcastListStatus ?? this.reportedPodcastListStatus,
      reportedPodcastList: reportedPodcastList ?? this.reportedPodcastList,
      approvedPodcastStatus: approvedPodcastStatus ?? this.approvedPodcastStatus,
      deletePodcastStatus: deletePodcastStatus ?? this.deletePodcastStatus,
      unapprovedChannelListStatus: unapprovedChannelListStatus ?? this.unapprovedChannelListStatus,
      unapprovedChannelList: unapprovedChannelList ?? this.unapprovedChannelList,
      approvedChannelStatus: approvedChannelStatus ?? this.approvedChannelStatus,
      deleteChannelStatus: deleteChannelStatus ?? this.deleteChannelStatus,
      createContentStatus: createContentStatus ?? this.createContentStatus,
      contentListStatus: contentListStatus ?? this.contentListStatus,
      contentList: contentList ?? this.contentList,
    );
  }
}

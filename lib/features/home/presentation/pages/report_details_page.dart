import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/delete_podcast.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDetailsPage extends StatelessWidget {
  const ReportDetailsPage({super.key, required this.podcastModel});
  final PodcastModel podcastModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                      width: .7.sw,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              "$assetUri${podcastModel.channelImage}"))),
                ),
                20.verticalSpace,
                Text(
                  "podcast name : ${podcastModel.podcastTitle}",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                10.verticalSpace,
                Text(
                  "podcast duration : ${podcastModel.podcastDuration}",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                10.verticalSpace,
                Text(
                  "podcast size : ${podcastModel.podcastSize!.toStringAsFixed(3)} MB",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                10.verticalSpace,
                Text(
                  "channel name : ${podcastModel.channelName!}",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                10.verticalSpace,
                Text(
                  "channel owner name : ${podcastModel.channelOwnerName!}",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state.deletePodcastStatus == HomeStatus.loading) {
                      BotToast.showLoading();
                    } else if (state.deleteChannelStatus ==
                        HomeStatus.success) {
                      BotToast.closeAllLoading();
                      BotToast.showText(text: "Successfuly deleted");
                      Navigator.pop(context);
                    } else {
                      BotToast.closeAllLoading();
                      BotToast.showText(text: "didn't delete");
                      Navigator.pop(context);
                    }
                  },
                  listenWhen: (previous, current) =>
                      previous.deletePodcastStatus !=
                      current.deletePodcastStatus,
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => DeletePodcastMessage(
                              podcastId: podcastModel.podcastId!),
                        );
                      },
                      child: Text(
                        "delete",
                        style: TextStyle(
                            color: redColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

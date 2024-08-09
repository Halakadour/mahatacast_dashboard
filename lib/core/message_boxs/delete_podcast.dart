import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeletePodcastMessage extends StatelessWidget {
  const DeletePodcastMessage({super.key, required this.podcastId});
  final int podcastId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: .85.sw,
        height: .19.sh,
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
            color: backgoundColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  S.of(context).deletepodcast,
                  style: TextStyle(
                      color: darkGrey,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              25.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).cancel,
                        style: TextStyle(
                            color: darkGrey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      )),
                  BlocListener<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (state.deletePodcastStatus == HomeStatus.loading) {
                        BotToast.showLoading();
                      } else if (state.deleteChannelStatus ==
                          HomeStatus.success) {
                        BotToast.closeAllLoading();
                        BotToast.showText(
                            text: S.of(context).Successfulydeleted);
                        context
                            .read<HomeBloc>()
                            .add(GetUnApprovedPodcastListEvent());
                        Navigator.pop(context);
                      } else {
                        BotToast.closeAllLoading();
                        BotToast.showText(text: S.of(context).didnotdelete);
                        Navigator.pop(context);
                      }
                    },
                    listenWhen: (previous, current) =>
                        previous.deletePodcastStatus !=
                        current.deletePodcastStatus,
                    child: TextButton(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(DeletePodcastEvent(podcastId: podcastId));
                        },
                        child: Text(
                          S.of(context).yes,
                          style: TextStyle(
                              color: purpleColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

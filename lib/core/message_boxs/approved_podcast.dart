import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovedPodcastMessage extends StatelessWidget {
  const ApprovedPodcastMessage({super.key, required this.podcastId});
  final int podcastId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: .88.sw,
        height: .2.sh,
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
            color: backgoundColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            children: [
              Text(
                S.of(context).Areyougoingapporvepodcast,
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
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
                      if (state.approvedPodcastStatus == HomeStatus.loading) {
                        BotToast.showLoading();
                      } else if (state.approvedPodcastStatus ==
                          HomeStatus.success) {
                        BotToast.closeAllLoading();
                        BotToast.showText(
                            text: S.of(context).Successfulyapporved);
                        Navigator.pop(context);
                      } else {
                        BotToast.closeAllLoading();
                        BotToast.showText(text: S.of(context).Successfulyapporved);
                        context
                            .read<HomeBloc>()
                            .add(GetUnApprovedPodcastListEvent());
                        Navigator.pop(context);
                      }
                    },
                    listenWhen: (previous, current) =>
                        previous.approvedPodcastStatus !=
                        current.approvedPodcastStatus,
                    child: TextButton(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(ApprovePodcastEvent(podcastId: podcastId));
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

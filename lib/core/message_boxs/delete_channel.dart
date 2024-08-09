import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteChannelMessage extends StatelessWidget {
  const DeleteChannelMessage(
      {super.key, required this.channelId, required this.active});
  final int channelId;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: .75.sw,
        height: .15.sh,
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 5),
        decoration: BoxDecoration(
            color: backgoundColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            children: [
              Text(
                S.of(context).deletechannel,
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 15.sp,
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
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600),
                      )),
                  BlocListener<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (state.deleteChannelStatus == HomeStatus.loading) {
                        BotToast.showLoading();
                      } else if (state.deleteChannelStatus ==
                          HomeStatus.success) {
                        BotToast.closeAllLoading();
                        BotToast.showText(
                            text: S.of(context).Successfulydeleted);
                        active
                            ? context
                                .read<HomeBloc>()
                                .add(GetUnActiveChannelListEvent())
                            : context
                                .read<HomeBloc>()
                                .add(GetUnApprovedChannelListEvent());
                        Navigator.pop(context);
                      } else {
                        BotToast.closeAllLoading();
                        BotToast.showText(text: S.of(context).didnotdelete);
                        Navigator.pop(context);
                      }
                    },
                    listenWhen: (previous, current) =>
                        previous.deleteChannelStatus !=
                        current.deleteChannelStatus,
                    child: TextButton(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(DeleteChannelEvent(channelId: channelId));
                        },
                        child: Text(
                          S.of(context).yes,
                          style: TextStyle(
                              color: purpleColor,
                              fontSize: 13.sp,
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

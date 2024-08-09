import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/error_message.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/presentation/widgets/channel_home_list.dart';
import 'package:dashboard/features/home/presentation/widgets/unactive_channel_list.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelTabBar extends StatefulWidget {
  const ChannelTabBar({
    super.key,
  });

  @override
  State<ChannelTabBar> createState() => _PodcastTabBarState();
}

class _PodcastTabBarState extends State<ChannelTabBar> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(GetUnApprovedChannelListEvent());
    super.didChangeDependencies();
  }

  int select = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.unapprovedChannelListStatus != current.unapprovedChannelListStatus,
        builder: (context, state) {
          if (state.unapprovedChannelListStatus == HomeStatus.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: purpleColor,
              ),
            );
          } else if (state.unapprovedChannelListStatus == HomeStatus.success) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            select = 1;
                          });
                          context
                              .read<HomeBloc>()
                              .add(GetUnApprovedChannelListEvent());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                              color:
                                  (select == 1) ? Colors.black : lightGreyColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            S.of(context).unapproved,
                            style: TextStyle(
                                color: (select == 1)
                                    ? backgoundColor
                                    : Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            select = 2;
                          });
                          context
                              .read<HomeBloc>()
                              .add(GetUnActiveChannelListEvent());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                              color:
                                  (select == 2) ? Colors.black : lightGreyColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            S.of(context).unactived,
                            style: TextStyle(
                                color: (select == 2)
                                    ? backgoundColor
                                    : Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.unapprovedChannelList.length,
                      itemBuilder: (context, index) => select == 1
                          ? ChannelHomeList(
                              channel: state.unapprovedChannelList[index])
                          : UnActiveChannelHomeList(
                              channel: state.unapprovedChannelList[index]),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: ErrorMessage(
                  onPressed: () => context
                      .read<HomeBloc>()
                      .add(GetUnApprovedChannelListEvent())),
            );
          }
        },
      ),
    );
  }
}

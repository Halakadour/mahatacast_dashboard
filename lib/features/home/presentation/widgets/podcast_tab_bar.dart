import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/error_message.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/presentation/widgets/podcast_home_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodcastTabBar extends StatefulWidget {
  const PodcastTabBar({
    super.key,
  });

  @override
  State<PodcastTabBar> createState() => _PodcastTabBarState();
}

class _PodcastTabBarState extends State<PodcastTabBar> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(GetUnApprovedPodcastListEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.unapprovedPodcastListStatus == HomeStatus.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: purpleColor,
              ),
            );
          } else if (state.unapprovedPodcastListStatus == HomeStatus.success) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.unapprovedPodcastList.length,
                      itemBuilder: (context, index) => PodcastHomeList(
                          podcast: state.unapprovedPodcastList[index]),
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
                    .add(GetUnApprovedPodcastListEvent()),
              ),
            );
          }
        },
      ),
    );
  }
}

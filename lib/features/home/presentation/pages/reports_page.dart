import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/error_message.dart';
import 'package:dashboard/core/widgets/back_button.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/presentation/widgets/report_list.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(GetRepotedPodcastListEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                Text(
                  S.of(context).Reports,
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
          20.verticalSpace,
          Divider(
            color: lightGreyColor,
            height: .7,
          ),
          20.verticalSpace,
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.reportedPodcastListStatus !=
                current.reportedPodcastListStatus,
            builder: (context, state) {
              if (state.reportedPodcastListStatus == HomeStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: purpleColor,
                  ),
                );
              } else if (state.reportedPodcastListStatus ==
                  HomeStatus.success) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.reportedPodcastList.length,
                  itemBuilder: (context, index) => ReportList(
                    podcast: state.reportedPodcastList[index],
                  ),
                ));
              } else {
                return Center(
                  child: ErrorMessage(
                    onPressed: () => context
                        .read<HomeBloc>()
                        .add(GetRepotedPodcastListEvent()),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

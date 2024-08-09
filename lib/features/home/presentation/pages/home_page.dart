import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/presentation/pages/reports_page.dart';
import 'package:dashboard/features/home/presentation/widgets/channel_tab_bar.dart';
import 'package:dashboard/features/home/presentation/widgets/podcast_tab_bar.dart';
import 'package:dashboard/features/home/presentation/widgets/tab_bar.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  //final int contentNum;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void didChangeDependencies() {
    print('changed');
    context.read<HomeBloc>().add(GetUnApprovedPodcastListEvent());
    context.read<HomeBloc>().add(GetUnApprovedChannelListEvent());
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print("Current tab index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).WelcomeAdmin,
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                  ),
                  5.verticalSpace,
                  Text(
                    S.of(context).mahatacastdashboard,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportsPage(),
                    )),
                child: SvgPicture.asset(
                  "assets/icons/library/bill.svg",
                  width: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: .03.sh,
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              HomeTabBar(content: S.of(context).Podcast),
              HomeTabBar(content: S.of(context).Channel)
            ],
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp),
            unselectedLabelStyle: TextStyle(
                color: greyColor, fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [PodcastTabBar(), ChannelTabBar()]))
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

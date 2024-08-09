import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/widgets/bottom_appbar.dart';
import 'package:dashboard/features/home/presentation/pages/home_page.dart';
import 'package:dashboard/features/home/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, _) {
          return Scaffold(
            backgroundColor: backgoundColor,
            body: IndexedStack(index: value, children: const [
              HomePage(),
               SizedBox(),
               SettingPage(),
            ]),
            bottomNavigationBar: CustomBottomAppBar(pageIndex: pageIndex),
          );
        });
  }
}

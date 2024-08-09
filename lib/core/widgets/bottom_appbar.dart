import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/features/home/presentation/pages/create_content_page.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key, required this.pageIndex});
  final ValueNotifier<int> pageIndex;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.pageIndex,
      builder: (context, pageValue, _) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: Colors.black,
              currentIndex: pageValue,
              onTap: (value) {
                switch (value) {
                  case 0:
                    {
                      if (pageValue == 0) {
                        break;
                      } else {
                        widget.pageIndex.value = 0;
                      }
                    }
                    break;
                  case 1:
                    {
                      if (pageValue == 1) {
                        break;
                      } else {
                        widget.pageIndex.value = 1;
                      }
                    }
                    break;
                  case 2:
                    {
                      if (pageValue == 2) {
                        break;
                      } else {
                        widget.pageIndex.value = 2;
                      }
                    }
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/home/home.svg",
                      width: .06.sw,
                      color: pageValue == 0 ? Colors.black : greyColor,
                    ),
                    label: S.of(context).home),
                BottomNavigationBarItem(
                    icon: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateContentPage(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: purpleColor,
                          ),
                          child: Icon(
                            Icons.add,
                            size: .07.sw,
                            color: Colors.white,
                          ),
                        )),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/home/Setting.svg",
                      width: .06.sw,
                      color: pageValue == 2 ? Colors.black : greyColor,
                    ),
                    label: S.of(context).Setting),
              ]),
        );
      },
    );
  }
}

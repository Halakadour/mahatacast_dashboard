import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/localization-provider/localization.dart';
import 'package:dashboard/core/message_boxs/logout_message.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int language = ServiceFunctions.isArabic() ? 2 : 1;
  bool isClicked = true;
  bool hasChannel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Setting,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26.sp),
            ),
            70.verticalSpace,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: greyColor,
                          ),
                          5.horizontalSpace,
                          Text(
                            S.of(context).Language,
                            style: TextStyle(color: lightGreyColor),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: SvgPicture.asset(
                          isClicked
                              ? "assets/icons/home/arrow_down.svg"
                              : "assets/icons/home/arrow_up.svg",
                          color: greyColor,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: !isClicked,
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: language,
                          activeColor: textButtonColor,
                          onChanged: (value) {
                            setState(() {
                              print("$value is english");
                              language = value!;
                            });
                            context
                                .read<LocaleNotifier>()
                                .setLocal(const Locale('en'));
                            ServiceFunctions.setLangauge('en');
                          },
                        ),
                        5.horizontalSpace,
                        Text(
                          S.of(context).English,
                          style: TextStyle(color: lightGreyColor),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !isClicked,
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 2,
                          groupValue: language,
                          activeColor: textButtonColor,
                          onChanged: (value) {
                            setState(() {
                              print("$value is arabic");
                              language = value!;
                            });
                            context
                                .read<LocaleNotifier>()
                                .setLocal(const Locale('ar'));
                            ServiceFunctions.setLangauge('ar');
                          },
                        ),
                        5.horizontalSpace,
                        Text(
                          S.of(context).Arabic,
                          style: TextStyle(color: lightGreyColor),
                        )
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  const Divider(
                    color: Colors.white,
                    thickness: 1.5,
                  ),
                  10.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const LogoutMessage());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.power_settings_new_outlined,
                          color: greyColor,
                        ),
                        5.horizontalSpace,
                        Text(
                          S.of(context).Logout,
                          style: TextStyle(color: lightGreyColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

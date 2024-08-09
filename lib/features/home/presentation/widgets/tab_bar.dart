import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Text(
          content,
          style: TextStyle(
              fontFamily: ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
              fontSize: 13.sp),
        ),
      ),
    );
  }
}

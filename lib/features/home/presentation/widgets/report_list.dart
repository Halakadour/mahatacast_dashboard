import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/delete_podcast.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';
import 'package:dashboard/features/home/presentation/pages/report_details_page.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReportList extends StatelessWidget {
  const ReportList({super.key, required this.podcast});
  final PodcastModel podcast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 80,
                  height: 65,
                  child: FadeInImage(
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset("assets/images/laoding.png"),
                      placeholder:
                          const AssetImage("assets/images/laoding.png"),
                      image: NetworkImage("$assetUri${podcast.channelImage}")),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReportDetailsPage(podcastModel: podcast),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: S.of(context).Thepodcast,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14.sp,
                          fontFamily:
                              ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                        ),
                      ),
                      TextSpan(
                        text: "${podcast.podcastTitle}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).hasreported,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14.sp,
                          fontFamily:
                              ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                        ),
                      ),
                    ])),
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) =>
                      DeletePodcastMessage(podcastId: podcast.podcastId!)),
              child: SvgPicture.asset("assets/icons/library/delete.svg"))
        ],
      ),
    );
  }
}

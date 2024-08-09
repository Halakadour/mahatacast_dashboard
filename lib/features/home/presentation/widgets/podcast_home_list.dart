import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/approved_podcast.dart';
import 'package:dashboard/core/message_boxs/delete_podcast.dart';
import 'package:dashboard/features/home/data/models/unapproved_podcast_response_model.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastHomeList extends StatelessWidget {
  const PodcastHomeList({super.key, required this.podcast});
  final PodcastModel podcast;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          border: Border.all(color: lightestGreyColor, width: 1),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: S.of(context).TheChannel,
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14.sp,
                        fontFamily:
                            ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                      ),
                    ),
                    TextSpan(
                      text: "${podcast.channelName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).requestpermissionpublish,
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
                          fontWeight: FontWeight.w600),
                    ),
                  ])),
                  5.verticalSpace,
                ],
              )
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) =>
                          DeletePodcastMessage(podcastId: podcast.podcastId!)),
                  child: Text(
                    S.of(context).Delete,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
              10.horizontalSpace,
              TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ApprovedPodcastMessage(
                          podcastId: podcast.podcastId!)),
                  child: Text(
                    S.of(context).Approved,
                    style: TextStyle(
                        color: textButtonColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

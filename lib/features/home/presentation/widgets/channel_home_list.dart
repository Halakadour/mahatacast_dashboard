import 'package:dashboard/core/constants/base_uri.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/message_boxs/approved_channel.dart';
import 'package:dashboard/core/message_boxs/delete_channel.dart';
import 'package:dashboard/features/home/data/models/unapproved_channel_response_model.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelHomeList extends StatelessWidget {
  const ChannelHomeList({super.key, required this.channel});
  final ChannelModel channel;
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
                      image: NetworkImage("$assetUri${channel.channelImage}")),
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
                      text: "${channel.channelName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).requestforapproval,
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14.sp,
                        fontFamily:
                            ServiceFunctions.isArabic() ? 'Cairo' : 'Outfit',
                      ),
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
                          DeleteChannelMessage(channelId: channel.id!, active: false,)),
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
                      builder: (context) =>
                          ApprovedChannelMessage(channelId: channel.id!)),
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

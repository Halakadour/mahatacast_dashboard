import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/widgets/main_text_field.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/home/presentation/widgets/content_select_box.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateContentPage extends StatefulWidget {
  const CreateContentPage({super.key});

  @override
  State<CreateContentPage> createState() => _TagPageState();
}

TextEditingController tagController = TextEditingController();

class _TagPageState extends State<CreateContentPage> {
  List<String> createdContents = [];

  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(GetContentEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"))),
        child: Padding(
          padding: EdgeInsets.only(left: 25.sp, right: 25.sp, top: 40.sp),
          child: Column(
            children: [
               Text(
                S.of(context).AddYourcontents,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              5.verticalSpace,
              Text(
                S.of(context).startcreatingcontents,
                style: TextStyle(fontSize: 14, color: greyColor),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: .65.sw,
                    child: Center(
                      child: MainTextField(
                        prefixIcon: null,
                        hint: S.of(context).AddYourcontents,
                        hintColor: lightGreyColor,
                        controller: tagController,
                        fillColor: Colors.white,
                        borderColor: beigeColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: BlocListener<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state.createContentStatus == HomeStatus.loading) {
                          BotToast.showLoading();
                        } else if (state.createContentStatus ==
                            HomeStatus.success) {
                          BotToast.closeAllLoading();
                          BotToast.showText(text: S.of(context).itgoessuccessfully);
                          context.read<HomeBloc>().add(GetContentEvent());
                        } else if (state.createContentStatus ==
                            HomeStatus.failed) {
                          BotToast.closeAllLoading();
                          BotToast.showText(text: S.of(context).Theprocessfailed);
                        }
                      },
                      listenWhen: (previous, current) =>
                          previous.createContentStatus !=
                          current.createContentStatus,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            tagController.text.trim();
                            createdContents = tagController.text.split(" ");
                            createdContents.removeWhere((tag) => tag.isEmpty);
                            print(createdContents);
                            context.read<HomeBloc>().add(CreateContentEvent(
                                contentList: createdContents));
                            print("ok ^ ^");
                          },
                          child:  Text(
                            S.of(context).add,
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.contentListStatus != current.contentListStatus,
                  builder: (context, state) {
                    if (state.contentListStatus == HomeStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else if (state.contentListStatus == HomeStatus.success) {
                      return ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: 5,
                              spacing: 5,
                              children: List.generate(
                                state.contentList.length,
                                (index) {
                                  return ContentSelectBox(
                                    content:
                                        state.contentList[index].contentName!,
                                    boxColor: lightestGreyColor,
                                    fontColor: Colors.black,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text(S.of(context).failed),
                      );
                    }
                  },
                ),
              ),
              20.verticalSpace,
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(1.sw, .09.sh),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).Done,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

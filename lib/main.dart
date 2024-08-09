import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/localization-provider/localization.dart';
import 'package:dashboard/features/auth/bloc/auth_bloc.dart';
import 'package:dashboard/features/home/bloc/home_bloc.dart';
import 'package:dashboard/features/intro/pages/splash_page.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc(),
    ),
    BlocProvider(
      create: (context) => HomeBloc(),
    ),
    Provider<LocaleNotifier>(
      create: (context) => LocaleNotifier(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => ChangeNotifierProvider(
        create: (context) => LocaleNotifier(),
        builder: (context, child) => MaterialApp(
          locale: Provider.of<LocaleNotifier>(context).local,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          theme: ThemeData(
              scaffoldBackgroundColor: backgoundColor,
              fontFamily: Provider.of<LocaleNotifier>(context).isArabic
                  ? 'Cairo'
                  : 'Outfit'),
          home: const SplashPage(),
        ),
      ),
    );
  }
}

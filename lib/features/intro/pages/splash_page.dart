import 'package:avatar_glow/avatar_glow.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/localization-provider/localization.dart';
import 'package:dashboard/features/auth/bloc/auth_bloc.dart';
import 'package:dashboard/features/auth/presentation/pages/login_page.dart';
import 'package:dashboard/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 4), () {
      context.read<AuthBloc>().add(CheckAuthEvent());
      context.read<LocaleNotifier>().initLocal();

    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state.authModelStatus);
        if (state.authModelStatus == AuthStatus.authFailed) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
        } else if (state.authModelStatus == AuthStatus.authSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ));
        }
      },
      listenWhen: (previous, current) {
        return previous.authModelStatus != current.authModelStatus;
      },
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              animate: true,
              glowColor: purpleColor,
              glowRadiusFactor: .5,
              curve: Curves.bounceInOut,
              child: Image.asset(
                "assets/images/logo.png",
                width: 130,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        )),
      ),
    );
  }
}

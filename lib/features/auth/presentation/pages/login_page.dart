import 'package:bot_toast/bot_toast.dart';
import 'package:dashboard/core/constants/colors.dart';
import 'package:dashboard/core/widgets/main_text_field.dart';
import 'package:dashboard/features/auth/bloc/auth_bloc.dart';
import 'package:dashboard/features/main/main_page.dart';
import 'package:dashboard/generated/l10n.dart';
import 'package:dashboard/services/service_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) async {
        if (state.authModelStatus == AuthStatus.loading) {
          BotToast.showLoading(clickClose: false);
        } else if (state.authModelStatus == AuthStatus.authSuccess) {
          BotToast.closeAllLoading();
          await ServiceFunctions.setUserToken(state.authModel!.token!);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        } else if (state.authModelStatus == AuthStatus.authFailed) {
          BotToast.closeAllLoading();
          BotToast.showText(text: S.of(context).tryAgain);
        }
      },
      listenWhen: (previous, current) {
        return previous.authModelStatus != current.authModelStatus;
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset('assets/images/background.png'),
              Padding(
                padding:
                    EdgeInsets.only(top: .12.sh, left: .08.sw, right: .08.sw),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).loginTitle,
                            style: TextStyle(
                                fontSize: 36.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: .02.sh),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            MainTextField(
                              controller: nameController,
                              validator: (email) {
                                if (email != null) {
                                  return null;
                                } else {
                                  return S.of(context).addvalidname;
                                }
                              },
                              height: 150,
                              fillColor: Colors.white,
                              borderColor: beigeColor,
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: beigeColor,
                                    size: 25,
                                  )),
                              hint: S.of(context).name,
                              hintColor: beigeColor,
                            ),
                            const SizedBox(height: 30),
                            MainTextField(
                              controller: passwordController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return S.of(context).addvaildpassword;
                                }
                                return null;
                              },
                              height: 100,
                              fillColor: Colors.white,
                              borderColor: beigeColor,
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Icon(Icons.lock_outline,
                                      color: beigeColor, size: 26)),
                              hint: S.of(context).password,
                              hintColor: beigeColor,
                              counterText: '',
                              isPassword: _obscured,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggleObscured,
                                  child: Icon(
                                    _obscured
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    color: beigeColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: .1.sh),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    fixedSize: Size(1.sw, .075.sh),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17))),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                        GetAdminLoginEvent(
                                            name: nameController.text,
                                            password: passwordController.text));
                                  }
                                },
                                child: Text(
                                  S.of(context).Login,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

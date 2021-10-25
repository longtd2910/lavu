import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavu/core/util/text_style.dart';
import 'package:lavu/core/widgets/input_field.dart';
import 'package:lavu/features/login/presentation/widgets/login_button_content.dart';
import 'package:lavu/features/login/presentation/widgets/login_view.dart';
import '../bloc/login_bloc.dart';

import '../../../../di.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(context),
    );
  }

  void dispatchLogin() {}

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    final double viewHeight = MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: SafeArea(
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height - viewHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 24, top: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12, bottom: 24),
                        child: const Text(
                          'Login',
                          style: ButlerHeading1(color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          children: [
                            CustomInputField(
                              label: 'Email',
                              isObscure: false,
                              inputType: TextInputType.emailAddress,
                              controller: emailInputController,
                            ),
                            CustomInputField(
                              label: 'Password',
                              isObscure: true,
                              inputType: TextInputType.visiblePassword,
                              controller: passwordInputController,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 48,
                              margin: const EdgeInsets.only(bottom: 24),
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: PoppinsBody1(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 44,
                        width: 234,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A0A0A),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(GetUserForLoginAction(
                              username: emailInputController.text,
                              password: passwordInputController.text,
                            ));
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoaded) {
                                return const LoginButtonLoaded();
                              }
                              if (state is LoginError) {
                                const AlertDialog();
                              }
                              if (state is LoginLoading) {
                                return const LoginButtonLoading();
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Don't have any account? Sign up",
                            style: PoppinsBody1(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

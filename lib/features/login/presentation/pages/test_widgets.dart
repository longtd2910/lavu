import 'package:flutter/material.dart';
import 'package:lavu/core/widgets/input_field.dart';
import 'package:lavu/core/util/text_style.dart';

class LoginPageTest extends StatefulWidget {
  const LoginPageTest({Key? key}) : super(key: key);

  @override
  _LoginPageTestState createState() => _LoginPageTestState();
}

class _LoginPageTestState extends State<LoginPageTest> {
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
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
                            color: Color(0xFF0A0A0A),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Login', style: PoppinsButton(color: Color(0xFF95AE45))),
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
      ),
    );
  }
}

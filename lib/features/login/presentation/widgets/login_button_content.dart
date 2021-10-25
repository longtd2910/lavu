import 'package:flutter/material.dart';
import 'package:lavu/core/util/text_style.dart';

class LoginButtonLoaded extends StatefulWidget {
  const LoginButtonLoaded({Key? key}) : super(key: key);

  @override
  _LoginButtonLoadedState createState() => _LoginButtonLoadedState();
}

class _LoginButtonLoadedState extends State<LoginButtonLoaded> {
  @override
  Widget build(BuildContext context) {
    return const Text('Login', style: PoppinsButton(color: Color(0xFF95AE45)));
  }
}

class LoginButtonLoading extends StatefulWidget {
  const LoginButtonLoading({Key? key}) : super(key: key);

  @override
  _LoginButtonLoadingState createState() => _LoginButtonLoadingState();
}

class _LoginButtonLoadingState extends State<LoginButtonLoading> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Color(0xFF95AE45),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lavu/di.dart';
import 'package:lavu/features/login/presentation/pages/login_page.dart';
import 'package:lavu/features/login/presentation/pages/test_widgets.dart';
import 'core/widgets/input_field.dart';
import 'welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/auth/login.dart';
import 'ui/auth/register.dart';
import 'ui/auth/security_auth.dart';
import 'ui/auth/forgot_password.dart';
import 'ui/main_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const UzBankApp());
}

class UzBankApp extends StatelessWidget {
  const UzBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UzBank Mobile',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFFF5722),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto', 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/forgot': (context) => const ForgotPassword(),
        '/security': (context) => const SecurityAuth(),
        '/main': (context) => const MainWrapper(),
      },
    );
  }
}
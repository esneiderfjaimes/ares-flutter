import 'package:ares/firebase_options.dart';
import 'package:ares/screens/google_sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import 'blocs/google_sign_in/google_sign_in_bloc.dart';
import 'locator.dart';

Logger logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  logger.i('App started');

  WidgetsFlutterBinding.ensureInitialized();

  logger.i('Loading env');
  await dotenv.load(fileName: 'assets/env/.env');

  logger.i('Initializing Firebase');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 8080);

  logger.i('Setting up locator');
  setupLocator();

  logger.i('Running app');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => locator<GoogleSignInBloc>(),
        child: const GoogleSignInPage(),
      ),
    );
  }
}

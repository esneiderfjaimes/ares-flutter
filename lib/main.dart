import 'package:ares/screens/google_sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/google_sign_in/google_sign_in_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCmWB7Y7VLzNLOOki1pr5w_yxeBoQOsQJI",
      projectId: "ares-by-nei",
      messagingSenderId: "1014252413822",
      appId: "1:1014252413822:web:46869a991e0a2843c0c92f",
    ),
  );

  // Ideal time to initialize
 // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  setupLocator();

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

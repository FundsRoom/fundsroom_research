import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FundsroomApp());
}

class FundsroomApp extends StatelessWidget {
  const FundsroomApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fundsroom Research',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(43, 150, 111, 1),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(43, 150, 111, 1),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      );
}

import 'package:examen/pages/add_auto.dart';
import 'package:examen/pages/add_gasto.dart';
import 'package:examen/pages/add_name_page.dart';
import 'package:examen/pages/edit_name_page.dart';
//import 'package:examen/pages/home_page.dart';
import 'package:examen/pages/home.dart';
import 'package:examen/pages/loading.dart';
import 'package:examen/pages/login.dart';
import 'package:examen/pages/product_detail.dart';
import 'package:examen/pages/profile.dart';
import 'package:examen/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get auto => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/add': (context) => const AddNamePage(),
        '/edit': (context) => const EditNamePage(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/perfil': (context) => Perfil(),
        '/home': (context) => const Home(),
        '/addGasto': (context) => const AddGasto(),
        '/loading': (context) => LoadingView(),
        '/addAuto': (context) => const AddAuto(),
      },
    );
  }
}

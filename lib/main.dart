import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendor/provider/product_provider.dart';
import 'package:multivendor/vendor/views/screens/main_vendor_screen.dart';
import 'package:multivendor/views/auth/login_screen.dart';
import 'package:multivendor/views/auth/register_screen.dart';
import 'package:multivendor/views/main_screen.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_){
        return ProductProvider();
      })
    ],
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Typpett',

        primarySwatch: Colors.blue,
      ),
      home: const MainVendorScreen(),
      builder: EasyLoading.init(),
    );
  }
}


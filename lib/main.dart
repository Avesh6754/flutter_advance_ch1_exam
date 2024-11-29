import 'package:flutter/material.dart';
import 'package:flutter_advance_ch1_exam/provider/HomeProvider.dart';
import 'package:flutter_advance_ch1_exam/views/bookMark.dart';
import 'package:flutter_advance_ch1_exam/views/detailsPage.dart';
import 'package:flutter_advance_ch1_exam/views/homepage.dart';
import 'package:flutter_advance_ch1_exam/views/splashpage.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Homeprovider(),
      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>SplashScreen(),
          '/home':(context)=>Homepage(),
          '/fav':(context)=>Bookmark(),
          '/detail':(context)=>Detailspage(),
        },

      ),
    );
  }
}

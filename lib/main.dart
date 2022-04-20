import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/app_cubit/app_cubit.dart';
import 'package:news_app/app_cubit/app_status.dart';
import 'package:news_app/layout/layout.news_app/news_app.layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();// بيقرأ ال init اول ما يفتح التطبيق
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark??false));
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AppCubit()..changeMode(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppSates>(
        listener: (context, state) {},
        builder: (context,state){
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
          color: Colors.black,
          ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: Colors.white,
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          ),
          ),
          ),
          darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: HexColor('333739'),
          appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: HexColor('333739'),
          elevation: 0.0,
          titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
          color: Colors.white,
          ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: HexColor('333739'),
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          ),
          ),
          ),
            themeMode:AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
             // NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsApp(),
          );
        },
      ),
      );


  }
}



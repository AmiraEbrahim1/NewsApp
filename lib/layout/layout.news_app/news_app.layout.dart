import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_cubit/app_cubit.dart';
import 'package:news_app/layout/layout.news_app/cubit/cubit.dart';
import 'package:news_app/layout/layout.news_app/cubit/states.dart';

import '../../network/remote/dio.dart';
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBuisness()..getSports()..getScience(),//???
      child: BlocConsumer<NewsCubit,NewsStates>(//???
        listener: (context, state){
        }  ,
        builder:(context,state){
          var cubit =NewsCubit.get(context);//???
          return  Scaffold(
            appBar: AppBar(
              title:  const Text('News App'),
              actions: [
                Icon(Icons.search_sharp),
                IconButton(
                   onPressed:(){
                     AppCubit.get(context).changeMode();
                   },
                  icon:Icon(Icons.brightness_4_outlined ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems
              ,
              currentIndex:cubit.currentindex ,
              onTap:(index){
                cubit.change(index);
              } ,
            ),
            body: cubit.screens[cubit.currentindex],
          );
        } ,

      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/layout.news_app/cubit/states.dart';
import 'package:news_app/modules/modules/business/business_screen.dart';
import 'package:news_app/modules/modules/science/science_screen.dart';
import 'package:news_app/modules/modules/setting/setting_screen.dart';
import 'package:news_app/modules/modules/sport/sport.dart';

import '../../../network/remote/dio.dart';



class NewsCubit extends Cubit<NewsStates>{

  NewsCubit():super(InitialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);//???
  int currentindex=0;
  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  List<BottomNavigationBarItem> bottomItems= const
    [
       BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'business',
       ),
       BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'sports',
       ),
       BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'science',
       ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'setting',
      ),
    ];
  List <Widget> screens= [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen()
  ];
  void change(int index){
     currentindex=index;
     if(index==1){
       getSports();
     }
     emit(BottomNavBarStates());
  }


   void getBuisness(){
emit(GetBusinessLoadingStates());
     if(business.length==0){
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country':'de',
             'category':'business',
             'apiKey':'cb72979f82f040e9a3096e42b525821e',
           }
       ).then((value) {
         business=value.data['articles'];
         print(business[0]['title']);
         emit(GetBusinessSuccessStates());
       }).catchError((error){
         print(error.toString());
         emit(GetBusinessErrorStates(error.toString()));
       })
       ;
     }
     else{
       emit(GetBusinessSuccessStates());
     }

   }
  void getScience(){
    emit(GetScienceLoadingStates());
   if(science.length==0){
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'de',
           'category':'science',
           'apiKey':'cb72979f82f040e9a3096e42b525821e',
         }
     ).then((value) {
       science=value.data['articles'];
       print(science[0]['title']);
       emit(GetScienceSuccessStates());
     }).catchError((error){
       print(error.toString());
       emit(GetScienceErrorStates(error.toString()));
     })
     ;
   }else
     {
       emit(GetScienceSuccessStates());
     }

  }
  void getSports(){
    emit(GetSportsLoadingStates());
    if(sports.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'de',
            'category':'sports',
            'apiKey':'cb72979f82f040e9a3096e42b525821e',
          }
      ).then((value) {
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(GetSportsSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(GetSportsErrorStates(error.toString()));
      })
      ;
    }
else{
      emit(GetSportsSuccessStates());
    }
  }

}
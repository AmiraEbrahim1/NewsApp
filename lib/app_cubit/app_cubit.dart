import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_cubit/app_status.dart';
import 'package:news_app/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppSates>
{
  AppCubit():super(AppInitState());
  static AppCubit get(context) =>BlocProvider.of(context);

  bool isDark=false;
  void changeMode({

  bool? fromShared
}){
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
      {
        isDark = !isDark;
        CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {//لي .then
          emit(AppChangeModeState());
        });
      }
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/cache/cache_helper.dart';
import 'package:new_app/shared/cubit/states.dart';
import 'package:new_app/shared/dio/dio_helper.dart';

enum categoryType {
  business,
  sport,
  science,
}

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static const url = 'v2/top-headlines';
  // static const apiKey = '31798a71e12449ec9d939dbd3ee90880';
  static const apiKey = '0c53ea8f38574a78a0cd2817d14f46aa';

  static AppCubit object(context) => BlocProvider.of(context);

  bool isDarkMode = false;
  changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDarkMode = fromShared;
      emit(ChangeAppMode());
    } else {
      isDarkMode = !isDarkMode;
      CacheHelper.putData(key: 'darkMode', value: isDarkMode).then((value) {
        emit(ChangeAppMode());
      });
    }
  }

  List allNews = [], science = [], business = [], sport = [], search = [];

  getData({String? category}) async {
    await DioHelper.get(
      url,
      {
        'country': 'eg',
        'category': category,
        'apiKey': apiKey,
      },
    ).then((value) {
      emit(GetBusinessLoadingState());
      if (category == 'business') {
        emit(GetBusinessLoadingState());
        business = value.data['articles'];
        emit(GetBusinessSuccessState());
        print(business);
      } else if (category == 'sport') {
        emit(GetSportsLoadingState());
        sport = value.data['articles'];
        emit(GetSportSuccessState());
        print(sport);
      } else if (category == 'science') {
        emit(GetScienceLoadingState());

        science = value.data['articles'];
        emit(GetScienceSuccessState());
        print(science);
      } else {
        emit(GetAllNewsLoadingState());

        allNews = value.data['articles'];
        emit(GetAllNewsSuccessState());
        print(allNews);
      }
    }).catchError((error) {
      if (category == 'sport') {
        print(error.toString());
        emit(GetSportErrorState());
      }
      if (category == 'business') {
        print(error.toString());
        emit(GetBusinessErrorState());
      }
      if (category == 'science') {
        print(error.toString());
        emit(GetScienceErrorState());
      } else {
        print(error.toString());
        emit(GetAllNewsErrorState());
      }
    });
  }

  void getSearch({required String value}) async {
    emit(GetSearchLoadingState());
    search = [];

    DioHelper.get(
      'v2/everything',
      {
        'q': value,
        'apiKey': apiKey,
      },
    ).then(
      (value) {
        search = value.data['articles'];
        emit(GetSearchSuccessState());
      },
    ).catchError((onError) {
      print(onError.toString());
      emit(GetSearchErrorState());
    });
  }

  bool isProgress = true;
  changeProgress(int index) {}
}

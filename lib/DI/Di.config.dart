// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Data/dataSource/ArticlesDao.dart' as _i189;
import '../Data/dataSource/SourcesDao.dart' as _i883;
import '../Data/dataSource_imp/ArticlesApiDaoImp.dart' as _i290;
import '../Data/dataSource_imp/SourcesApiDaoImp.dart' as _i1040;
import '../Data/respository_imp/articlesRepoImp.dart' as _i994;
import '../Data/respository_imp/sourcesRepoImp.dart' as _i843;
import '../features/home/Widgets/Articles_widget/articlesViewModel.dart'
    as _i501;
import '../features/home/Widgets/Category_Details_Widget/category_details_widget.dart'
    as _i985;
import '../Remote/api_manager.dart' as _i759;
import '../repository/articlesRepo.dart' as _i808;
import '../repository/sourcesRepo.dart' as _i942;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i759.ApiManager>(() => _i759.ApiManager());
    gh.factory<_i985.CategoryDetailsWidget>(() => _i985.CategoryDetailsWidget(
          key: gh<_i409.Key>(),
          category: gh<String>(),
        ));
    gh.factory<_i189.ArticlesDao>(
        () => _i290.ArticlesApiDaoImp(gh<_i759.ApiManager>()));
    gh.factory<_i808.ArticlesRepo>(
        () => _i994.ArticlesRepoImp(gh<_i189.ArticlesDao>()));
    gh.factory<_i883.SourcesDao>(
        () => _i1040.SourcesApiDaoImp(gh<_i759.ApiManager>()));
    gh.factory<_i942.SourcesRepo>(
        () => _i843.SourcesRepoImp(gh<_i883.SourcesDao>()));
    gh.factory<_i501.ArticlesViewModel>(
        () => _i501.ArticlesViewModel(gh<_i808.ArticlesRepo>()));
    return this;
  }
}

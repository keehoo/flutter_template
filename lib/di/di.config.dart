// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/data/data_sources/remote_data_source.dart'
    as _i5;
import 'package:clean_architecture/data/repositories/pictures_repository_impl.dart'
    as _i7;
import 'package:clean_architecture/data/services/rest_client.dart' as _i4;
import 'package:clean_architecture/domain/repositories/picture_repository.dart'
    as _i6;
import 'package:clean_architecture/domain/use_cases/get_pictures_usecase.dart'
    as _i8;
import 'package:clean_architecture/view/cubits/home_page_navigation_cubit.dart'
    as _i3;
import 'package:clean_architecture/view/cubits/pictures_cubit.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factoryParam<_i3.HomePageNavigationCubit, _i3.OnLocationChanged,
        dynamic>((
      onLocationChanged,
      _,
    ) =>
        _i3.HomePageNavigationCubit(onLocationChanged));
    gh.singleton<_i4.RestClient>(_i4.RestClient.create());
    gh.singleton<_i5.RemoteDataSource>(
        _i5.RemoteDataSourceImpl(gh<_i4.RestClient>()));
    gh.singleton<_i6.PicturesRepository>(
        _i7.PictureResitoryImpl(gh<_i5.RemoteDataSource>()));
    gh.factory<_i8.GetPictures>(
        () => _i8.GetPictures(gh<_i6.PicturesRepository>()));
    gh.factory<_i9.PicturesCubit>(
        () => _i9.PicturesCubit(gh<_i8.GetPictures>()));
    return this;
  }
}

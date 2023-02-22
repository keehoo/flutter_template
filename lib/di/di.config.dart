// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/data/data_sources/remote_data_source.dart'
    as _i4;
import 'package:clean_architecture/data/repositories/pictures_repository_impl.dart'
    as _i6;
import 'package:clean_architecture/data/services/rest_client.dart' as _i3;
import 'package:clean_architecture/domain/repositories/picture_repository.dart'
    as _i5;
import 'package:clean_architecture/domain/use_cases/get_pictures_usecase.dart'
    as _i7;
import 'package:clean_architecture/view/cubits/pictures_cubit.dart' as _i8;
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
    gh.singleton<_i3.RestClient>(_i3.RestClient.create());
    gh.singleton<_i4.RemoteDataSource>(
        _i4.RemoteDataSourceImpl(gh<_i3.RestClient>()));
    gh.singleton<_i5.PicturesRepository>(
        _i6.PictureResitoryImpl(gh<_i4.RemoteDataSource>()));
    gh.factory<_i7.GetPictures>(
        () => _i7.GetPictures(gh<_i5.PicturesRepository>()));
    gh.factory<_i8.PicturesCubit>(
        () => _i8.PicturesCubit(gh<_i7.GetPictures>()));
    return this;
  }
}

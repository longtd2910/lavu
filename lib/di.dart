import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lavu/features/token_auth/data/datasource/token_auth_local_data_source.dart';
import 'package:lavu/features/token_auth/data/datasource/token_auth_remote_data_source.dart';
import 'package:lavu/features/token_auth/data/repositories/token_auth_repo_imp.dart';
import 'package:lavu/features/token_auth/domain/repositories/token_auth_repository.dart';
import 'core/util/network.dart';
import 'features/login/data/datasources/login_local_data_source.dart';
import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(
    () => LoginBloc(
      login: sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton<Login>(() => Login(sl()));

  //Repo
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImp(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TokenAuthRepositoryImpl>(() => TokenAuthRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //Data source
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSource(tokenAuthRepositoryImpl: sl(), dio: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton<TokenAuthLocalDataSource>(() => TokenAuthLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<TokenAuthRemoteDataSource>(() => TokenAuthRemoteDataSourceImpl(dio: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp());
  //External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
}

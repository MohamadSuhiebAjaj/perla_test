import 'package:get_it/get_it.dart';
import 'package:perla_test/modules/authentication/Presentation/controllers/register_bloc/register_bloc.dart';
import 'package:perla_test/modules/authentication/data/data_source/authentication_data_source.dart';
import 'package:perla_test/modules/authentication/data/data_source/base_authentication_data_source.dart';
import 'package:perla_test/modules/authentication/data/repository/authentication_repository.dart';
import 'package:perla_test/modules/authentication/domain/repository/base_authentication_repository.dart';
import 'package:perla_test/modules/authentication/domain/usecases/login_usecase.dart';
import 'package:perla_test/modules/authentication/domain/usecases/register_usecase.dart';
import 'package:perla_test/modules/home/Presentation/controllers/bloc/home_bloc.dart';
import 'package:perla_test/modules/home/data/data_source/base_home_data_source.dart';
import 'package:perla_test/modules/home/data/data_source/home_data_source.dart';
import 'package:perla_test/modules/home/data/repository/home_repository.dart';
import 'package:perla_test/modules/home/domain/repository/base_home_repository.dart';
import 'package:perla_test/modules/home/domain/usecases/delete_note_usecase.dart';
import 'package:perla_test/modules/home/domain/usecases/edit_note_usecase.dart';
import 'package:perla_test/modules/home/domain/usecases/get_all_notes_usecase.dart';

import '../../modules/authentication/Presentation/controllers/login_bloc/login_bloc.dart';
import '../../modules/home/domain/usecases/add_note_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // BLOCS
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl()));

    // USE CASES
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => GetAllNoteUseCase(sl()));
    sl.registerLazySingleton(() => DeleteNoteUseCase(sl()));
    sl.registerLazySingleton(() => EditNoteUsecase(sl()));
    sl.registerLazySingleton(() => AddNoteUseCase(sl()));

    // REPOSITORYS
    sl.registerLazySingleton<BaseAuthenticationRepository>(
        () => AuthenticationRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    // DATA SOURCES
    sl.registerLazySingleton<BaseAuthenticationDataSource>(
        () => AuthenticationDataSource());
    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource());
  }
}

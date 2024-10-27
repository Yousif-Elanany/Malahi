import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/features/packs/data/data_sources/remote_data_source.dart';
import 'package:malahi_app/features/packs/data/repositories/pack_repository_impl.dart';
import 'package:malahi_app/features/packs/domain/repositories/packs_repository.dart';
import 'package:malahi_app/features/packs/domain/usecases/get_packs_usecase.dart';
import 'package:malahi_app/features/packs/domain/usecases/get_categories_usecase.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_cubit.dart';

class PackInjection {
  static final PackInjection _instance = PackInjection._internal();

  factory PackInjection() {
    return _instance;
  }

  PackInjection._internal();

  final Dio _dio = Dio(); // Initialize Dio for HTTP requests

  // Initialize data sources, repositories, and use cases
  late final RemotePackDataSource _remotePackDataSource =
      RemotePackDataSource(_dio);

  late final PacksRepository _packsRepository =
      PackRepositoryImpl(_remotePackDataSource);

  late final GetPacksUseCase _getPacksUseCase =
      GetPacksUseCase(_packsRepository);

  late final GetCategoriesUseCase _getCategoriesUseCase =
      GetCategoriesUseCase(_packsRepository);

  // Provide the PacksCubit with necessary dependencies
  BlocProvider<PacksCubit> get packsCubit {
    return BlocProvider<PacksCubit>(
      create: (context) => PacksCubit(
        getPacksUseCase: _getPacksUseCase,
        getCategoriesUseCase: _getCategoriesUseCase,
      ),
    );
  }
}

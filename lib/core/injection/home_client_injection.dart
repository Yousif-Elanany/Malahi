import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:malahi_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:malahi_app/features/home/domain/repositories/home_repository.dart';
import 'package:malahi_app/features/home/domain/usecases/get_slides_usecase.dart';
import 'package:malahi_app/features/home/domain/usecases/get_packs_usecase.dart';
import 'package:malahi_app/features/home/domain/usecases/get_tickets_usecase.dart';
import 'package:malahi_app/features/home/domain/cubit/home_cubit.dart';

class HomeClientInjection {
  static final HomeClientInjection _instance = HomeClientInjection._internal();

  factory HomeClientInjection() {
    return _instance;
  }

  HomeClientInjection._internal();

  final Dio _dio = Dio(); // Initialize Dio
  late final RemoteHomeDataSource _remoteHomeDataSource =
      RemoteHomeDataSource(_dio);
  late final HomeRepository _homeRepository =
      HomeRepositoryImpl(_remoteHomeDataSource);
  late final GetSlidesUseCase _getSlidesUseCase =
      GetSlidesUseCase(_homeRepository);
  late final GetPacksUseCase _getPacksUseCase =
      GetPacksUseCase(_homeRepository);
  late final GetTicketsUseCase _getTicketsUseCase =
      GetTicketsUseCase(_homeRepository);

  BlocProvider<HomeCubit> get homeClientCubit {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        getSlidesUseCase: _getSlidesUseCase, // Corrected case
        getPacksUseCase: _getPacksUseCase, // Correct case
        getTicketsUseCase: _getTicketsUseCase, // Correct case
      ),
    );
  }
}

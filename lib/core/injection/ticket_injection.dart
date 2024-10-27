import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/features/tickets/data/data_sources/remote_data_source.dart';
import 'package:malahi_app/features/tickets/data/repositories/ticket_repository_impl.dart';
import 'package:malahi_app/features/tickets/domain/repositories/tickets_repository.dart';
import 'package:malahi_app/features/tickets/domain/usecases/get_tickets_usecase.dart';
import 'package:malahi_app/features/tickets/domain/usecases/get_categories_usecase.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_cubit.dart';

class TicketInjection {
  static final TicketInjection _instance = TicketInjection._internal();

  factory TicketInjection() {
    return _instance;
  }

  TicketInjection._internal();

  final Dio _dio = Dio(); // Initialize Dio for HTTP requests

  // Initialize data sources, repositories, and use cases
  late final RemoteTicketDataSource _remoteTicketDataSource =
      RemoteTicketDataSource(_dio);

  late final TicketsRepository _ticketsRepository =
      TicketRepositoryImpl(_remoteTicketDataSource);

  late final GetTicketsUseCase _getTicketsUseCase =
      GetTicketsUseCase(_ticketsRepository);

  late final GetCategoriesUseCase _getCategoriesUseCase =
      GetCategoriesUseCase(_ticketsRepository);

  // Provide the TicketsCubit with necessary dependencies
  BlocProvider<TicketsCubit> get ticketsCubit {
    return BlocProvider<TicketsCubit>(
      create: (context) => TicketsCubit(
        getTicketsUseCase: _getTicketsUseCase,
        getCategoriesUseCase: _getCategoriesUseCase,
      ),
    );
  }
}

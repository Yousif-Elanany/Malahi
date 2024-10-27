// features/home/domain/cubit/home_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/home/domain/models/slide_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/home/domain/usecases/get_packs_usecase.dart';
import 'package:malahi_app/features/home/domain/usecases/get_slides_usecase.dart';
import 'package:malahi_app/features/home/domain/usecases/get_tickets_usecase.dart';

// HomeState class to hold the states
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSlidesUseCase _getSlidesUseCase;
  final GetTicketsUseCase _getTicketsUseCase;
  final GetPacksUseCase _getPacksUseCase;

  HomeCubit({
    required GetSlidesUseCase getSlidesUseCase,
    required GetTicketsUseCase getTicketsUseCase,
    required GetPacksUseCase getPacksUseCase,
  })  : _getSlidesUseCase = getSlidesUseCase,
        _getTicketsUseCase = getTicketsUseCase,
        _getPacksUseCase = getPacksUseCase,
        super(HomeInitial());

  // Method to fetch all data for home page
  Future<void> getHomeData() async {
    emit(HomeLoading());

    final slidesEither = await _getSlidesUseCase();
    final ticketsEither = await _getTicketsUseCase();
    final packsEither = await _getPacksUseCase();

    // If all results are successful, update the UI state with the data
    slidesEither.fold(
      (failure) => emit(HomeError(failure.message)),
      (slides) => ticketsEither.fold(
        (failure) => emit(HomeError(failure.message)),
        (tickets) => packsEither.fold(
          (failure) => emit(HomeError(failure.message)),
          (packs) =>
              emit(HomeLoaded(slides: slides, tickets: tickets, packs: packs)),
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/domain/usecases/get_tickets_usecase.dart';
import 'package:malahi_app/features/tickets/domain/usecases/get_categories_usecase.dart';
import 'package:malahi_app/features/tickets/domain/cubit/tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final GetTicketsUseCase getTicketsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  TicketsCubit({
    required this.getTicketsUseCase,
    required this.getCategoriesUseCase,
  }) : super(TicketsInitial());

  // Fetch tickets with optional category and searchQuery filters
  Future<void> getTickets({
    List<String>? categories,
    String? searchQuery,
  }) async {
    emit(TicketsLoading());

    final Either<Failure, List<TicketModel>> ticketsOrFailure =
        await getTicketsUseCase(
            categories: categories, searchQuery: searchQuery);

    ticketsOrFailure.fold(
      (failure) => emit(TicketsError("Failed to load tickets")),
      (tickets) => emit(TicketsLoaded(tickets)),
    );
  }

  // Fetch categories
  Future<void> getCategories() async {
    emit(TicketsCategoriesLoading());

    final Either<Failure, List<Category>> categoriesOrFailure =
        await getCategoriesUseCase();

    categoriesOrFailure.fold(
      (failure) => emit(TicketsCategoriesError(failure.message)),
      (categories) => emit(TicketsCategoriesLoaded(categories)),
    );
  }
}

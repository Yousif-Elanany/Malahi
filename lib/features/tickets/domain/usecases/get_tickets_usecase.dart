import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/tickets/domain/repositories/tickets_repository.dart';

class GetTicketsUseCase {
  final TicketsRepository repository;

  GetTicketsUseCase(this.repository);

  Future<Either<Failure, List<TicketModel>>> call({
    List<String>? categories,
    String? searchQuery,
  }) {
    return repository.getTickets(
        categories: categories, searchQuery: searchQuery);
  }
}

// features/home/domain/usecases/get_tickets_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/home/domain/repositories/home_repository.dart';

class GetTicketsUseCase {
  final HomeRepository repository;

  GetTicketsUseCase(this.repository);

  Future<Either<Failure, List<TicketModel>>> call() async {
    return await repository.getTickets();
  }
}

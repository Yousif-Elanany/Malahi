import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/data/data_sources/remote_data_source.dart';
import 'package:malahi_app/features/tickets/domain/repositories/tickets_repository.dart';

class TicketRepositoryImpl implements TicketsRepository {
  final RemoteTicketDataSource remoteDataSource;

  TicketRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TicketModel>>> getTickets({
    List<String>? categories,
    String? searchQuery,
  }) async {
    try {
      final tickets =
          await remoteDataSource.getTickets(categories, searchQuery);
      return Right(tickets);
    } catch (error) {
      print(error);
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      print(categories);
      return Right(categories);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/domain/repositories/tickets_repository.dart';

class GetCategoriesUseCase {
  final TicketsRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call() {
    return repository.getCategories();
  }
}

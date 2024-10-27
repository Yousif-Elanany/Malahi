import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';
import 'package:malahi_app/features/packs/domain/repositories/packs_repository.dart';

class GetCategoriesUseCase {
  final PacksRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call() {
    return repository.getCategories();
  }
}

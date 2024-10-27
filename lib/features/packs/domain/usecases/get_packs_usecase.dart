import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/packs/domain/repositories/packs_repository.dart';

class GetPacksUseCase {
  final PacksRepository repository;

  GetPacksUseCase(this.repository);

  Future<Either<Failure, List<PackModel>>> call({
    List<String>? categories,
    String? searchQuery,
  }) {
    return repository.getPacks(
        categories: categories, searchQuery: searchQuery);
  }
}

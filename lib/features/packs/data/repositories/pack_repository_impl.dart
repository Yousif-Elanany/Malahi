import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';
import 'package:malahi_app/features/packs/data/data_sources/remote_data_source.dart';
import 'package:malahi_app/features/packs/domain/repositories/packs_repository.dart';

class PackRepositoryImpl implements PacksRepository {
  final RemotePackDataSource remoteDataSource;

  PackRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PackModel>>> getPacks({
    List<String>? categories,
    String? searchQuery,
  }) async {
    try {
      final packs = await remoteDataSource.getPacks(categories, searchQuery);
      return Right(packs);
    } catch (error) {
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

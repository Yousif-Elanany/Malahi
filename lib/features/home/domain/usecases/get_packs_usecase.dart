// features/home/domain/usecases/get_packs_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/home/domain/repositories/home_repository.dart';

class GetPacksUseCase {
  final HomeRepository repository;

  GetPacksUseCase(this.repository);

  Future<Either<Failure, List<PackModel>>> call() async {
    return await repository.getPacks();
  }
}

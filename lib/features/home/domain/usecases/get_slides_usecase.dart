// features/home/domain/usecases/get_slides_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/home/domain/models/slide_model.dart';
import 'package:malahi_app/features/home/domain/repositories/home_repository.dart';

class GetSlidesUseCase {
  final HomeRepository repository;

  GetSlidesUseCase(this.repository);

  Future<Either<Failure, List<SlideModel>>> call() async {
    return await repository.getSlides();
  }
}

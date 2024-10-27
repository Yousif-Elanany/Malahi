import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart'; // Add category model

abstract class PacksRepository {
  // Method to fetch packs with optional filters
  Future<Either<Failure, List<PackModel>>> getPacks({
    List<String>? categories,
    String? searchQuery,
  });

  // Method to fetch categories
  Future<Either<Failure, List<Category>>>
      getCategories(); // Add this method to fetch categories
}

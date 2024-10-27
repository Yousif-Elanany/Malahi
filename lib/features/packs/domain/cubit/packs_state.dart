import 'package:malahi_app/features/packs/domain/models/category_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';

abstract class PacksState {}

class PacksInitial extends PacksState {}

class PacksLoading extends PacksState {}

class PacksLoaded extends PacksState {
  final List<PackModel> packs;
  PacksLoaded(this.packs);
}

class PacksError extends PacksState {
  final String message;
  PacksError(this.message);
}

class PacksCategoriesLoading extends PacksState {}

class PacksCategoriesLoaded extends PacksState {
  final List<Category> categories;
  PacksCategoriesLoaded(this.categories);
}

class PacksCategoriesError extends PacksState {
  final String message;
  PacksCategoriesError(this.message);
}

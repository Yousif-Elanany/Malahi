import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';
import 'package:malahi_app/features/packs/domain/usecases/get_packs_usecase.dart';
import 'package:malahi_app/features/packs/domain/usecases/get_categories_usecase.dart';
import 'package:malahi_app/features/packs/domain/cubit/packs_state.dart';

class PacksCubit extends Cubit<PacksState> {
  final GetPacksUseCase getPacksUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  PacksCubit({
    required this.getPacksUseCase,
    required this.getCategoriesUseCase,
  }) : super(PacksInitial());

  // Fetch packs with optional category and searchQuery filters
  Future<void> getPacks({
    List<String>? categories,
    String? searchQuery,
  }) async {
    emit(PacksLoading());

    final Either<Failure, List<PackModel>> packsOrFailure =
        await getPacksUseCase(categories: categories, searchQuery: searchQuery);

    packsOrFailure.fold(
      (failure) => emit(PacksError("Failed to load packs")),
      (packs) => emit(PacksLoaded(packs)),
    );
  }

  // Fetch categories
  Future<void> getCategories() async {
    emit(PacksCategoriesLoading());

    final Either<Failure, List<Category>> categoriesOrFailure =
        await getCategoriesUseCase();

    categoriesOrFailure.fold(
      (failure) => emit(PacksCategoriesError(failure.message)),
      (categories) => emit(PacksCategoriesLoaded(categories)),
    );
  }
}

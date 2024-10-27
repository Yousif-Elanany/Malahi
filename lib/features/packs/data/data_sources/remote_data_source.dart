import 'package:malahi_app/core/constants/app_config.dart';
import 'package:malahi_app/features/packs/domain/models/category_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:dio/dio.dart';

class RemotePackDataSource {
  final Dio dio;

  RemotePackDataSource(this.dio);

  Future<List<PackModel>> getPacks(
      List<String>? categories, String? searchQuery) async {
    // Make an API call with the optional parameters category and searchQuery

    print('${AppConfig.baseUrl}/packs');
    print(categories);
    print(searchQuery);
    final response =
        await dio.get('${AppConfig.baseUrl}/packs', queryParameters: {
      // if (categories != null) 'categories': categories,
      // if (searchQuery != null) 'searchQuery': searchQuery,
    });

    print(response);

    return (response.data as List)
        .map((json) => PackModel.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategories() async {
    final response = await dio.get('${AppConfig.baseUrl}/categories');

    return (response.data as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }
}

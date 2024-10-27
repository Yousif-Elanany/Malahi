import 'package:malahi_app/core/constants/app_config.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:dio/dio.dart';

class RemoteTicketDataSource {
  final Dio dio;

  RemoteTicketDataSource(this.dio);

  Future<List<TicketModel>> getTickets(
      List<String>? categories, String? searchQuery) async {
    // Make an API call with the optional parameters category and searchQuery

    print('${AppConfig.baseUrl}/tickets');
    print('hi brahim');
    print(categories);
    print(searchQuery);
    final response =
        await dio.get('${AppConfig.baseUrl}/tickets', queryParameters: {
      // if (categories != null) 'categories': categories,
      if (searchQuery != null) 'searchQuery': searchQuery,
    });

    print(response);

    return (response.data as List)
        .map((json) => TicketModel.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategories() async {
    final response = await dio.get('${AppConfig.baseUrl}/categories');

    return (response.data as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }
}

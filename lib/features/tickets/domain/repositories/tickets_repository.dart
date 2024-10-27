import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/tickets/domain/models/category_model.dart'; // Add category model

abstract class TicketsRepository {
  // Method to fetch tickets with optional filters
  Future<Either<Failure, List<TicketModel>>> getTickets({
    List<String>? categories,
    String? searchQuery,
  });

  // Method to fetch categories
  Future<Either<Failure, List<Category>>>
      getCategories(); // Add this method to fetch categories
}

import 'package:malahi_app/features/tickets/domain/models/category_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';

abstract class TicketsState {}

class TicketsInitial extends TicketsState {}

class TicketsLoading extends TicketsState {}

class TicketsLoaded extends TicketsState {
  final List<TicketModel> tickets;
  TicketsLoaded(this.tickets);
}

class TicketsError extends TicketsState {
  final String message;
  TicketsError(this.message);
}

class TicketsCategoriesLoading extends TicketsState {}

class TicketsCategoriesLoaded extends TicketsState {
  final List<Category> categories;
  TicketsCategoriesLoaded(this.categories);
}

class TicketsCategoriesError extends TicketsState {
  final String message;
  TicketsCategoriesError(this.message);
}

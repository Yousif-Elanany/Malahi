import 'package:dartz/dartz.dart'; // For using Either, in case you handle failures.
import 'package:malahi_app/core/errors/failure.dart'; // To manage error handling with Either type.
import 'package:malahi_app/features/home/domain/models/slide_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<SlideModel>>> getSlides();
  Future<Either<Failure, List<TicketModel>>> getTickets();
  Future<Either<Failure, List<PackModel>>> getPacks();
}

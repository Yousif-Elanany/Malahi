import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:malahi_app/features/home/domain/models/slide_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'package:malahi_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteHomeDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SlideModel>>> getSlides() async {
    return await remoteDataSource.getSlides();
  }

  @override
  Future<Either<Failure, List<PackModel>>> getPacks() async {
    return await remoteDataSource.getPacks();
  }

  @override
  Future<Either<Failure, List<TicketModel>>> getTickets() async {
    return await remoteDataSource.getTickets();
  }
}

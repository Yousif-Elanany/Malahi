import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/constants/app_config.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/home/domain/models/slide_model.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';
import 'package:malahi_app/features/tickets/domain/models/ticket_model.dart';
import 'dart:developer'; // For using log

class RemoteHomeDataSource {
  final Dio dio;

  RemoteHomeDataSource(this.dio);

  Future<Either<Failure, List<SlideModel>>> getSlides() async {
    try {
      final response = await dio.get('${AppConfig.baseUrl}/slides');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<SlideModel> slides =
            data.map((slide) => SlideModel.fromJson(slide)).toList();
        return Right(slides);
      } else {
        return Left(
            ServerFailure('Failed to fetch slides: ${response.statusCode}'));
      }
    } catch (error) {
      log('Error fetching slides: $error'); // Log the error for debugging
      return Left(ServerFailure('Failed to fetch slides'));
    }
  }

  Future<Either<Failure, List<PackModel>>> getPacks() async {
    try {
      final response = await dio.get('${AppConfig.baseUrl}/packs');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<PackModel> packs =
            data.map((pack) => PackModel.fromJson(pack)).toList();
        return Right(packs);
      } else {
        return Left(
            ServerFailure('Failed to fetch packs: ${response.statusCode}'));
      }
    } catch (error) {
      log('Error fetching packs: $error'); // Log the error for debugging
      return Left(ServerFailure('Failed to fetch packs'));
    }
  }

  Future<Either<Failure, List<TicketModel>>> getTickets() async {
    try {
      final response = await dio.get('${AppConfig.baseUrl}/tickets');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<TicketModel> tickets =
            data.map((ticket) => TicketModel.fromJson(ticket)).toList();
        return Right(tickets);
      } else {
        return Left(
            ServerFailure('Failed to fetch tickets: ${response.statusCode}'));
      }
    } catch (error) {
      log('Error fetching tickets: $error'); // Log the error for debugging
      return Left(ServerFailure('Failed to fetch tickets'));
    }
  }
}

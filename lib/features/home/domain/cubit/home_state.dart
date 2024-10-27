// features/home/domain/cubit/home_state.dart

part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<SlideModel> slides;
  final List<TicketModel> tickets;
  final List<PackModel> packs;

  const HomeLoaded({
    required this.slides,
    required this.tickets,
    required this.packs,
  });

  @override
  List<Object?> get props => [slides, tickets, packs];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

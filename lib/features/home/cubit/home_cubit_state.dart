part of 'home_cubit_cubit.dart';

abstract class HomeStates {}

final class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<TravelInspiration> travelInspirationList;

  HomeSuccessState({required this.travelInspirationList});
}

class HomeErrorState extends HomeStates {}

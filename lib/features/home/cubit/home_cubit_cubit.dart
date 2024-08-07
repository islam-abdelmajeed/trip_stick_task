import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripstick/features/home/data/repository/home_repository.dart';

import '../data/model/travel_inspiration.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeStates> {
  final HomeRepository homeRepo;
  HomeCubitCubit({required this.homeRepo}) : super(HomeInitialState());
  void getPosts() async {
    emit(HomeLoadingState());
    try {
      final data = await homeRepo.getPosts();
      emit(HomeSuccessState(travelInspirationList: data));
    } catch (e) {
      if (e is FormatException) {
        emit(HomeErrorState());
      }
      rethrow;
    }
  }
}

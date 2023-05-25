import 'package:food_order/models/cusine_model.dart';

abstract class HomeScreenState {}

abstract class HomeScreenActionState extends HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenLoadedState extends HomeScreenState {
  final List<CuisineModel> cuisines;

  HomeScreenLoadedState(this.cuisines);
}

class HomeScreenErrorState extends HomeScreenState {}

class HomeScreenNavigateToWishListPageActionState
    extends HomeScreenActionState {}

class HomeScreenNavigateToCartPageActionState extends HomeScreenActionState {}

class HomeScreenCuisineWishlistedActionState extends HomeScreenActionState {}

class HomeScreenCuisineAddedToCartActionState extends HomeScreenActionState {}

class HomeScreenNavigateToProfilePageActionState
    extends HomeScreenActionState {}

class HomeScreenNavigateToHistoryPageActionState
    extends HomeScreenActionState {}

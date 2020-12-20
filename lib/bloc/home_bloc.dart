import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tannhiet/model/todo.dart';
import 'package:tannhiet/model/work.dart';
import 'package:tannhiet/repo/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;

  HomeBloc(this.repository);

  @override
  get initialState => DefaultHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEvent) {
      yield HomeSupportState();
    }
  }
}

@immutable
abstract class HomeEvent {}

@immutable
abstract class HomeState {}

class DefaultHomeState extends HomeState {}

class HomeSupportState extends HomeState {}

class HomeSupportEvent extends HomeEvent {}


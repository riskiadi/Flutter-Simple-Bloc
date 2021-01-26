import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(StateInitial(0));

  int nilai = 0;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event,) async* {
    if(event is EventIncrease){
      nilai++;
      yield StateIncrement(nilai);
    }else if(event is EventDecrease){
      if(nilai>0){
        nilai--;
        yield StateDecrement(nilai);
      }else{
        yield StateZero("Cant decrease below zero.");
      }
    }
  }

}

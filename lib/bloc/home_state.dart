part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class StateInitial extends HomeState {

  final int number;

  StateInitial(this.number);

  @override
  List<Object> get props => [number];
}

class StateIncrement extends HomeState {
  final int number;
  StateIncrement(this.number);
  @override
  List<Object> get props => [number];
}

class StateDecrement extends HomeState {
  final int number;
  StateDecrement(this.number);
  @override
  List<Object> get props => [number];
}

class StateZero extends HomeState{
  final String message;
  StateZero(this.message);
  @override
  List<Object> get props => [message];

}

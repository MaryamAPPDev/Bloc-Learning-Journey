import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;
  const CounterState({this.counter = 0});

  CounterState copyWith ({int ? counter}){
    return CounterState(counter: counter?? this.counter);
  }
  List<Object?> get props => [counter];
}
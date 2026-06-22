import 'package:equatable/equatable.dart';

class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object?> get props => [];
}

class addToList extends TodoListEvent {
  final String task;
  const addToList(this.task);
  List<Object?> get props => [task];
}

class removeToList extends TodoListEvent {
  final Object index;
  removeToList(this.index);
  List<Object?> get props => [index];
}
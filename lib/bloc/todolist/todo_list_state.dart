import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {
  final List<String> todos;

  const TodoListState({this.todos = const['']});

  TodoListState copyWith({List<String>?todos}) {
    return TodoListState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];
}
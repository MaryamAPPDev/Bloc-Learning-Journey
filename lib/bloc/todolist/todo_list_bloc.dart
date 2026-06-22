import 'package:bloc/bloc.dart';
import 'package:bloc_learning_project/bloc/todolist/todo_list_event.dart';
import 'package:bloc_learning_project/bloc/todolist/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final List<String> tempTodos =[];
  TodoListBloc() : super (TodoListState()){
    on<addToList>(addList);
    on<removeToList>(removeList);
  }

  void addList (addToList event, Emitter<TodoListState> emit){
    tempTodos.add(event.task);
    emit(state.copyWith(todos: List.from(tempTodos)));
  }

  void removeList(removeToList event , Emitter<TodoListState> emit){
    tempTodos.remove(event.index);
    emit(state.copyWith(todos: List.from(tempTodos)));
  }
}
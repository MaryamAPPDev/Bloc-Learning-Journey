import 'package:bloc_learning_project/bloc/todolist/todo_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todolist/todo_list_event.dart';
import '../../bloc/todolist/todo_list_state.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(child: Text("No data"));
          } else if (state.todos.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoListBloc>().add(
                        removeToList(state.todos[index]),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.white),

        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoListBloc>().add(addToList('task $i'));
          }
        },
      ),
    );
  }
}
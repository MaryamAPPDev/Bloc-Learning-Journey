import 'package:bloc_learning_project/bloc/counterbloc/counter_bloc.dart';
import 'package:bloc_learning_project/bloc/counterbloc/counter_event.dart';
import 'package:bloc_learning_project/bloc/counterbloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("CounterApp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 2,
        ),
        backgroundColor: Colors.white70,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) => Text(
                    state.counter.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 BlocBuilder<CounterBloc, CounterState>(
                   buildWhen: (previous, current) => false,
                     builder: (context, state) =>ElevatedButton
                       (onPressed: () {
                         context.read<CounterBloc>().add(IncrementCounter());
                     },
                         child: Text("Increment"))
                 ),
                  SizedBox(width: 20,),
                  BlocBuilder<CounterBloc, CounterState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) =>ElevatedButton
                        (onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                          child: Text("Decrement"))
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

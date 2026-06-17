import 'package:bloc_learning_project/bloc/switchbloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/switchbloc/switch_event.dart';
import '../../bloc/switchbloc/switch_state.dart';

class Switchslider extends StatefulWidget {
  const Switchslider({super.key});

  @override
  State<Switchslider> createState() => _SwitchsliderState();
}

class _SwitchsliderState extends State<Switchslider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliderSwitch"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Notifications",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(
                        enableOrDisableNotification(),
                      );
                      print("switch");
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 70),

          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,

            builder: (context, state) => Container(
              color: Colors.red.withOpacity(state.slider),
              height: 200,
              width: 200,
            ),
          ),

          SizedBox(height: 70),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) => Slider(
              value: state.slider,
              onChanged: (value) {
                context.read<SwitchBloc>().add(SliderEvent(slider: value));
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
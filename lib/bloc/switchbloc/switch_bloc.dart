import 'package:bloc/bloc.dart';
import 'package:bloc_learning_project/bloc/switchbloc/switch_event.dart';
import 'package:bloc_learning_project/bloc/switchbloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<enableOrDisableNotification>(_enableordisablenotification);
    on<SliderEvent>(_slidervalue);
  }

  void _enableordisablenotification(
      enableOrDisableNotification events,
      Emitter<SwitchState> emit,
      ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slidervalue(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider:events.slider.toDouble() ));
  }
}
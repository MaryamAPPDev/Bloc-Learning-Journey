import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  List<Object?> get props => [];
}

class enableOrDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider});
  @override
  List<Object?> get props => [slider];
}
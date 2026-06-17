import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double slider;
  const SwitchState({this.isSwitch = true, this.slider = .4});

  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}
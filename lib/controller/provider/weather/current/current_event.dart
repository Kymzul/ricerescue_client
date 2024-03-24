part of 'current_bloc.dart';

@immutable
sealed class CurrentEvent {}

class GenerateCurrentEvent extends CurrentEvent {
  final LocationEntity locationEntity;
  GenerateCurrentEvent({required this.locationEntity});
}

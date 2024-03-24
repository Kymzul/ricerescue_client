import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double? latitude;
  final double? longitude;

  LocationEntity({this.latitude, this.longitude});

  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude];
}

import 'package:intl/intl.dart';
import 'package:vhack_client/model/crop_entity.dart';
import 'package:vhack_client/model/weather_entity.dart';

class ConvertDate {
  static convertToDate({required CropEntity cropEntity}) {
    String dateString = '2024-01-16T01:41:03.840797';
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  static convertToHour({required CropEntity cropEntity}) {
    String dateString = '2024-01-16T01:41:03.840797';
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('HH:mm').format(dateTime);
    return formattedDate;
  }

  static convertToDateWeather({required WeatherEntity weatherEntity}) {
    String dateString = weatherEntity.weatherTime!;
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('E').format(dateTime);
    return formattedDate.toUpperCase();
  }
}

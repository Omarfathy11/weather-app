
import 'package:weatherapp/models/weather_model.dart';

class WeatherState{}

class NoWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
 
} // الصفحة الي يوجد بها البيانات

class WeatherFailureState extends WeatherState{
  final String errMessage;

  WeatherFailureState(this.errMessage);
 
}  // Error in this page
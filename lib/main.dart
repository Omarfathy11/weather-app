import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weathercondition,
                  ),
                ),
                home: const HomeView(),
              );
            },
          ),
        ));
  }

  
}
MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    } else {
      switch (condition) {
        case 'Sunny':
          return Colors.orange;
        case 'Clear':
          return Colors.blue;
        case 'Partly cloudy':
        case 'Cloudy':
          return Colors.grey;
        case 'Overcast':
          return Colors.blueGrey;
        case 'Mist':
        case 'Fog':
          return Colors.grey;
        case 'Patchy rain possible':
        case 'Light rain':
        case 'Moderate rain at times':
        case 'Moderate rain':
        case 'Heavy rain at times':
        case 'Heavy rain':
        case 'Light freezing rain':
        case 'Moderate or heavy freezing rain':
        case 'Light rain shower':
        case 'Moderate or heavy rain shower':
        case 'Torrential rain shower':
        case 'Patchy light rain with thunder':
        case 'Moderate or heavy rain with thunder':
          return Colors.blue;
        case 'Patchy snow possible':
        case 'Patchy sleet possible':
        case 'Patchy freezing drizzle possible':
        case 'Blowing snow':
        case 'Blizzard':
        case 'Patchy light drizzle':
        case 'Light drizzle':
        case 'Freezing drizzle':
        case 'Heavy freezing drizzle':
        case 'Patchy light snow':
        case 'Light snow':
        case 'Patchy moderate snow':
        case 'Moderate snow':
        case 'Patchy heavy snow':
        case 'Heavy snow':
        case 'Light sleet':
        case 'Moderate or heavy sleet':
        case 'Light sleet showers':
        case 'Moderate or heavy sleet showers':
        case 'Light snow showers':
        case 'Moderate or heavy snow showers':
        case 'Light showers of ice pellets':
        case 'Moderate or heavy showers of ice pellets':
        case 'Patchy light snow with thunder':
        case 'Moderate or heavy snow with thunder':
          return Colors.grey;
        case 'Thundery outbreaks possible':
          return Colors.yellow;
        case 'Freezing fog':
          return Colors.grey;
        case 'Ice pellets':
          return Colors.grey;
        default:
          return Colors.blue;
      }
    }
  }

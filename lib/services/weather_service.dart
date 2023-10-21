import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
 final Dio dio ;
 final String baseUrl = 'http://api.weatherapi.com/v1';
 final String apiKey = '90a23e7559924ddcb29232440231110';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async{
    try {
    Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
    } on DioException catch(e){
      final String errmessage  = e.response?.data['error']['message'] ?? 'opps there was an error try later';
       throw Exception(errmessage);
    }catch (e){
      log(e.toString());
      throw Exception('there was an error , try later ');
    }
  }

}
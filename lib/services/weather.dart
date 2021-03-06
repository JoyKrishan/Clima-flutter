import 'package:clima/services/networking.dart';
import '../services/location.dart';

class WeatherModel {
  static final apiKey = '38c096173ed7b7fe54b2edb654773b6a';

  static Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper =  NetworkHelper(url: 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    print('http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var data = await networkHelper.getData();
    return data;
  }

  static Future<dynamic> getLocationWeather() async{
    Location loc = Location();
    await loc.getCurrentLocation();
    print(loc.longitude);
    print(loc.longitude);
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=${loc
            .latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var data = await networkHelper.getData();
    return data;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

import 'package:clima/services/networking.dart';
import '../services/location.dart';

class WeatherModel {
  static final apiKey = '38c096173ed7b7fe54b2edb654773b6a';

  static Future<dynamic> getWeatherData() async{
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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:weather/services/networking.dart';

// const apiKeys = "242d8051ebc2bdda754d5291c9ddf853";
// const oprenWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  // Future<dynamic> getLocationweather() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   NetworkHelper networkHelper = NetworkHelper(
  //       url:
  //         // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  //         "${oprenWeatherMapUrl}?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKeys}&units=metric");
  //   var weatherData = await networkHelper.getData();
  //   return weatherData();
  // }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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

import 'package:geolocator/geolocator.dart';
import 'package:weather/services/networking.dart';

const apiKeys = "242d8051ebc2bdda754d5291c9ddf853";
const oprenWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";



Future getCityweather(String cityName )async{
  // Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.low);
  NetworkHelper networkHelper = NetworkHelper(url: "${oprenWeatherMapUrl}?q=${cityName}&appid=${apiKeys}&units=metric");
  var weatherData = await networkHelper.getData();
  return weatherData;
}

Future getCityweatherRestart()async{
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  NetworkHelper networkHelper = NetworkHelper(url: "${oprenWeatherMapUrl}?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKeys}&units=metric");
  var weatherData = await networkHelper.getData();
  return weatherData;
}
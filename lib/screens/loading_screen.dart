import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/screens/location_screen.dart';

import 'package:weather/services/networking.dart';
import 'package:weather/services/weather.dart';

const apiKeys = "242d8051ebc2bdda754d5291c9ddf853";
const oprenWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    NetworkHelper networkHelper = NetworkHelper(
        url:
        // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
        "${oprenWeatherMapUrl}?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKeys}&units=metric");
    var weatherData = await networkHelper.getData();

    // var weatherData = await WeatherModel().getLocationweather();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData),
        ));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDoubleBounce(
                size: 30,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}

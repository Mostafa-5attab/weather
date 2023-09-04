import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({
    required this.locationWeather,
  });

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    upateUI(widget.locationWeather);
  }

  WeatherModel weatherModel = WeatherModel();

  late int condition;
  late int temperatureUpdata;
  late String cityName;
  late String getMessage;
  late String getWeatherIcon;

  void upateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = "";
        temperatureUpdata = 0;
        getWeatherIcon = "Error";
        getMessage = "Error";
      }
      condition = weatherData["weather"][0]["id"];
      double temperature = weatherData['main']['temp'];
      temperatureUpdata = temperature.toInt();
      cityName = weatherData["name"];
      getMessage = weatherModel.getMessage(temperatureUpdata);
      getWeatherIcon = weatherModel.getWeatherIcon(condition);
      print(cityName);
      print(temperatureUpdata);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async{
                      var weatherDatarestart = await getCityweatherRestart();
                      upateUI(weatherDatarestart);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async{
                      var typeName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen(),
                          )
                      );
                      if (typeName != null ){
                        var weatherData = await getCityweather(typeName);
                        upateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperatureUpdata}°',
                      style: TextStyle(
                        fontSize: 50,

                      ),
                    ),
                    Text(
                      '${getWeatherIcon}',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${getMessage} in ${cityName}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

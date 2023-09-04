import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const TextFormFieldStyle = InputDecoration(

  icon: Icon(
      Icons.location_city
  ),
  filled: true,
  fillColor: Colors.blueGrey,
  hintText: "Enter a city",
  hintStyle: TextStyle(
      color: Colors.black87
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide.none
  ),
);
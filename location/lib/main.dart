import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }

}
class LocationScreen extends StatefulWidget {
const LocationScreen({super.key});
@override
State<LocationScreen> createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
String myPosition = '';
@override
void initState() {
super.initState();
getPosition().then((Position myPos) {
myPosition =
'Latitude: ${myPos.latitude.toString()} - Longitude:${myPos.longitude.toString()}';
setState(() {
myPosition = myPosition;});
});
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Current Location')),
body: Center(child: Text(myPosition)),
);
}
Future<Position> getPosition() async {
await Geolocator.requestPermission();
await Geolocator.isLocationServiceEnabled();
Position? position =
await Geolocator. getCurrentPosition();
return position;
}}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';


const String apiKey = "MYAPIKEY";

Future<Set<Polyline>> getLines() async {
  Set<MapRoute> routes = await getRoutes();
  Set<Polyline> lines = {};
  for(int i = 0; i < routes.length; i++) {
    var route = routes.elementAt(i);
    List<LatLng> polylineCoordinates = [];
    polylineCoordinates.add(route.origin);
    List<LatLng> result = await getPolylineResult(
        route.origin,
        route.destination,
        route.wayPoints
    );
    polylineCoordinates.addAll(result);
    polylineCoordinates.add(route.destination);
    lines.add(
        Polyline(
          polylineId: PolylineId(i.toString()),
          jointType: JointType.round,
          points: polylineCoordinates,
          color: Colors.blue,
        )
    );
  }
  return lines;
}

// DBから取得する想定
Future<Set<MapRoute>> getRoutes() async {
  LatLng latLng1 = const LatLng(37.51898671455384,  139.92861545223124);
  LatLng latLng2 = const LatLng(37.5212909759392,   139.91835264189348);
  LatLng latLng3 = const LatLng(37.52203979323528,  139.91719392762462);
  LatLng latLng4 = const LatLng(37.52029058809752,  139.91561474640025);
  LatLng latLng5 = const LatLng(37.51893337062692,  139.9150945924296);
  LatLng latLng6 = const LatLng(37.51808015731422,  139.91188325084337);
  LatLng latLng7 = const LatLng(37.5249745759622,   139.90874062847942);
  LatLng latLng8 = const LatLng(37.536445247194,    139.90240521600361);
  LatLng latLng9 = const LatLng(37.53813824346729,  139.8987665682193);
  LatLng latLng10 = const LatLng(37.540996677896935, 139.89790826135345);
  LatLng latLng11 = const LatLng(37.54498942976063,  139.89708424641123);

  return {
    MapRoute(
      origin: latLng1,
      destination: latLng11,
      wayPoints: [
        latLng2,
        latLng3,
        latLng4,
        latLng5,
        latLng6,
        latLng7,
        latLng8,
        latLng9,
        latLng10,
      ],
    ),
  };
}

Future<List<LatLng>> getPolylineResult(
    LatLng origin,
    LatLng destination,
    List<LatLng> wayPoints) async {
  var params = {
    "origin": "${origin.latitude},${origin.longitude}",
    "destination": "${destination.latitude},${destination.longitude}",
    "mode": "driving",
    "avoidHighways": "false",
    "avoidFerries": "true",
    "avoidTolls": "false",
    "key": apiKey
  };
  if (wayPoints.isNotEmpty) {
    List wayPointsArray = [];
    for (var point in wayPoints) {
      String encoded = encodePolyline([[point.latitude.toDouble(), point.longitude.toDouble()]]);
      wayPointsArray.add("enc:$encoded:");
    }
    String wayPointsString = wayPointsArray.join('|');
    params.addAll({"waypoints": wayPointsString});
  }
  Uri uri = Uri.https("maps.googleapis.com", "maps/api/directions/json", params);
  var response = await http.get(uri);
  List<LatLng> polylineCoordinates = [];
  if (response.statusCode != 200) {
    return [];
  }
  var parsedJson = json.decode(response.body);
  if (parsedJson["status"]?.toLowerCase() != "ok" || parsedJson["routes"] == null || parsedJson["routes"].isEmpty) {
    return [];
  }
  List<List<num>> points = decodePolyline(parsedJson["routes"][0]["overview_polyline"]["points"]);
  for (var point in points) {
    polylineCoordinates.add(LatLng(point[0].toDouble(), point[1].toDouble()));
  }
  return polylineCoordinates;
}


class MapRoute {
  LatLng origin;
  LatLng destination;
  List<LatLng> wayPoints;
  MapRoute({this.origin = const LatLng(0, 0), this.destination = const LatLng(0,0), this.wayPoints = const []});
}
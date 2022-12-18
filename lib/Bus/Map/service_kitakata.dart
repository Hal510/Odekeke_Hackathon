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
  LatLng latLng2 = const LatLng(37.51961008210341,  139.92580852090927);
  LatLng latLng3 = const LatLng(37.52173712566494, 139.92407575251022);
  LatLng latLng4 = const LatLng(37.52535486413448, 139.9218267400124);
  LatLng latLng5 = const LatLng(37.53076054001056,  139.91880164274676);
  LatLng latLng6 = const LatLng(37.54071078867819, 139.91679388059126);
  LatLng latLng7 = const LatLng(37.5212909759392,   139.91835264189348);
  LatLng latLng8 = const LatLng(37.53198571795584,  139.91577611104472);
  LatLng latLng9 = const LatLng(37.540449887528666, 139.91408630689486);
  LatLng latLng10 = const LatLng(37.54395424689345,  139.91282026175395);
  return {
    MapRoute(
      origin: latLng1,
      destination: latLng10,
      wayPoints: [
        latLng2,
        latLng3,
        latLng4,
        latLng5,
        latLng6,
        latLng7,
        latLng8,
        latLng9,
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
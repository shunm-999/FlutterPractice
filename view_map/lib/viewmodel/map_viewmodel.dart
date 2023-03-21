import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

@immutable
class MapUiState {
  final List<Marker> markers;

  const MapUiState({required this.markers});

  MapUiState copyWith(List<Marker>? markers) {
    return MapUiState(markers: markers ?? List.empty());
  }
}

final LatLng _london = LatLng(51.5, -0.09);
final LatLng _paris = LatLng(48.8566, 2.3522);
final LatLng _dublin = LatLng(53.3498, -6.2603);

final _initialMarkers = <Marker>[
  Marker(
    width: 80,
    height: 80,
    point: _london,
    builder: (ctx) => Container(
      key: const Key('blue'),
      child: const FlutterLogo(),
    ),
  ),
  Marker(
    width: 80,
    height: 80,
    point: _dublin,
    builder: (ctx) => const FlutterLogo(
      key: Key('green'),
      textColor: Colors.green,
    ),
  ),
  Marker(
    width: 80,
    height: 80,
    point: _paris,
    builder: (ctx) => Container(
      key: const Key('purple'),
      child: const FlutterLogo(textColor: Colors.purple),
    ),
  ),
];

class MapViewModel extends StateNotifier<MapUiState> {
  MapViewModel()
      : super(MapUiState(markers: List.unmodifiable(_initialMarkers)));

  void addMarker({required LatLng point, required void Function() onTapMarker}) {
    state = state.copyWith([
      ...state.markers,
      Marker(
        width: 80,
        height: 80,
        point: point,
        builder: (ctx) => GestureDetector(
          onTap: onTapMarker,
          child: const FlutterLogo(
            textColor: Colors.green,
          ),
        ),
      )
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:view_map/provider/viewmodel_provider.dart';

class MapScreen extends HookConsumerWidget {
  final MapController _mapController = MapController();

  MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(mapViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(50.0),
        child: FlutterMap(
          mapController: _mapController,
          // マップ表示設定
          options: MapOptions(
            center: LatLng(35.681, 139.767),
            zoom: 5,
            maxZoom: 10,
            minZoom: 3,
            onMapEvent: (MapEvent mapEvent) {
              if (mapEvent is MapEventLongPress) {
                ref.read(mapViewModelProvider.notifier).addMarker(
                    point: mapEvent.tapPosition,
                    onTapMarker: () {
                      _showBottomSheetMenu(
                          context: context, position: mapEvent.tapPosition);
                    });
              }
            },
          ),
          children: [
            TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
            MarkerLayer(markers: viewModel.markers),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheetMenu(
    {required BuildContext context, required LatLng position}) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (builder) {
        return Container(
          height: 350.0,
          color: Colors.transparent,
          child: Center(
            child: Text(
                """
                This point 
                lat:${position.latitude}, 
                log:${position.latitude}
                """),
          ),
        );
      });
}

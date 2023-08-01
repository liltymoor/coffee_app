import 'package:yandex_mapkit/yandex_mapkit.dart';
export 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapPlacemarkObj {
  final int placemarkObjId;
  final Point placemarkObjPoint;
  final double opacity;
  final String iconPath;
  final double iconScale;

  YandexMapPlacemarkObj({
    required this.placemarkObjId,
    required this.placemarkObjPoint,
    required this.opacity,
    required this.iconPath,
    required this.iconScale,
  });

  PlacemarkMapObject createPlacemark() {
    return PlacemarkMapObject(
      mapId: MapObjectId('placemark_$placemarkObjId'),
      point: placemarkObjPoint,
      opacity: opacity,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(iconPath),
          scale: iconScale,
        ),
      ),
    );
  }
}

class YandexMapService {
  final List<YandexMapPlacemarkObj> placemarkObjects;
  final List<MapObject> mapObjects;

  YandexMapService({required this.placemarkObjects}) : mapObjects = [
    MapObjectCollection(
      mapId: const MapObjectId('placemark_collection'),
      mapObjects: placemarkObjects
          .map((placemarkObj) => placemarkObj.createPlacemark())
          .toList(),
    )
  ];
}

class CameraObject {
  final Point cameraObjPoint;
  final double zoom;

  CameraObject({
    required this.cameraObjPoint,
    required this.zoom,
  });

  CameraPosition createCamera() {
    return CameraPosition(
      target: cameraObjPoint,
      zoom: zoom,
    );
  }
}

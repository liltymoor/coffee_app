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


class YandexMapWidget {
  // Placemark Objects
  final yandexMapService = YandexMapService(
      placemarkObjects: [
        YandexMapPlacemarkObj(
          placemarkObjId: 1,
          placemarkObjPoint: const Point(latitude: 55.75124, longitude: 37.618423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ),
        YandexMapPlacemarkObj(
          placemarkObjId: 2,
          placemarkObjPoint: const Point(latitude: 55.74524, longitude: 37.618423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ),
        YandexMapPlacemarkObj(
          placemarkObjId: 3,
          placemarkObjPoint: const Point(latitude: 55.74824, longitude: 37.621423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ),
      ]
  );
  // ---


  // Camera Position
  final cameraPosition = CameraObject(
      cameraObjPoint: const Point(latitude: 55.751244, longitude: 37.618423),
      zoom: 14
  ).createCamera();
  // ---


  YandexMap createYandexMap() {
    return YandexMap(
        onMapCreated: (YandexMapController yandexMapController) {
          yandexMapController.moveCamera(
            animation: const MapAnimation(
                type: MapAnimationType.linear, duration: 1
            ),

            CameraUpdate.newCameraPosition(cameraPosition),
          );
        },

        mapObjects: yandexMapService.mapObjects
    );
  }
}

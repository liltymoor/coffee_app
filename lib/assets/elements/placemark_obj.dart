import 'package:yandex_mapkit/yandex_mapkit.dart';


class YandexMapPlacemarkObj {
  final int placemarkObjId;

  final String name;
  final List<String> gallery;
  final String location;
  final String schedule;
  final String description;

  final Point placemarkObjPoint;
  final double opacity;
  final String iconPath;
  final double iconScale;

  YandexMapPlacemarkObj({
    required this.placemarkObjId,

    required this.name,
    required this.gallery,
    required this.location,
    required this.schedule,
    required this.description,

    required this.placemarkObjPoint,
    required this.opacity,
    required this.iconPath,
    required this.iconScale,
  });

  PlacemarkMapObject createPlacemark(Function(YandexMapPlacemarkObj) onTap) {
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
      onTap: (_, __) => onTap(this),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
export 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:coffee_app/assets/elements/painters.dart';
import 'package:coffee_app/assets/elements/placemark_obj.dart';
import 'package:coffee_app/assets/elements/placemark_information.dart';

class YandexMapService {
  final List<PlacemarkMapObject> placemarkObjects;
  final List<MapObject> mapObjects;

  YandexMapService({required this.placemarkObjects})
      : mapObjects = [
    MapObjectCollection(
      mapId: const MapObjectId('placemark_collection'),
      mapObjects: placemarkObjects,
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

class YandexMapWidget extends StatefulWidget {
  @override
  _YandexMapWidgetState createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> {
  bool isInfoVisible = false;
  YandexMapPlacemarkObj? selectedPlacemark;

  final List<String> imagesList = [
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg',
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg',
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // Placemark Objects
    final yandexMapService = YandexMapService(
      placemarkObjects: [
        YandexMapPlacemarkObj(
          placemarkObjId: 1,

          name: "Ароматное убежище",
          gallery: imagesList,
          location: "Лиговский проспект, д. 135",
          schedule: "Открыто с 8:00 до 22:00",
          description:
            "Уютная кофейня с камином, свежеобжаренные зерна из мира, "
            "бариста-искусство. Настоящий домашний комфорт.",

          placemarkObjPoint: const Point(latitude: 55.75124, longitude: 37.618423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ).createPlacemark((placemarkObj) {
          setState(() {
            selectedPlacemark = placemarkObj;
            isInfoVisible = true;
          });
        }),
        YandexMapPlacemarkObj(
          placemarkObjId: 2,

          name: "Эклектичный кофеман",
          gallery: imagesList,
          location: "Лиговский проспект, д. 119К",
          schedule: "Открыто с 12:00 до 20:00",
          description:
            "Модная кофейня, оригинальный декор, креативные встречи, "
            "вдохновляющие разговоры.",

          placemarkObjPoint: const Point(latitude: 55.74524, longitude: 37.618423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ).createPlacemark((placemarkObj) {
          setState(() {
            selectedPlacemark = placemarkObj;
            isInfoVisible = true;
          });
        }),
        YandexMapPlacemarkObj(
          placemarkObjId: 3,

          name: "Райские ароматы",
          gallery: imagesList,
          location: "Лиговский проспект, д. 121",
          schedule: "Открыто с 10:00 до 23:00",
          description:
            "Оазис релаксации, элегантный интерьер, премиальный кофе, "
            "свежие десерты, моменты блаженства.",

          placemarkObjPoint: const Point(latitude: 55.74824, longitude: 37.621423),
          opacity: 0.8,
          iconPath: 'lib/assets/place.png',
          iconScale: 1,
        ).createPlacemark((placemarkObj) {
          setState(() {
            selectedPlacemark = placemarkObj;
            isInfoVisible = true;
          });
        }),
      ],
    );
    // Camera Position
    final cameraPosition = CameraObject(
      cameraObjPoint: const Point(latitude: 55.751244, longitude: 37.618423),
      zoom: 14,
    ).createCamera();

    return Stack(
      children: [
        YandexMap(
          onMapCreated: (YandexMapController yandexMapController) {
            yandexMapController.moveCamera(
              animation: const MapAnimation(
                type: MapAnimationType.linear,
                duration: 1,
              ),
              CameraUpdate.newCameraPosition(cameraPosition),
            );
          },
          mapObjects: yandexMapService.mapObjects,
        ),
        if (isInfoVisible)
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  // Information Shadow
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      painter: TopShadowPainter(
                        blur_size: 8,
                        shadow_size: 30,
                        color: Colors.lightBlue
                      ),
                      size: Size(MediaQuery.of(context).size.width, 50),
                    ),
                  ),
                  // ---

                  // Information
                  PlacemarkInformation(
                    context: context,
                    selectedPlacemark: selectedPlacemark,
                  ).createPlacemarkContainer(),
                  //
                ],
              )
          )
      ],
    );
  }
}

import 'package:coffee_app/assets/constants/color_scheme.dart';

import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';
export 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:coffee_app/assets/elements/painters.dart';
import 'package:coffee_app/assets/elements/placemark_obj.dart';
import 'package:coffee_app/assets/elements/placemark_information.dart';

import 'package:coffee_app/assets/constants/adaptive_size.dart';


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

class CustomPopupMenu extends StatelessWidget {
  final VoidCallback onClose;

  CustomPopupMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // добавьте этот тип материала, чтобы убрать стандартный фон и эффекты нажатия
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(3, (index) {
            return Row(
              children: [
                Checkbox(
                  value: false, // Замените на ваше актуальное значение
                  onChanged: (bool? isSelected) {
                    // Ваш обработчик состояния
                  },
                ),
                Text('${index + 1}'),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class YandexMapWidget extends StatefulWidget {
  @override
  _YandexMapWidgetState createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> with TickerProviderStateMixin {
  bool isInfoVisible = false;
  YandexMapPlacemarkObj? selectedPlacemark;

  final List<List<String>> imagesList = [
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Американо'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Эспрессо'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Латте'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Латте (Ванильный)'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Латте (Кокосовое)'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Двойной Эспрессо'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Чай (Черный)'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Какао'],
    ['https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg', 'Чай (Зеленый)'],
  ];


  late YandexMapController _mapController;

  bool isSheetVisible = false;
  bool wasPlacemarkTapped = false;

  late AnimationController _animationController;
  late Animation<Offset> _animation;


  late CameraPosition cameraPosition = CameraPosition(
    target: Point(latitude: 55.751244, longitude: 37.618423),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    // cameraPosition = const CameraPosition(
    //   target: Point(latitude: 55.751244, longitude: 37.618423),
    //   zoom: 14,
    // );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(_animationController);
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        print('asdasdasdasdad');
        cameraPosition = CameraPosition(
          target: Point(latitude: position.latitude, longitude: position.longitude),
          zoom: 14,
        );
        CameraUpdate.newCameraPosition(cameraPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    // overlayEntry?.remove();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Placemark Objects
    final List<YandexMapPlacemarkObj> placeamrksList = [
      YandexMapPlacemarkObj(
        placemarkObjId: 1,

        placemarkLevel: 2,

        name: "Ароматное убежище",
        gallery: imagesList,
        location: "Лиговский проспект, д. 135",
        schedule: "8:00 - 22:00",
        description:
        "Уютная кофейня с камином, свежеобжаренные зерна из мира, "
            "бариста-искусство. Настоящий домашний комфорт.",

        placemarkObjPoint: const Point(latitude: 55.75124, longitude: 37.618423),
        opacity: 0.8,
        iconPath: 'lib/assets/images/place.png',
        iconScale: 1,
      ),
      YandexMapPlacemarkObj(
        placemarkObjId: 2,

        placemarkLevel: 1,

        name: 'Кофейня "Coffee World"',
        gallery: imagesList,
        location: "Лиговский проспект, д. 119К",
        schedule: "12:00 - 20:00",
        description:
        "Модная кофейня, оригинальный декор, креативные встречи, "
            "вдохновляющие разговоры.",

        placemarkObjPoint: const Point(latitude: 55.74524, longitude: 37.618423),
        opacity: 0.8,
        iconPath: 'lib/assets/images/place.png',
        iconScale: 1,
      ),
      YandexMapPlacemarkObj(
        placemarkObjId: 3,

        placemarkLevel: 1,

        name: "Райские ароматы",
        gallery: imagesList,
        location: "Лиговский проспект, д. 121",
        schedule: "10:00 - 23:00",
        description:
        "Оазис релаксации, элегантный интерьер, премиальный кофе, "
            "свежие десерты, моменты блаженства.",

        placemarkObjPoint: const Point(latitude: 55.74824, longitude: 37.621423),
        opacity: 0.8,
        iconPath: 'lib/assets/images/place.png',
        iconScale: 1,
      )
    ];
    // ].where((placemark) => currentPlacemarkLevels.contains(placemark.placemarkLevel)).toList();

    final yandexMapService = YandexMapService(
      placemarkObjects: placeamrksList.map((placemark) =>
          placemark.createPlacemark((placemarkObj) {
            setState(() {
              selectedPlacemark = placemarkObj;
              isInfoVisible = true;
              wasPlacemarkTapped = true;
              _animationController.forward();
            });
          })).toList()
    );

    YandexMap yandexMap = YandexMap(
      onMapCreated: (YandexMapController yandexMapController) {
        yandexMapController.moveCamera(
          animation: const MapAnimation(
            type: MapAnimationType.smooth,
            duration: 1,
          ),

          CameraUpdate.newCameraPosition(cameraPosition),
        );
        _mapController = yandexMapController;
      },

      onMapTap: (Point point) {
        if (wasPlacemarkTapped) {
          setState(() {
            wasPlacemarkTapped = false;
          });
        } else if (isInfoVisible) {
          _animationController.reverse();

          Future.delayed(Duration(milliseconds: 300), () {
            setState(() {
              isInfoVisible = false;
            });
          });
        }
      },

      mapObjects: yandexMapService.mapObjects,
    );

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (isInfoVisible) {
              _animationController.reverse();
            }
          },
          child: yandexMap,
        ),

        // Top bar
        Container(
          padding: EdgeInsets.only(
            left: adaptiveSize(context, 20.0),
            right: adaptiveSize(context, 20.0),
            top: adaptiveSize(context, 50.0)
          ),
          child: Row(
            children: [
              InkWell(
                onTap: _openDrawer,
                child: Icon(Icons.menu)
              ),

              Spacer(),

              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/subscribe');
                },
                child: Container(
                  height: adaptiveSize(context, 50.0),
                  width: adaptiveSize(context, 110.0),
                  padding: EdgeInsets.symmetric(
                    vertical: adaptiveSize(context, 10.0),
                    horizontal: adaptiveSize(context, 15.0),
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.figmaColorLight,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,  // Выравнивание по центру и к правому краю
                    child: Text(
                      'ОФОРМИ\nПОДПИСКУ',
                      textAlign: TextAlign.right,  // Текст также выравнивается по правому краю
                      style: TextStyle(
                        fontSize: adaptiveSize(context, 12.0),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: adaptiveSize(context, 20.0)),

              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/bonuses');
                },
                child:Container(
                  height: adaptiveSize(context, 50.0),
                  width: adaptiveSize(context, 110.0),
                  padding: EdgeInsets.symmetric(
                    vertical: adaptiveSize(context, 10.0),
                    horizontal: adaptiveSize(context, 15.0),
                  ),
                  decoration: BoxDecoration(
                      color: AppColor.figmaColorLight,
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,  // Выравнивание по центру и к правому краю
                    child: Text(
                      'ПОЛУЧИ\nБОНУСЫ',
                      textAlign: TextAlign.right,  // Текст также выравнивается по правому краю
                      style: TextStyle(
                        fontSize: adaptiveSize(context, 12.0),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

              // IconButton(
              //   icon: Icon(Icons.filter_alt_rounded),
              //   onPressed: () {
              //     final RenderBox renderBox = context.findRenderObject() as RenderBox;
              //     final offset = renderBox.localToGlobal(Offset.zero);
              //     _showMenu(context, offset);
              //   },
              // ),
            ],
          )
        ),

        // Positioned(
        //   top: adaptiveSize(context, 20.0),
        //   left: adaptiveSize(context, 20.0),
        //   child: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: _openDrawer,
        //   ),
        // ),

        // Zoom Buttons
        Align(
          alignment: Alignment.topRight,
          child: FractionallySizedBox(
            heightFactor: 0.5,
            child: Padding(
              padding: EdgeInsets.only(right: adaptiveSize(context, 20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      var currentCameraPosition  = await _mapController.getCameraPosition();
                      var currentZoom = currentCameraPosition.zoom;
                      _mapController.moveCamera(
                        animation: const MapAnimation(
                          type: MapAnimationType.smooth,
                          duration: 0.25,
                        ),

                        CameraUpdate.zoomTo(currentZoom + 1),
                      );
                    },
                    child: Container(
                      width: adaptiveSize(context, 50.0),
                      height: adaptiveSize(context, 50.0),
                      padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/images/plus.png',
                      ),
                    )
                  ),

                  SizedBox(height: adaptiveSize(context, 20.0)),

                  InkWell(
                    onTap: () async {
                      var currentCameraPosition  = await _mapController.getCameraPosition();
                      var currentZoom = currentCameraPosition.zoom;
                      _mapController.moveCamera(
                        animation: const MapAnimation(
                          type: MapAnimationType.smooth,
                          duration: 0.25,
                        ),

                        CameraUpdate.zoomTo(currentZoom - 1),
                      );
                    },
                    child: Container(
                      width: adaptiveSize(context, 50.0),
                      height: adaptiveSize(context, 50.0),
                      padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/images/minus.png',
                      ),
                    )
                  ),

                  SizedBox(height: adaptiveSize(context, 30.0)),
                ],
              ),
            ),
          ),
        ),
        // ---

        // Navigation Button
        Align(
          alignment: Alignment.bottomRight,
          child: FractionallySizedBox(
            heightFactor: 0.5,
            child: Padding(
              padding: EdgeInsets.only(right: adaptiveSize(context, 20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: adaptiveSize(context, 30.0)),
                  InkWell(
                    onTap: () async {
                      _mapController.moveCamera(
                        animation: const MapAnimation(
                          type: MapAnimationType.smooth,
                          duration: 1,
                        ),

                        CameraUpdate.newCameraPosition(cameraPosition),
                      );
                    },
                    child: Container(
                      width: adaptiveSize(context, 50.0),
                      height: adaptiveSize(context, 50.0),
                      padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                      decoration: BoxDecoration(
                        color: AppColor.figmaColorLight,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/images/location.png',
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
        // ---

        // Placemark Info
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _animation,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  _animationController.reverse();
                }
              },
              child: isInfoVisible ? PlacemarkInformation(
                context: context,
                selectedPlacemark: selectedPlacemark,
              ).createPlacemarkContainer() : Container(),
            ),
          ),
        ),
        // ---
      ],
    );
  }

  void _openDrawer() {
    Scaffold.of(context).openDrawer();
  }
}
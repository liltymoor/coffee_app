import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:coffee_app/assets/elements/placemark_obj.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';


class PlacemarkInformation {
  final context;
  final selectedPlacemark;

  PlacemarkInformation({
    required this.context,
    required this.selectedPlacemark,
  });


  Container createPlacemarkContainer() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(adaptiveSize(context, 30.0)),
            topRight: Radius.circular(adaptiveSize(context, 30.0)),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 0.35,
        padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedPlacemark.name,
                          style: TextStyle(
                              fontSize: adaptiveSize(context, 20.0),
                              fontWeight: FontWeight.w800
                          ),
                        ),

                        GestureDetector(
                          onLongPress: () {
                            Clipboard.setData(ClipboardData(
                              text: selectedPlacemark.location
                            ));
                          },
                          child: Text(
                            '• ' + selectedPlacemark.location,
                            style: TextStyle(
                              fontSize: adaptiveSize(context, 12.0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                    )
                  ),

                  Spacer(),

                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Время работы:",
                            style: TextStyle(
                                fontSize: adaptiveSize(context, 12.0),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            selectedPlacemark.schedule,
                            style: TextStyle(
                                fontSize: adaptiveSize(context, 12.0),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ]
                      )
                  ),
                ],
              ),

              SizedBox(height: adaptiveSize(context, 20.0)),

              // Images Gallery
              Container(
                height: ((MediaQuery.of(context).size.width - adaptiveSize(context, 40.0)) / 3 - adaptiveSize(context, 15.0)) / 4 * 5,
                // padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedPlacemark.gallery.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: adaptiveSize(context, 7.5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0)),
                        child: AspectRatio(
                          aspectRatio: 4 / 5,
                          child: Image.network(
                            selectedPlacemark.gallery[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: adaptiveSize(context, 10.0)),
            ],
          ),
        ),
      );
  }
}
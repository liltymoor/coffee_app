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
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Object Name
              Text(
                selectedPlacemark.name,
                style: TextStyle(
                    fontSize: adaptiveSize(context, 24.0),
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: adaptiveSize(context, 16.0)),
              // ---

              // Images Gallery
              Container(
                height: adaptiveSize(context, 120.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedPlacemark.gallery.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: adaptiveSize(context, 10.0)),
                      child: Image.network(selectedPlacemark.gallery[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: adaptiveSize(context, 16.0)),
              // ---

              // Object Location
              GestureDetector(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(
                      text: ''
                  ));
                },
                child: Text(
                  selectedPlacemark.location,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: adaptiveSize(context, 16.0)
                  ),
                ),
              ),
              // ---

              // Schedule
              SizedBox(height: adaptiveSize(context, 16.0)),
              Text(
                selectedPlacemark.schedule,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: adaptiveSize(context, 16.0)
                ),
              ),
              // ---

              // Description
              SizedBox(height: adaptiveSize(context, 16.0)),
              Text(
                selectedPlacemark.description,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: adaptiveSize(context, 16.0)
                ),
              ),
              // ---
            ],
          ),
        ),
      );
  }
}
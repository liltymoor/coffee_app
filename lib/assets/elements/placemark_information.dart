import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/assets/elements/placemark_obj.dart';
import 'package:flutter/services.dart';


class PlacemarkInformation {
  final context;
  final selectedPlacemark;

  PlacemarkInformation({
    required this.context,
    required this.selectedPlacemark,
  });


  Container createPlacemarkContainer() {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Object Name
              Text(
                selectedPlacemark.name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 16),
              // ---

              // Images Gallery
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedPlacemark.gallery.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.network(selectedPlacemark.gallery[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
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
                      fontSize: 16
                  ),
                ),
              ),
              // ---

              // Schedule
              SizedBox(height: 16),
              Text(
                selectedPlacemark.schedule,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16
                ),
              ),
              // ---

              // Description
              SizedBox(height: 16),
              Text(
                selectedPlacemark.description,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16
                ),
              ),
              // ---
            ],
          ),
        ),
      );
  }
}
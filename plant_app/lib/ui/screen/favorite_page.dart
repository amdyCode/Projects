import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screen/widget/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  // add plant listasthe passed parameter
  final List<Plant> favoritedPlants;
  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // we write a ternary operator to check if the list is empty or not and return the appopriate widget
      // if the list is empty we return Center else we return Container
      body: widget.favoritedPlants.isEmpty ? 
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/favorited.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Your favorited Plants', style: TextStyle(
              color: Constants.primaryColors,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
          ],
        ),
      )
      : Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          height: size.height * .5,
          child: ListView.builder(
            itemCount: widget.favoritedPlants.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              // here we will return a plant widget we'll extract plantwidget in home_page.dart
              // the idea is to able reuse this widget in any projects
              return PlantWidget(index: index, plantList: widget.favoritedPlants);
          }),
      ),
    );
  }
}
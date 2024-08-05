import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screen/details_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.index, required this.plantList,
  });
  final List<Plant> plantList;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(child: DetailPage(
          // let's add the passed parameter to the detail page route
          plantId: plantList[index].plantId,
        ), type: PageTransitionType.bottomToTop));
      },
      child: Container(                    
        decoration: BoxDecoration(
          color: Constants.primaryColors.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
    
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColors.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
    
                Positioned(
                  bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 80.0,
                      child: Image.asset(plantList[index].imageURL),
                    ),
                ),
                Positioned(
                  bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantList[index].category),
                        Text(plantList[index].plantName, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColors,
                        ),),
                      ],
                    ),
                ),
              ],
            
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'$' + plantList[index].price.toString(),
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Constants.primaryColors,
              ),),
            ),
          ],
        ),
    
      ),
    );
  }
}
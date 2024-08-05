import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screen/details_page.dart';
import 'package:plant_app/ui/screen/widget/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    // creeons la liste du modele de la plante
    List<Plant> plantList = Plant.plantList;

    // listons les categories
    List<String> plantType = [
      'Recommanded',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    // button to toogle favorite and unFavorited
    bool toogleIsFavorited(bool isFavorited){
      return !isFavorited;
    }

    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // codons la barre de recherche
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    // we update the container size to 0.9
                    width: size.width * .9,

                    decoration: BoxDecoration(
                      color: Constants.primaryColors.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.black54.withOpacity(.6)),
                        const Expanded(child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Icon(Icons.mic, color: Colors.black54.withOpacity(.6)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            // let's code list category display
            // pass SizedBox to Container for space category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantType.length,
                itemBuilder: (BuildContext context, int index){

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        plantType[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index 
                              ? FontWeight.bold : FontWeight.w300,
                          color: selectedIndex == index 
                              ? Constants.primaryColors : Constants.blackColors,
                        ),
                      ),
                    ),
                  );

              }),

            ),
          
            // let's code the list category items
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){

                  // add onTap fonctionality to the plant Card changing widget Container to GestureDectector
                  // the idea is to display the details by tapping on an plant
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(child: DetailPage(
                        plantId: plantList[index].plantId,
                      ), type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColors.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                // sort the favorited button and fvorited function
                                onPressed: (){
                                  setState(() {
                                    bool isFavorated = toogleIsFavorited(plantList[index].isFavorated);
                                    plantList[index].isFavorated = isFavorated;
                                  });
                                }, 
                                icon: Icon(plantList[index].isFavorated == true 
                                ? Icons.favorite 
                                : Icons.favorite_border, color: Constants.primaryColors),
                                iconSize: 30,
                              ),
                              
                            )
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(plantList[index].imageURL),
                  
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plantList[index].category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                  
                                  ),
                                ),
                                Text(
                                  plantList[index].plantName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                              ],
                            )
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(r'$' + plantList[index].price.toString(), style: TextStyle(
                                color: Constants.primaryColors,
                                fontSize: 16,
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  );

              }),
            ),
            
            // let's code the new plants items list
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text('New Plants', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                  return PlantWidget(index: index, plantList: plantList,);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


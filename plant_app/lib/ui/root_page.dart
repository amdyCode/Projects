import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screen/cart_page.dart';
import 'package:plant_app/ui/screen/favorite_page.dart';
import 'package:plant_app/ui/screen/home_page.dart';
import 'package:plant_app/ui/screen/profile_page.dart';
import 'package:plant_app/ui/screen/scan_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // declare two empty lists
  List<Plant> favorites = [];
  List<Plant> myCart =[];
  // on cree la variable permettant de controler les pages ici cet variable n'est qu'un indice utilise pour realiser differents actions
  int _bottomNavIndex = 0;

  // on cree la liste contenant les widgets des pages
  // convert the page list to page widgets function
  List<Widget> widgetOptions(){
    return [
      const HomePage(),
      FavoritePage(favoritedPlants: favorites,),
      CartPage(cartPlants: myCart,),
      const ProfilePage(),
  ];
  }

  // liste contenant les icones des pages
  List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // liste contenant les titres des pages
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColors,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Constants.blackColors, size: 30.0),
          ],
        ),
        // definissons le background color de l'appbar comme le scaffold
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,

      ),
      // body contiendra les widgets des pages
      body: IndexedStack(
        index: _bottomNavIndex,
        // replace the list widget with the list widget function
        children: widgetOptions(),
        ),
      
      // mettons le bouton scan
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColors,
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // codons la bottom navigation bar
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColors,
        activeColor: Constants.primaryColors,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        // on cree cette fonction pour la b.n.b
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritedPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        },  
      ),
    );

  }
}
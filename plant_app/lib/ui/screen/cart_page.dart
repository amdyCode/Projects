import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screen/widget/plant_widget.dart';

class CartPage extends StatefulWidget {
  // add plant listasthe passed parameter
  final List<Plant> cartPlants;
  const CartPage({super.key, required this.cartPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.cartPlants.isEmpty ? 
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/add-cart.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Your cart is empty', style: TextStyle(
              color: Constants.primaryColors,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
          ],
        ),
      )
      : Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          height: size.height,
          // lets add the totals plane
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cartPlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    // here we will return a plant widget we'll extract plantwidget in home_page.dart
                    // the idea is to able reuse this widget in any projects
                    return PlantWidget(index: index, plantList: widget.cartPlants);
                }),
              ),
              Column(
                children: [
                  const Divider(thickness: 1.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Totals', style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      )),
                      Text(r'$110', style: TextStyle(
                        fontSize: 24.0,
                        color: Constants.primaryColors,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    );

  }
}
import 'package:flutter/material.dart';
import 'package:plant_app/Constants.dart';
import 'package:plant_app/ui/screen/signin_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen ({super.key});

  // ce qui vient apres les proprietes est appeles widget ex: child: Inkwell()

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController(initialPage: 0); // on cree une new intance de PageController avec la var _pageController
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text('Onboarding Screen'),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          
          Padding(

            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(

              onTap: (){
                // cela nous permettra de completer le boutton skip
                // here we edit the RootPage route to SignIn Page in the onboarding screen
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignIn())); // on place RootPage a la place de Login
              }, // permettra de se connecter à la page
              child: const Text('Skip', style: TextStyle(

                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,

              ),
              ),
            ),

            )

        ],

      ),

      body: Stack(

        alignment: Alignment.bottomCenter,
        children: [

          PageView(
            onPageChanged: (int page){
              setState(() {
                
                currentIndex = page;

              });
            },
            controller: _pageController,

            // on cree notre premiere page et on duplique en extractant du widget Container afin de rendre dynamique
            children: [
              
              // on ajoute les variables dans le widget createPage
              CreatePage(image: 'assets/images/plant-one.png',

                title: Constants.titleOne,
                description: Constants.descriptionOne,
              
              ),

              CreatePage(image: 'assets/images/plant-two.png',

                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              
              ),

              CreatePage(image: 'assets/images/plant-three.png',

                title: Constants.titleThree,
                description: Constants.descriptionThree,
              
              )
            ],

          ),
          
          // codons le generateur d'indicateur
          Positioned(
            
            bottom: 80,
            left: 30,
            child: Row(
              children:_buildIndicator(),

            ),),
            // creeons le bouton suivant
            Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.primaryColors,
                ),
                child: IconButton(onPressed: (){
                  setState(() {

                    if(currentIndex < 2){
                      currentIndex++;
                      // la on va a la derniere page si cette page est pas le dernier
                      if(currentIndex < 3){
                        _pageController.nextPage(
                          duration: const Duration(microseconds: 300), 
                          curve: Curves.easeIn
                        );
                      }
                    }
                    // on change de page si c'est la derniere de navigation a connexion
                    else{
                      Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (_)=> const SignIn()));
                    }
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.white),),
              ))
        ],
        
        ),
    );
  }
  
  // extraire les differents widgets

  // creeons une liste d'indicateur et placons le a l'interieur du widget principal
  List<Widget> _buildIndicator(){

    List<Widget> indicators = [];
    for(int i=0; i<3; i++){

      // verifions si le statut est active et return right AnimatedContainer indicator
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }
      else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;

  }
  }

class CreatePage extends StatelessWidget {

  // on declare les parametres final du widget et on les ajoute au constructeur
  // l'idee ici est de rendre le code plus dynamique
  final String image;
  final String title;
  final String description;
  const CreatePage({
    super.key, required this.image, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 350, child: Image.asset(image)),
          const SizedBox(height: 20),
          Text(title,  textAlign: TextAlign.center, style: TextStyle(
            
            color: Constants.primaryColors,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            
            ),),

          const SizedBox(height: 20),
          Text(description, textAlign: TextAlign.center,
          
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),)


        ],
        ),
    );
  }
}

// on cree le widget ou on decorera l'indicateur
Widget _indicator(bool isActive){

  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: isActive ? 20:8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: Constants.primaryColors,
      borderRadius: BorderRadius.circular(5),
    ),

    );
}


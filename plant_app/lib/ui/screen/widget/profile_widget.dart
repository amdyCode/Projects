import 'package:flutter/material.dart';
import 'package:plant_app/Constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileWidget({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // replace the static codewith the widget parameters
              Icon(icon, color: Constants.blackColors.withOpacity(.5), size: 24,),
              const SizedBox(
                width: 16,
              ),
              Text(title, style: TextStyle(
                color: Constants.blackColors,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Constants.blackColors.withOpacity(.4), size: 16,)
        ],
      ),
    );
  }
}
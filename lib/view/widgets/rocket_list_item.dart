import 'package:flutter/material.dart';
import 'package:rocketx/constants/app_constants.dart';
import 'package:rocketx/models/rocket.dart';

class RocketListItem extends StatelessWidget {
  final Rocket rocket;
  RocketListItem({required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: ListTile(
        title: Text(
          rocket.name ?? '',
          style: AppConstants.listItemTitleStyle,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (rocket.country != null)
              Text(
                'Country: ${rocket.country}',
                style: AppConstants.listItemSubtitleStyle,
              ),
            if (rocket.engineCount != null)
              Text(
                'Engines Count: ${rocket.engineCount}',
                style: AppConstants.listItemSubtitleStyle,
              ),
          ],
        ),
        trailing: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.network(
              rocket.flickrImages![0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

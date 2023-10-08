import 'package:flutter/material.dart';
import 'package:rocketx/constants/app_constants.dart';
import 'package:rocketx/models/rocket.dart';
import 'package:rocketx/utils/launch_url_utils.dart';
import 'package:rocketx/view/widgets/dialog_box_widget.dart';

class RocketDetailScreen extends StatelessWidget {
  // Method to open the Wikipedia link
  void _launchWikipedia(BuildContext context, url) {
    // print("Wiki Link is " + (url != null ? url! : ""));
    if (url != null) {
      LaunchUrlUtil.launchUrlInBrowser(url).catchError((error) {
        // print("Error");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
                title: "Error", message: 'Could not launch $url');
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rocket rocket = ModalRoute.of(context)!.settings.arguments as Rocket;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          rocket.name ?? '',
          style: const TextStyle(
            fontSize: 20, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Add bold style
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display rocket images in a horizontal scrollable list
            Container(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rocket.flickrImages?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      rocket.flickrImages?[index] ?? '',
                      width: 200, // Adjust the width as needed
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // Display rocket name and active status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    rocket.active == true ? 'Active' : 'Inactive',
                    style: TextStyle(
                      fontSize: 16,
                      color: rocket.active == true ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            // Display cost per launch, success rate percent, and description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rocket.description ?? '',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Cost per Launch: \$${rocket.costPerLaunch ?? 0}',
                    style: AppConstants.detailsSubtitleStyle,
                  ),
                  Text(
                    'Success Rate Percent: ${rocket.successRatePct ?? 0}%',
                    style: AppConstants.detailsSubtitleStyle,
                  ),
                  Text(
                    'Diameter : ${rocket.heightInFeet ?? 0} ft',
                    style: AppConstants.detailsSubtitleStyle,
                  ),
                  Text(
                    'Height: ${rocket.diameterInFeet ?? 0} ft',
                    style: AppConstants.detailsSubtitleStyle,
                    
                  ),
                  if (rocket.wikipedia != null && rocket.wikipedia!.isNotEmpty)
                    Text(
                      rocket.wikipedia!,
                      style: AppConstants.detailsurlStyle,
                  
                    ),
                 
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchWikipedia(context, rocket.wikipedia);
                },
                icon: const Icon(Icons.open_in_new), // Icon before the text
                label:const Text('Wikipedia'), // Text on the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}

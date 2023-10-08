class Rocket {
  String? name;
  String? country;
  List<String>? flickrImages;
  int? engineCount;
  double? heightInFeet;
  double? diameterInFeet;
  String? type;
  bool? active;
  int? costPerLaunch;
  int? successRatePct;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Rocket(
      {required this.flickrImages,
      required this.name,
      required this.type,
      required this.active,
      required this.costPerLaunch,
      required this.successRatePct,
      required this.country,
      required this.company,
      required this.wikipedia,
      required this.description,
      required this.id,
      required this.engineCount,
      required this.heightInFeet,
      required this.diameterInFeet});

  Rocket.fromJson(Map<String, dynamic> json) {
    if (json['height'] != null && json['height']['feet'] != null) {
      print(json['height']['feet']);
      heightInFeet = double.parse((json['height']['feet']).toString());
    }
    if (json['diameter'] != null && json['diameter']['feet'] != null) {
      diameterInFeet = double.parse((json['diameter']['feet']).toString());
    }
    if (json['engines'] != null && json['engines']['number'] != null) {
      engineCount = json['engines']['number'];
    }
    if (json['flickr_images'] != null) {
      flickrImages = json['flickr_images'].cast<String>();
    }
    name = json['name'];
    type = json['type'];
    active = json['active'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
}

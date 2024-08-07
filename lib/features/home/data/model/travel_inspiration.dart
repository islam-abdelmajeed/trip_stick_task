class TravelInspiration {
  final int id;
  final int sequence;
  final String type;
  final String? imageUrl;
  final String title;
  final String subTitle;
  final String? buttonTitle;
  final List<City>? list;

  TravelInspiration({
    required this.id,
    required this.sequence,
    required this.type,
    this.imageUrl,
    required this.title,
    required this.subTitle,
    this.buttonTitle,
    this.list,
  });

  factory TravelInspiration.fromJson(Map<String, dynamic> json) {
    return TravelInspiration(
      id: json['id'],
      sequence: json['sequence'],
      type: json['type'],
      imageUrl: json['image_url'],
      title: json['title'],
      subTitle: json['sub_title'],
      buttonTitle: json['button_title'],
      list: json['list'] != null ? (json['list'] as List).map((i) => City.fromJson(i)).toList() : null,
    );
  }
}

class City {
  final int cityId;
  final String title;
  final String subTitle;
  final String imageUrl;

  City({
    required this.cityId,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'],
      title: json['title'],
      subTitle: json['sub_title'],
      imageUrl: json['image_url'],
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/travel_inspiration.dart';

class HomeRepository {
  Future<List<TravelInspiration>> getPosts() async {
    try {
      final List<TravelInspiration> items = [];
      String jsonString = await rootBundle.loadString('assets/dynamicSectionsData.json');

      final Map<String, dynamic> data = jsonDecode(jsonString);

      for (var element in data['travel_inspiration']) {
        items.add(TravelInspiration.fromJson(element));
      }

      return items;
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}

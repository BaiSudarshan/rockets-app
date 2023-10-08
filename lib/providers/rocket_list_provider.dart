import 'package:flutter/material.dart';
import 'package:rocketx/models/rocket.dart';
import 'package:rocketx/services/rocket_service.dart';

class RocketListProvider extends ChangeNotifier {
  final RocketService _rocketService = RocketService();
  List<Rocket> _rockets = [];
  bool _isLoading = true;

  List<Rocket> get rockets => _rockets;
  bool get isLoading => _isLoading;

  Future<void> fetchRockets() async {
      _rockets = await _rocketService.fetchRockets();
    try {
      _isLoading = false;
    } catch (error) {
      _isLoading = false;
      print("Error While Fetching Rocket Details");
      print(error);
    } finally {
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:rocketx/models/rocket.dart';
import 'package:rocketx/services/rocket_service.dart';
import 'package:rocketx/view/widgets/rocket_list_item.dart';

class RocketListScreen extends StatefulWidget {
  const RocketListScreen({super.key});

  @override
  State<RocketListScreen> createState() => _RocketListScreenState();
}

class _RocketListScreenState extends State<RocketListScreen> {
  RocketService rocketService = RocketService();
  // final Future<List<Rocket>> _rocket = rocketService.fetchRockets();
  late List<Rocket> _rocket;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRocketList();
  }

  Future<void> getRocketList() async {
    _rocket = await rocketService.fetchRockets();
    setState(() {
      _isLoading = false;
    });
    // print("data Fetched");
    // print(_rocket.length);
    // print(_rocket[0].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            "SpaceX Rockets ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          )),
      body: Container(
        color: Colors.black87,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : (_rocket.isEmpty
                ?const Center(
                    child: Text(
                      "No rockets available.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: _rocket.length,
                    itemBuilder: (context, index) {
                      return RocketListItem(
                        rocket: _rocket[index],
                      );
                    })),
      ),
    );
  }
}

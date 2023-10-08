import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocketx/constants/app_constants.dart';
import 'package:rocketx/constants/routes.dart';
import 'package:rocketx/providers/rocket_list_provider.dart';
import 'package:rocketx/view/widgets/rocket_list_item.dart';

class RocketListScreen extends StatefulWidget {
  const RocketListScreen({super.key});

  @override
  State<RocketListScreen> createState() => _RocketListScreenState();
}

class _RocketListScreenState extends State<RocketListScreen> {
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("Did Change is called");
    if (_isInit) {
      print("Inside Init");
      // Init to Fetch Api Once Only After this init is false
      final RocketListProvider rocketProvider =
          Provider.of<RocketListProvider>(context);
      rocketProvider.fetchRockets();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshRockets() async {
    final RocketListProvider rocketProvider =
        Provider.of<RocketListProvider>(context, listen: false);
    await rocketProvider.fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "SpaceX Rockets ",
          style: AppConstants.appBarTitleStyle,
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Consumer<RocketListProvider>(
          builder: (context, rocketListProvider, child) {
            if (rocketListProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (rocketListProvider.rockets.isEmpty) {
              return const Center(
                child: Text(
                  "No rockets available.",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _refreshRockets,
                child: ListView.builder(
                  itemCount: rocketListProvider.rockets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.rocketDetails,
                          arguments: rocketListProvider.rockets[
                              index], // Pass the Rocket object as an argument
                        );
                      },
                      child: RocketListItem(
                        rocket: rocketListProvider.rockets[index],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

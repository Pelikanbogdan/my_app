import 'package:flutter/material.dart';
import 'package:my_app/data/foods.dart';

import '../widgets/shimmer.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  List<Food> foods = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 4), () {});
    foods = List.of(allFoods);
    setState(() => isLoading = false);
  }

  Widget buildFoodShimmer() => ListTile(
        leading: ShimmerWidget.circular(
          width: 64,
          height: 64,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: const ShimmerWidget.rectangular(height: 16),
        subtitle: const ShimmerWidget.rectangular(height: 14),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shimmer title'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: loadData, icon: const Icon(Icons.refresh)),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (isLoading) {
              return buildFoodShimmer();
            } else {
              final food = foods[index];
              return buildFood(food);
            }
          },
          itemCount: foods.length,
        ),
      ),
    );
  }
}

Widget buildFood(Food food) => ListTile(
      leading: CircleAvatar(
          radius: 32, backgroundImage: NetworkImage(food.urlImage)),
      title: Text(
        food.title,
        style: const TextStyle(fontSize: 16),
        maxLines: 1,
      ),
      subtitle: Text(
        food.description,
        style: const TextStyle(fontSize: 14),
        maxLines: 1,
      ),
    );

class Food {
  final String urlImage;
  final String title;
  final String description;
  const Food({
    required this.urlImage,
    required this.title,
    required this.description,
  });
}

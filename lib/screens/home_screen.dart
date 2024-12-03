import 'package:auxzon_task/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/string_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCategories(),
              _buildTopRatedFood(),
              _buildRestaurantsNearYou(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 250,
        color: const Color(0xFFD55049),
        padding: const EdgeInsets.all(16),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.location,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  AppStrings.placeText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              AppStrings.promoText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFD55049),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              child: const Text(AppStrings.orderNowText, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 3,
                width: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.red.shade200],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 0,
        child: Image.asset(
          'assets/image-8.png',
          width: 200,
          height: 350,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        bottom: -25,
        left: 16,
        right: 16,
        child: _buildSearchBar(),
      ),
    ],
  );
}

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            hintText: AppStrings.searchFoodText,
            prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
  final categories = [
    {'image': 'assets/rice-bowl.png', 'label': AppStrings.riceText},
    {'image': 'assets/paper-cup.png', 'label': AppStrings.snacksText},
    {'image': 'assets/wine-glass.png', 'label': AppStrings.drinksText},
    {'image': 'assets/application.png', 'label': AppStrings.moreText},
  ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories
            .map((category) => _buildCategoryItem(
                  image: category['image'] as String,
                  label: category['label'] as String,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildCategoryItem({required String image,  required String label}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color.fromARGB(255, 219, 212, 212),
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFEBEE),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image, width: 24, height: 24),
            ),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(fontSize: 12, color: Color(0xFFD55049))),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRatedFood() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            AppStrings.topRatedText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildFoodItem(
                context: context, 
                image: 'assets/image-2.jpg',
                name: AppStrings.burgerBeefText,
                restaurant: AppStrings.burgerBosText,
                price: 45.0,
                rating: (4.9),
              ),
              const SizedBox(width: 16),
              _buildFoodItem(
                context: context,  
                image: 'assets/image-4.jpg',
                name: AppStrings.cheeseMeatText,
                restaurant: AppStrings.pizzaStoreText,
                price: 45.0,
                rating: (4.9),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoodItem({
  required String image,
  required String name,
  required String restaurant,
  required double price,
  required double rating, required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      if (name == AppStrings.burgerBeefText) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
        );
      }
    },
  child:  Container(
    width: 180,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12),bottom: Radius.circular(12)),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 18,
              left: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 12),
                    const SizedBox(width: 2),
                    Text(
                      '(${rating.toStringAsFixed(1)})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  )
  );
}

  Widget _buildRestaurantsNearYou() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.nearRestaurantText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(AppStrings.viewAllText,
                style: TextStyle(color: Colors.grey),)
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFD55049),
      unselectedItemColor: Colors.grey,
      currentIndex: 2,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Color(0xFFD55049),
            child: Icon(Icons.home, color: Colors.white),
          ),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),
      appBar: const CustomAppBar(title: "Categories"),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 50),
        children: const [
          MainCategoryItem(image: "assets/images/seafood.png", text: "Seafood"),
          SizedBox(height: 16),
          CategoryRow(
            items: [
              CategoryItem(image: "assets/images/lunch.png", text: "Lunch"),
              CategoryItem(image: "assets/images/breakfast.png", text: "Breakfast"),
            ],
          ),
          CategoryRow(
            items: [
              CategoryItem(image: "assets/images/dinner.png", text: "Dinner"),
              CategoryItem(image: "assets/images/vegan.png", text: "Vegan"),
            ],
          ),
          CategoryRow(
            items: [
              CategoryItem(image: "assets/images/dessert.png", text: "Dessert"),
              CategoryItem(image: "assets/images/drinks.png", text: "Drinks"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: SvgPicture.asset(
            "assets/svg/vector.svg",
            width: 21,
            height: 14,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFFD5D69),
        ),
      ),
      actions: const [
        AppBarActionItem(image: "assets/svg/notification.svg", width: 12, height: 17),
        SizedBox(width: 5),
        AppBarActionItem(image: "assets/svg/search.svg", width: 14, height: 18),
        SizedBox(width: 20),
      ],
      centerTitle: true,
      backgroundColor: const Color(0xFF1C0F0D),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarActionItem extends StatelessWidget {
  final String image;
  final double width, height;

  const AppBarActionItem({super.key, required this.image, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainCategoryItem extends StatelessWidget {
  final String image, text;

  const MainCategoryItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            image,
            width: 356,
            height: 149,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image, text;

  const CategoryItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            image,
            width: 159,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  final List<CategoryItem> items;

  const CategoryRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 281,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFFD5D69),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavBarIcon("assets/svg/home.svg"),
            _buildNavBarIcon("assets/svg/community.svg"),
            _buildNavBarIcon("assets/svg/categories.svg"),
            _buildNavBarIcon("assets/svg/profile.svg"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarIcon(String assetPath) {
    return IconButton(
      icon: SvgPicture.asset(assetPath),
      onPressed: () {},
    );
  }
}

import "package:_2_2_recipe_book/data/recipes_data.dart";
import "package:_2_2_recipe_book/recipe_detail.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Project 2.2: Recipe Book",
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Project 2.2: Recipe Book")),
      body: ListView.builder(
        itemCount: recipesData.length,
        itemBuilder: (context, index) {
          final recipe = recipesData[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.restaurant_menu)),
            title: Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                await launchUrl(Uri.parse(recipe.url));
              },
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetail(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

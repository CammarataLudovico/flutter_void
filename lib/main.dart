import "package:_2_2_recipe_book/data/recipes_data.dart";
import "package:_2_2_recipe_book/recipe.dart";
import "package:flutter/material.dart";

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
          final Recipe r = recipesData[index];
          return ListTile(
            title: Text(r.name),
            onTap: () {},
          );
        },
      ),
    );
  }
}

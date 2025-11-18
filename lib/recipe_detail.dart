import "package:_2_2_recipe_book/recipe.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({required this.recipe, super.key});
  final Recipe recipe;

  Future<void> _openUrl(BuildContext context) async {
    final rawUrl = recipe.url.trim();

    final candidateUrl = rawUrl;
    final uri = Uri.tryParse(candidateUrl);

    await launchUrl(
      uri!,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ingredienti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...recipe.ingredients.map(
              (i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(i, style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preparazione",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (var i = 0; i < recipe.steps.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${i + 1}. ${recipe.steps[i]}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _openUrl(context),
              icon: const Icon(Icons.search),
              label: const Text("Apri link esterno"),
            ),
          ],
        ),
      ),
    );
  }
}

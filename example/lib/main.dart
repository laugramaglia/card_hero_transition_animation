import 'package:card_hero_transition_animation/card_hero_transition_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Hero Animation Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Card Hero Animation Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) => TestCardWidget(
          key: ValueKey(index),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TestCardWidget extends StatelessWidget {
  final BorderRadius borderRadius;

  const TestCardWidget(
      {super.key,
      this.borderRadius = const BorderRadius.all(Radius.circular(0))});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CardHeroTransitionAnimation(
        heroTag: key.toString(),
        childBig: ClipRRect(
            borderRadius: borderRadius,
            child: Card(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Center(child: Text('Test open card')),
              ),
            )),
        childSmall: Material(
          borderRadius: borderRadius,
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Hold to open'),
              ));
            },
            borderRadius: borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'test title',
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Time example',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text('description data',
                                style: Theme.of(context).textTheme.labelSmall),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.check_circle_outline,
                          size: 28,
                          color: Theme.of(context).colorScheme.primary)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

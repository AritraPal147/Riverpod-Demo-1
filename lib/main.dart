import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// To make providers available throughout the entire app,
/// we need to wrap the top of the widget tree with [ProviderScope].
void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Flutter Hooks Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  ));
}

/// [currentDate] is a provider of DateTime type
final currentDate = Provider<DateTime>(
  (ref) => DateTime.now(),
);

/// [HomePage] is a [ConsumerWidget] which can consume a provider
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  /// [date] watches [currentDate] and calls build function when
  /// [currentDate] is changed.
  ///
  /// Here, [currentDate] will not change because we have not provided
  /// any ticker or something similar to it. [currentDate] is currently
  /// caching the current date and time.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          date.toIso8601String(),
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

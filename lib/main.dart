import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:solid_test_task/pages/solid_task.dart';
/// The main function runs the application.
void main() {
  runApp(const Main());
}
/// The `Main` class is the root of the application.
class Main extends StatelessWidget {
  /// The key for this widget.
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Builder function for the `Sizer` widget. To use screen size as value.
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Solid Test Task',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          /// The home page of the application.
          home: const SolidTask(),
        );
      },
    );
  }
}

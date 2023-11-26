import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Popup Menu Example'),
          actions: [
            // This is the button that will trigger the custom popup menu
            IconButton(
                  padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.menu),
              onPressed: () {
                // This is the function that will show the custom popup menu
                showCustomPopupMenu(context);
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Tap on the menu icon in the app bar'),
        ),
      ),
    );
  }
}

// This is the function that will show the custom popup menu
void showCustomPopupMenu(BuildContext context) {
  // This is the list of options that will be displayed
  final List<String> popupRoutes = ['Properties', 'Delete', 'Leave'];

  // This is the widget that will have a triangular shape and contain the options
  final Widget shapedWidget = Material(
    clipBehavior: Clip.antiAlias,
    shape: const ShapedWidgetBorder(),
    elevation: 4.0,
    child: Container(
      padding: const EdgeInsets.all(4.0).copyWith(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: popupRoutes.map((String popupRoute) {
          return ListTile(
            leading: const Icon(Icons.visibility),
            title: Text(popupRoute),
            onTap: () {
              // This is the callback function that will be executed when an option is selected
              print('You selected $popupRoute');
              // This is how you close the custom popup menu after selecting an option
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    ),
  );

  // This is how you show the custom popup menu using the showMenu function
  showMenu(
    context: context,
    position: const RelativeRect.fromLTRB(140.0, 60.0, 100.0, 100.0),
    items: [
      PopupMenuItem(
        child: shapedWidget,
      )
    ],
  );
}

// This is the class that defines the triangular shape of the custom popup menu
class ShapedWidgetBorder extends RoundedRectangleBorder {
  const ShapedWidgetBorder({
    side = BorderSide.none,
    borderRadius = BorderRadius.zero,
  }) : super(side: side, borderRadius: borderRadius);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.width - 8.0, rect.top)
      ..lineTo(rect.width - 20.0, rect.top - 16.0)
      ..lineTo(rect.width - 32.0, rect.top)
      ..addRRect(borderRadius
          .resolve(textDirection)
          .toRRect(Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height - 4.0)));
  }
}

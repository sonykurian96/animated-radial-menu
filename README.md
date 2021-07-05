# animated_radial_menu

The package provides an easy way to work with radial menu along with animations.
 
![example](https://user-images.githubusercontent.com/67534990/124471528-98137680-ddba-11eb-91dc-c5d91053b3ed.gif)

You can check out the example [here](https://github.com/sonykurian96/animated-radial-menu/blob/master/example/lib/main.dart)
## Installation

[example](https://github.com/sonykurian96/animated-radial-menu/blob/master/example/lib/main.dart)

To use this package : add the dependency to your pubspec.yaml file

```yaml
   dependencies:
     flutter:
       sdk: flutter
     animated_radial_menu:
```

## Basic Usage

Import it to your project file

```dart
  import 'package:animated_radial_menu/animated_radial_menu.dart';
```

Similar to column or row widget, simply pass in buttons as children and you are done
```dart
  RadialMenu(
     children: [
         RadialButton(
           icon: Icon(Icons.ac_unit),
           onPress: () => print("ac unit"),
         )
     ]
 ),
```

Eventhough you can use this widget anywhere, it's recommended to use RadialMenu with Stack Widget if your page contains tons of UI elements

```dart
     body: Stack(
          children: [
            RadialMenu(
              children: [
                RadialButton(
                  icon: Icon(Icons.ac_unit),
                  buttonColor: Colors.teal,
                  onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.camera_alt),
                    buttonColor: Colors.green,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.map),
                    buttonColor: Colors.orange,
                    onPress: () => Get.to(TargetScreen())),
                                 
                /* you can add any number of buttons, although it's 
                  not recommended to insert beyond 8-9 buttons. */
              ],
            ),
            
            // rest of the widgets....

          ],
        ),
```

You can manually position the widget wherever you wish
```dart
   RadialMenu(
    centerButtonAlignment: Alignment(0.3,0.5) // by default alignment set to Alignment.center
   )
```

You can also customize the main centered button(more customizations will be made available soon)
```dart
   RadialMenu(
        centerButtonSize: 0.5, // size ranging from 0.0 to 1.0
   )
```

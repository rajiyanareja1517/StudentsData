
# Students Data Project

A Students Data project created in flutter. Students Data supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/StudentsData
 

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/StudentsData.git
```

## StudentsData Features:

#### Home
  * The home page is essential for capturing the attention of potential customers and providing a seamless shopping experience.

#### Add student info
 * Users can add students details to desplay on home
 
#### Pick images
* pick student image from camara or gallery
  
#### Update student
 * User can edit student info.

#### Delete student
 * User can delete student info.
   
### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- assets/
|- model/
|- screens/
|- utils/
|- main.dart
```

### screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- add_std_data.dart
|- Home_page.dart
|- splash_screen.dart
```

### utilities

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- globles.dart
    

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:flutter/material.dart';
import 'package:students_data/screens/add_std_data.dart';
import 'package:students_data/screens/home_page.dart';
import 'package:students_data/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const HomePage(),
          'add_std': (context) => const AddStdData(),
          '/': (context) => const SplashScreen(),
        },
        );
  }
}

```


https://github.com/rajiyanareja1517/StudentsData/assets/165259303/25e0f7f9-f379-4d06-bb49-3ff1398c8056




![Frame 1](https://github.com/rajiyanareja1517/StudentsData/assets/165259303/8d2074f8-1ac2-4672-99de-43289ed0a1dc)


## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

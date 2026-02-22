# Jobsheet 1 - Mobile Programming: The Foundation of Modern Application Development

In this jobsheet I learned how to install Android Studio and Flutter SDK. I also learned how to create my first new project using Dart (Flutter) using Visual Studio Code as a text editor, assisted by the Flutter plugin in VS Code. In a new Dart project, by default, a fairly neat folder structure is provided with a bin, lib, and readme file folder. I also learned to create a Hello World program and create a simple function that calculates the area of ​​a triangle and calls it in the main code in the bin folder. As a result, when the main code/program is run in the terminal using the Dart Run command, the results of Hello World and my simple function calculations can be displayed correctly.

## Work constraints

While trying to create a simple function and save it in the lib folder, I ran into an issue when trying to call the function file. Initially, I used the following code:

```bash
import 'package:luas_segitiga/luas_segitiga.dart' as luas_segitiga;
```

However, it turns out that structurally, my code is wrong and the correct one is like this:

```bash
import 'package:dart_application_1/luas_segitiga.dart' as luas_segitiga;
```

## PBL Idea

We plan to create an inventory management application. This application will utilize Shopee's API and retrieve inventory and sales data. The application will have additional features such as displaying sales statistics and store product inventory.

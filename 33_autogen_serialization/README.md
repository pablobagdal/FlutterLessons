# autogen_serialization

A new Flutter project.

## How it works
In the project there used two main libraries: json_serializable and build_runner.
Add them to dependencies in pubspec.yaml:
    `
    dependencies:
      json_serializable: ^6.3.1
      build_runner: ^2.2.0

When you create the project, you don't have generated files. So for that reason you will have errors because you use 
`part \'office.g.dart\'` when you actually don't have it.
    `
To generate files with objects from JSON, use command:
    flutter pub run build_runner build --delete-conflicting-outputs

After that they should be generated in same folder with classes which call them


Usefull link [Json to Dart](https://javiercbk.github.io/json_to_dart/)
The app fetches the current location in Cairo showing the temperature, condition, wind speed and humidity.
Architecture used is MVVM.

Technology stack used:-
-SwiftUI
-Combine
-Async await
-URLSession
-Unit testing

For DI I used the composition root patternt being at the start point of the app to inject the dependencies.
The project is scalable and allows, for example, for using remote and local services, thanks to the use of generic protocols.

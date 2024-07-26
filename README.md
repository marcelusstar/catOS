# Cat App

## APP UNDER CONSTRUCTION, NOT FINISHED YET

## Description

This is a project made using public api https://thecatapi.com/. THIS IS NOT AN OFFICIAL APP from TheCatApi.

## Structure

In this project, I utilize the **async/await** syntax for handling network request, enhancing code readability and maintainability by simplifying asynchronous operations and reducing the need for complex callback handling.

Mainly **SwiftUI** is used instead of UIKit, leveraging SwiftUI's declarative syntax to create a more intuitive and efficient user interface development experience.

I have adhered, or at least I tried, to **clean code principles** to enhance readability, maintainability, and overall code quality. For example, for network requests there are three files: ApiRouter, where is all requests information; RequestManager, where is the code to make the requests; and ApiManager, with the all the api methods with its parameters.

This project is structured using the **MVVM** (Model-View-ViewModel) architectural pattern to promote a clear separation of concerns, enhance testability, and improve code maintainability.

## How to run

Just download and compile, no dependencies are required.

## Api Key

You need an api key from https://thecatapi.com/. You can register and get one from it. Currently this project is using de demo api key: **DEMO-API-KEY**

You can replace the demo api key by yours at ApiRouter.swift file 
```
        // Replace the default value
        let apiKey: String? = "DEMO-API-KEY"
```


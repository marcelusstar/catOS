# Cat App

## APP UNDER CONSTRUCTION, NOT FINISHED YET

## Description

This is a project made using public api https://thecatapi.com/. THIS IS NOT AN OFFICIAL APP from TheCatApi.
This is my first project using SwiftUI, so please, if you see some sacrilege forgive me.

## HOW TO RUN

You need an api key from https://thecatapi.com/. You can register and get one from it.
Alternatively you can use the demo app: **DEMO-API-KEY**

When you download the project one file will be missing, Config.xcconfig, where the sensitive information is stored. This file is excluded from repository, so you can delete it or create one adding
```API_KEY = example_of_your_api_key"```

If you have chosen to delete Config.xcconfig, add the api key in ApiRouter.swift, at 
```
let apiKey: String? = (plistData?["API_KEY"] as? String) ?? "YOUR_OWN_API_KEY_IF_NOT_FOUND"
```


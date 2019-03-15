# CryptoApp

A Beginner Flutter project.

## Getting Started

This project is aimed at beginners in flutter.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## What You'll learn

The app uses the **MVP Architecture**.

* Model - In an application with a complete layered architecture, this model would only be the gateway to the domain layer or business logic.
* View - The only thing that the view will do is calling a presenter method every time there is a user action (a button click for   example).
* Presenter - The presenter is responsible to act as the middleman between view and model. It retrieves data from the model and returns it formatted to the view

> Visit here for a detailed explanation on MVP: <https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter>

# Sakay.ph Jeepney App

A Simple MVP Flutter Project for 6ADET Midterms

Welcome to the GitHub repository for the Sakay.ph Jeepney App, a mobile application developed in Flutter. This project was created to provide a simple, offline-first tool for commuters to navigate jeepney routes within Angeles City.

#
### Project Description
The Sakay.ph app aims to solve the common challenge of finding a jeepney route in an unfamiliar area. By leveraging an on-device, self-contained database, the app offers key functionalities without requiring an internet connection. Users can browse a comprehensive list of all routes or visualize a selected route on an interactive map. This project also includes an optional feature to recommend routes based on a user's chosen destination.

#
### Core Features
* **Interactive Map**: Utilizes `flutter_map` to display jeepney routes as polylines and stops as markers.
* **Routes List View:** A clean and scrollable list of all available jeepney routes.
* **Local Data Storage:** All route data is stored persistently on the device using `shared_preferences`.
* **Route Recommendation Engine:** (Optional) An algorithm to find and recommend the most suitable route based on proximity to a user-defined destination.

#
### Getting Started
To get a local copy of the project up and running, follow these simple steps.
1. **Clone the repository:**
`git clone https://github.com/[your-github-username]/sakay_ph.git`

2. **Navigate to the project directory:**
`cd sakay_ph`

3. **Install dependencies:**
`flutter pub get`

4. **Run the app:**
`flutter run`

#
### Project Structure & Architecture
Our project follows a **Model-View-ViewModel (MVVM)** architecture to ensure a clear separation of concerns, which enhances maintainability and scalability.
* **Model:** *Handles data logic and structure (`data/models/`).*
* **View:** *The UI layer (`presentation/`).*
* **ViewModel:** *Manages the state and business logic.*

The codebase is organized using a **feature-based folder** structure to keep related files together.

#
### Contributing
We welcome contributions to this project. To ensure a smooth collaboration, please follow our **Feature Branch Workflow.**
* **Branch:** *Create a new branch from main for your feature or bug fix.*
* **Commit:** *Write clear, concise commit messages.*
* **Pull Request:** *Open a pull request to merge your branch into main and request a review from a team member.*

#
### Authors
* Luiz Angelo Ropero - *Project Lead, Core Navigation*
* Shan Harvey Arcuino - *UI/UX Designer and Visual Assets*
* Christine Francoise Gurango - *Frontend Developer*
* Alexia John Pamintuan - *Quality Assurance, Final Polish, and Visual Integration*


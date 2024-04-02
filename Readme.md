
# Jobicy

An iOS application that utilizes the Jobicy API to display a list of jobs.


## Features

- Display a list of jobs retrieved from the Jobicy API.
- A feature to select a job as favorite or remove from list. 
- Developed using Swift, MVVM (Model-View-ViewModel) architecture, Moya for networking, and SnapKit for layout constraints.


## Tech Stack

**Swift:** The programming language used to develop the iOS application.

**MVVM:** An architectural pattern that separates the concerns of data presentation, business logic, and data modeling.

<img src="/jobicy/Resources/MVVM.png" alt="Screenshot 1" width="500" />

- Model: 
    - Represents the data and business logic of the application
    - Encapsulates the data and behavior that the application operates on.
    - Notifies observers about changes in the data.
- View: 
  - Represents the user interface and its visual elements.
  - Displays the data to the user.
  - Passes user input to the ViewModel.
- ViewModel
    - Acts as a mediator between the Model and the View.
    - Contains the presentation logic, transforming the data from the Model into a form suitable for the View.
    - Reacts to user input from the View, updating the Model and triggering UI updates.

**Moya:** A network abstraction layer that simplifies network requests and API communication.
<img src="/jobicy/Resources/moya.png" alt="Screenshot 1" width="500" />

**SnapKit** A Swift DSL (Domain-Specific Language) for Autolayout, making it easier to define constraints programmatically.


## Usage

1- Launch the application on your iOS device or simulator.

2- Explore the list of jobs.



## Requirements
- **Xcode:** [Download Xcode](https://developer.apple.com/xcode/)
- **Cocoapods:** Dependency manager for Swift and Objective-C projects. Install using `sudo gem install cocoapods`

## Run Locally

Clone the repository:
```bash
  git clone https://github.com/YaserBahrami/jobicy
```
Navigate to the project directory:
```bash
  cd jobicy
```
Install dependencies using Cocoapods:
```bash
  pod install
```
Open the project in Xcode:
```bash
  open jobicy.xcworkspace
```

## Screenshots

<div style="display: flex; justify-content: space-between;">
    <img src="/jobicy/Resources/JobsList.png" alt="Screenshot 1" width="200" />
    <img src="/jobicy/Resources/FavoriteList.png" alt="Screenshot 2" width="200" />
</div>


## License

This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license



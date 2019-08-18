# StudyBuddy

StudyBuddy is an iOS app that is designed to help you connect with other students to study together. Once you sign up, you can instantly message people across the network to get studying.

## Functionality

* Create or join as many study groups as you need
* Course name, location, availability, number of people allowed in the group, and subject as inputs, stored in Google Cloud server
* Messaging platform to enable real-time chat, stored in server
* Profile shows which study groups you're involved in

# Screenshots

### Home screen

<img width="340" alt="home" src="https://user-images.githubusercontent.com/50306692/57203165-ab78ec00-6f7b-11e9-85d0-cc11eb2c0fa2.png">

### Creating a new account

<img width="340" alt="createnewacc" src="https://user-images.githubusercontent.com/50306692/57203459-3eb32100-6f7e-11e9-8567-c000c91b876d.png">

### Login screen

<img width="340" alt="loginacc" src="https://user-images.githubusercontent.com/50306692/57203466-4d013d00-6f7e-11e9-9f8c-14ba8d347544.png">

### Menu

<img width="340" alt="createjoin" src="https://user-images.githubusercontent.com/50306692/57203185-e844e300-6f7b-11e9-91e6-a390b5391f36.png">

* "My Groups" button on the navigation bar takes the user to My Study Groups page when pressed

### Creating a group

<img width="345" alt="creategroup" src="https://user-images.githubusercontent.com/50306692/57203476-64d8c100-6f7e-11e9-93c5-cfd211eca5e2.png">

### List of existing groups

![joingroup](https://user-images.githubusercontent.com/50306692/57205749-b2f5c080-6f8e-11e9-8d1c-788ac4445eba.png)

### User profile

(Also goes to this page after the user creates a new group)

![groups](https://user-images.githubusercontent.com/50306692/57205715-6611ea00-6f8e-11e9-9fa6-2a18286dcdb2.png)

* "Join Groups" button on the navigation bar takes the user to Join Group page when pressed

### Messaging platform

(Takes user to this page when they press on a group)

<img width="340" alt="thread" src="https://user-images.githubusercontent.com/50306692/57203231-4a9de380-6f7c-11e9-8723-b0c5e1e1d6fa.png">

* "+ Join Group" button on the navigaton bar adds the user to the study group when pressed

## Project submission info

### iOS - Frontend requirements

* App contains AutoLayout using NSLayoutConstraints
* UITableView was used to display groups in Join Groups and My Study Groups page
* UINavigationController was used to navigate between different screens
* Integrated custom API written by backend members

### Backend requirements

* Custom API - independent of outside API implementations. Here's the [link](https://paper.dropbox.com/doc/StudyBuddy-API-Spec--Acm9xqEGue3DFQSB5FX_g7WXAQ-vZNERrz3DgWPbcOnDPYze) to the spec.
* Developed in python, using [Flask_SQLAlchemy](https://github.com/pallets/flask-sqlalchemy).
* Models of Users, Groups, and Messages coded with many-to-many relationships to each other.
* Server deployed on Google Cloud. ~~http://35.196.189.184~~ Link is broken at the moment--will be fixed soon.

## Additional info
Food for thought! (future/possible implentations):
* Enable Facebook or Google login via API integration
* Integrate Google Calendar API for universal, wider functionality
* Create group chat functionality
* Display the current members in the group
* Implement text-checking mechanism to filter invalid inputs

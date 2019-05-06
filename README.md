# StudyBuddy

Find your study buddies to study for your courses!

# Screenshots :)

### homescreen:

<img width="340" alt="home" src="https://user-images.githubusercontent.com/50306692/57203165-ab78ec00-6f7b-11e9-85d0-cc11eb2c0fa2.png">

### creating a new account:

<img width="340" alt="createnewacc" src="https://user-images.githubusercontent.com/50306692/57203459-3eb32100-6f7e-11e9-8567-c000c91b876d.png">

login screen:

<img width="340" alt="loginacc" src="https://user-images.githubusercontent.com/50306692/57203466-4d013d00-6f7e-11e9-9f8c-14ba8d347544.png">

the user has the choice to either create a group or join an exisiting group:

<img width="340" alt="createjoin" src="https://user-images.githubusercontent.com/50306692/57203185-e844e300-6f7b-11e9-91e6-a390b5391f36.png">

* My Groups button on the navigation bar takes the user to My Study Groups page when pressed

creating a group:

<img width="345" alt="creategroup" src="https://user-images.githubusercontent.com/50306692/57203476-64d8c100-6f7e-11e9-93c5-cfd211eca5e2.png">

exiting groups that users can join:

<img width="340" alt="groups" src="https://user-images.githubusercontent.com/50306692/57203195-07dc0b80-6f7c-11e9-881b-3bf16f3012b6.png">

study groups that the user is a part of (also goes to this page after the user creates a new group):

<img width="340" alt="mygroups" src="https://user-images.githubusercontent.com/50306692/57203228-47a2f300-6f7c-11e9-831a-1db75461065e.png">

piazza style "chat"/ "thread" where members of the groups can talk to eachother (takes user to this page when they press on a group):

<img width="340" alt="thread" src="https://user-images.githubusercontent.com/50306692/57203231-4a9de380-6f7c-11e9-8723-b0c5e1e1d6fa.png">

* Join Group button on the navigaton bar adds the user to the study group
## Description

Are you sitting the stacks or in your dorm alone wishing you had someone to help you with that hard question on your practice test? No worries, StudyBuddy has your back! Studybuddy allows users to either create or join study groups based on the course and what they are trying to study for (prelims, finals, etc). When creating a study group, the user can input the course name, location where the studying will take place, the days of the week when they are free, the maximum number of people in the group, and what they are specially trying to study for; there is also an option to join exisiting groups based on their needs. Within the groups, there will be a chat system where the members of the group can figure out the details of their study sessions. The groups that the user either creates or joins will show up under "my groups" for convenient access. 

Now, you will always have friends to help ace your courses and get that 4.0 you deserve! 


## Requirements

### iOS

* App contains AutoLayout using NSLayoutConstraints
* UITableView was used to display groups in Join Groups and My Study Groups page
* NavigationController was used to navigate between different screens
* Integrated custom API written by backend members

### Backend

* We made a custom API without incorporating any outside API implementations. Here's the link to the Spec:
https://paper.dropbox.com/doc/StudyBuddy-API-Spec--Acm9xqEGue3DFQSB5FX_g7WXAQ-vZNERrz3DgWPbcOnDPYze

We used Flask_SQLAlchemy and modeled our databases of Users, Groups, and Messages with their respective relationships to each other.
* We deployed our server on Google Cloud. http://35.196.189.184

## Additional info
Future/ possible implentations:
* connect account to facebook or google 
* connect google calendar to display the "study times" for the study groups they are in
* create a functioning "chat"/ "thread" for the groups
* page to display all the current members in the group
* implement a check system in create groups to make sure the user is not leaving any textfields blank 
* display error message when the user leaves any textfields empty in create new account & create groups


In this tutorial we are going to present 3 versions of ONEm's #post application. The apps are written using the Django framework ONEm's Python SDK.

- **postv1** - a stripped down version of the service; we will be able to create, store and view posts
- **postv2** - on top of v1, we will now add a Search wizard so we can search by keyword/code in all saved posts (ours or others)
- **postv3** - on top of v2, we will enable interactions with ONEm's restdAPI

For prerequisites and running any of the 3 apps locally please refer to: [prerequisites](/geting_started/) and [run locally](/gettin_started/python_run_local/) tutorials.


Notes: 

1) The project containing these 3 apps can be cloned from here: [**post-demo-app**](https://github.com/ONEmCommunications/post-demo-app)

2) We will only need to create one virtualenv, containing the packages listed in the requirements.txt file in the project's root folder and this virtual env will be used by all 3 versions of the app.

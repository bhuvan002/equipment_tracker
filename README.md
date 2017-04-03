# Equipment Tracker

This is the sample application for the Equipment Tracker.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Using the application
Sign up as a lab owner on `/lab_owners/sign_up`
Sign up as a store manager on `/store_managers/sign_up`
Sign up as a super user (mainly HOD) on `/super_users/sign_up`

Log in using the credentials on `/users/sign_in`
You can then view the dashboard and carry out the tasks that you are authorized to do

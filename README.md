# Elm App Template

The point of this project is to provide an easy way for people to start making android apps with Elm.

Reminder that this uses Elm and JavaScript which means if you know neither, it might be a bad way to start new projects for you. I recommand [reading about Elm](https://guide.elm-lang.org) first. This project even uses Perl, if you're not familiar with perl, use the scripts as recommended, if you want to do more, you would have to learn more or write them in your language of choice.

## To run

To use this, for convenience, you should really install perl if you don't have it, or work on mac or linux.

Use Init.pl to start the React-Native project with the App Name of your choice. I've heard there are restrictions in iOS for renaming so be careful. This will create a config/project_name, be sure to never delete this, it will be used for StartAndroid.pl to work. If you delete it, you will have to either add it or modify Start Android.

Use CompileElm.pl to compile your app to the public folder as 'app.js'. Note that it is possible to send compiler arguments to this script on run:
```
./CompileElm.pl --optimize
```

Use StartAndroid.pl to run android, this will copy the files in the public server over to the assets and get android ready for you.

## Important
This project is loosely based on the [Uno Platform](https://platform.uno/)


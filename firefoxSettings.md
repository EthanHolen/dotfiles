# Firefox settings edit

1. Go to about:config
   1. Change toolkit.legacyUserProfileCustomizations.stylesheets to true
2. Go to about:support
   1. open "Profile Folder"
   2. open highlighted folder
      1. Create new folder "chrome"
      2. create new file "chrome/userChrome.css"
      3. put this code in

```
/* hides the native tabs */
#TabsToolbar {
  visibility: collapse;
}
```
3. quit and reopen Firefox



> optional code to make room for top buttons
```
/* hides the native tabs */
#TabsToolbar {
  visibility: collapse;
}

/* leaves space for the window buttons */
#nav-bar {
    margin-top: -8px;
    margin-right: 74px;
    margin-bottom: -4px;
}
```
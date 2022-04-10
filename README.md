# NotesApp

## NotesApp is an iOS application that was built in order to experiment with Persistence with SwiftUI. 

It allows the user to create and edit simple notes (title and content), making sure that the files persist even after the app is restarted.
For this, the iOS File Manager is used as we are saving an array of Notes consisting of a title and content.  Whenever the notes change, the array is encoded into a JSON file which is then saved through the File Manager. When the app is re-opened, the same JSON file is decoded and its contents are assigned to the array of Notes.

https://user-images.githubusercontent.com/90060036/162629642-088b2c01-c8c3-4569-b7e8-cfbb1ba838e1.mov


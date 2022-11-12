# 🎧 iTunesTestTask
Application for finding music albums. Implemented user registration, login to the application by email and password. iTunes API is used.

## 📲 Now let's see how this application works:

After downloading the application, the user is taken to the main screen, which contains the SignIn and SignUp buttons.

<img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/MainScreen.png" alt="Main screen" style="height: 800px;"/>

<br />

On the registration screen, the user needs to enter the first name, last name, date of birth, phone number, email and password. All fields are required and validated using regular expressions (name and surname must be written in Latin letters, age over 18 years old, phone number implemented using a mask in the Belarusian format; at least 8 characters in the password, one capital letter, one lowercase letter and at least one digit or symbol). If at least 1 field is not filled or not valid, then the user will not be able to register.

<body>
  <p>
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/SignUpScreen.png" alt="Sign up screen" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/TextFieldsValidation.png" alt="Text fields validation" style="height: 800px;">
  </p>
 </body>

If all the information is entered correctly, then the top label will display that the registration was completed successfully.

<img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/RegistrationCompleted.png" alt="Registration completed" style="height: 800px;"/>

<br />

Further, the user can already enter the application by entering the correct email and password on the main screen. At this stage, the validation of the entered data is also carried out. User data is saved in userDefaults.

After a successful login, the user is taken to a screen with a search for music albums. After searching for a keyword, the result will be shown. Each cell of the table contains the name of the artist, album, and the number of tracks in the album.

By clicking on a table cell, the user is taken to a screen with detailed information about the selected album: album name, artist, album release year, number of tracks and their list, as well as an enlarged logo.

<body>
  <p>
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/AlbumsSearching.png" alt="Albums searching" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/AlbumScreen.png" alt="Album screen" style="height: 800px;">
  </p>
 </body>

On the album search screen, in the upper right corner there is a button with personal information about the user. There is all the information that the user entered at the registration stage.

<body>
  <p>
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/UserButtonActive.png" alt="User button active" style="height: 800px;">
    <img src="https://raw.githubusercontent.com/Scooterminsk/iTunesTestTask/main/Screenshots/UserInfoScreen.png" alt="User info screen" style="height: 800px;">
  </p>
 </body>

## 🎉 Thanks for reading the documentation, now you can check the project files.

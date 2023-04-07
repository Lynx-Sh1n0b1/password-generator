# password-generator
Tiny Bash Random Password Generator
The script is a random password generator written in Bash. 
The user is asked how long they want the password to be and whether they want to include letters only, letters and numbers, or letters, numbers, and symbols. 
The password length is restricted to be between 5 and 32 characters.
The script then uses /dev/urandom to generate a random 7 passwords based on the user's preferences. 
The user is then asked whether they want to generate another password. 
If they choose yes, the script will generate seven new passwords and display them.
If they choose no, the script will exit with a "Goodbye" message.
The output of the script is colorized in blue and yellow for easy visibility. 

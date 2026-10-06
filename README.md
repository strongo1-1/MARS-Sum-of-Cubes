# MARS-Sum-of-Cubes
Program written in Assembly using the MARS simulator.
Program prompts the user to input an integer value between 1 and 5 inclusive. If the user inputs an integer greater than 5 or less than 1, the program prompts an error message and asks the user to try again. This process is repeated until the user enters a valid integer, n. Then the program outputs the sum of the cube of the numbers from 1 to n and displays the result on the console.
For example, when the input integer is 3, the result is 36 (which is 1^3 + 2^3 + 3^3).

Example Console Interaction:
Please input the integer: 6
!!!Invalid, try again
Please input the integer: 3
The result is: 36

The program allows at most 3 invalid attempts, then displays the error message "Too many invalid attempts. Program terminated." and exits the program.

Example Console Interaction:
Please input the integer: 6
!!!Invalid, try again
Please input the integer: 0
!!!Invalid, try again
Please input the integer: 12
Too many invalid attempts. Program terminated.

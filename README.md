# NorthTicTacToe
Tic Tac Toe game in Swift on IOS. Simple 3x3 implementation with sound effects. The game is standard 1v1 human versus human. 

## How to Run
1. Download the zip folder or clone the repository.
2. Open the project file in XCode.
3. Run the project on your IOS device of choice. There shouldn't be anything to setup. (Volume on for effects)

## Assumptions/Considerations
* Utilized MVC design pattern
* Initially considered creating themes, however the button implementation as images resulted in non-transparent backgrounds and that would ruin the UI if background themes were put in.
* Considered 4x4 and 5x5 game options, however did not think it would show enough coding capability and instead would show I can work with a larger array. Scratched because I didn't think the benefit was enough
* Considered changing the tictactoe game formula (ex: throwing in "powerups" or additional things that could shake up the game) but scratched due to time
* I believe everything is fairly straightforward in its design. Please let me know if you have further questions about choices that were made.

## Limitations/Things not included
* UI Tests: I was having problems creating UI tests and identifying the buttons that I wanted as objects to be modified/tapped. Moved UI tests out of scope for this project.
* UI Modifications/themes: Due to the button implementation with non-transparent backgrounds the consideration of UI themes was removed. 
* Failed to debug a more efficient/better method of resetting all the buttons, currently commented out in the code.

I realize it may be a surprise that I chose IOS, however within the past 6 months I have primarily been working with IOS code when I work on mobile and therefore felt in the moment I had a better grasp of Swift and that it would meet the needs of the challenge

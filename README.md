# T1A3 Terminal Application
Card Game Application
By Christopher Murray Gibson 2020

# Index
| |
| - |
|[Software Development Plan](#software-development-plan)|
|[Purpose and Scope](#purpose-and-scope)|
|[Problem](#problem)|
|[Target Audience](#target-audience)|
|[How it is Used](#how-it-is-used)|
|[Features](#features)|
|[Player Features](#player-features)|
|[Game Features](#game-features)|
|[Leaderboard Features](#leaderboard-features)|
|[Help Features](#help-features)|
|[Q11](#question-11---restaurant-classes)|
|[Q12](#question-12---code-snippet:-celcius)|
|[Q13](#question-13---code-snippet:-order-swap)|
|[Q14](#question-14---prime-numbers)|
|[Implementation Plan](#implementation-plan)|
|[Source Control Repository](#source-control-repository)|
| |

# Software Development Plan
## Purpose and Scope
The application will be a playable card game using Blackjack rules. The minimum viable product will include a numbers only version of the game with no visual elements besides displaying the numbers.

## Problem
It will solve people's need for entertainment. I am developing it both to fill that need and develop my ruby programming/testing skills.

## Target Audience
The target audience are those that enjoy card games of this nature.

## How it is Used
A member of the target audience will use this app to entertain themselves by playing games of Blackjack either solo or with other players against the dealer on the same machine. They can navigate the menus/options using their arrow and Enter keys. They will be able to create players by giving them a name and password, as well as editing or deleting those details of a given player after a check. They can view the leaderboard for all players or a specific one. Finally they can play a simplified game of Blackjack.

## Features
### Player Features
#### Create Player
Requires user to enter name and password to create a player object that is saved in a player file.
#### Edit Player details
Allows user to edit the name/password if the name/password they enter are correct.
#### Delete Player
Allows user to delete the player from the player file if the name/password they enter are correct.

### Game Features
#### Deck Builder
When a new game is made, a deck of values of Blackjack cards is created and shuffled.
#### Draw Card
Draws a card and puts the value of it in the player's or dealer's hand value variable.
#### Bet
A player bets before the cards are dealt. They can bet using their score and can not bet lower than 0.
#### Hit
Draws a card and adds the value of it to the hand value variable of the player. If the value added was an 11 an increment of 1 is added to the aces in hand variable. If the hand value is higher than 21 the aces in hand variable is checked. If it is greater than 0 then the hand value variable is decremented by 10 and the aces in hand variable is decremented by 1. Otherwise the player loses the round.
#### Stand
The player passes their turn to the next player and maintains their hand value. It is then compared against the dealers hand and the greater hand wins, a draw means the player gets their bet back.

### Leaderboard Features
#### Display Leaderboard
Display all players in player file into a Leaderboard table.
#### Search Leaderboard details for specific player
Allows user to enter the name of a player to Display a Leaderboard table of their specific details.

### Help Features
#### Display Information about how to operate program
Shows text from a help file highlighting controls for the program and types of inputs the user can enter.
#### Display Information about game rules
Shows text from a rules file highlighting the rules of the card game.

## User Interaction Outline
User navigates menus using arrows and Enter keys. A built in prompt message explains this on each menu.
User can get help information that describes what each feature does
Incorrect inputs will be displayed to the user and will say the kind of input we are looking for

## Control Flow Diagram
![Control Flow](../docs/T1A3_ControlFlowDiagram.jpg)

## Implementation Plan
[Trello Board](https://trello.com/b/YOqtuuu1/cmgterminalapp)

## Source Control Repository
[Github Repo](https://github.com/chris-gibs/CardGameApp)

## Help Documentation
### Installation

### Required Dependencies

### System/Hardware Requirements

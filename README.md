# MATLAB UNO Game
## Overview

This project is a text-based UNO game developed in MATLAB. It simulates a complete game between a human player and a computer-controlled opponent, including turn-based gameplay, rule enforcement, and special card mechanics.

## Features
Turn-based gameplay between user and AI opponent
UNO rules implementation:
* Number and colour matching
* Special cards: +2, Skip, Reverse, Wild, +4
* Dynamic deck, hand, and discard pile management
* Input validation for legal moves
* Rule-based basic AI opponent that plays valid cards automatically
* Handles edge cases (e.g. insufficient cards in deck, end-game conditions)

## How It Works

The game maintains state using arrays to track:

Player hands
Draw pile (deck)
Current card in play

Each turn:

The player selects a valid card or draws
The system validates the move
Special card effects are applied
The AI opponent selects and plays a valid move

## How to Run
1. Open MATLAB
2. Download or clone this repository
3. Run the main script file 
4. Follow the prompts in the command window

## Example Gameplay
```Card on deck: R5

Your cards are:
R2 B5 G7 Y9 +2R

Enter a card or 'p' to pick up:
```

## Key Concepts Demonstrated
* Control flow (loops, conditionals)
* Game state management
* Input validation
* Modular logic design
* Basic rule-based AI

## Future Improvements
* Smarter AI (strategy-based decision making)
* Graphical user interface (GUI)
* Multiplayer support

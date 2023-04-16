# Pascaly

The best simple Flutter Calculator App.

Pascaly has a wide range of abilities involving arithmetic calculations and error handling

Features:
    Digit Keys: When pressed, they appear on the Calculation Box.
    
    Dot Key: Functionality:
        - cannot appear twice in a single equation. (There's a catch to this:])
        - automatically becomes '0.' when in the beginning of an input

    Operation Keys (+, -, *, /): Functionality:
        - two different/same keys cannot appear consecutively
        - no key can begin an input, except, of course, the minus.
        - have the ability to continue a calculation using the result as the new input

    EqualsTo Key:
        - performs calculation on the input
        - handles a whole bunch of problems that may result from a calculation :
            * incorrect equation format
            * undefined (division by 0) error
            * large number (exponents)
            * long decimals

    Backspace Key:
        - deletes the last character in the input and automatically evaluate what's left
        - automatically returns 0 when all input values are deleted

    Clear Key:
        - resets the calculator and assign all values to 0.

    +/- (Plus-Minus) Switch Key:
        - funny enough, I totally forgot about this key; I just recalled not that I'm writing this README.
        - I can implement it though.
        - But if you're interested in collaborating with me on this revolutionary calculator app, feel free to reach out and implement this key.



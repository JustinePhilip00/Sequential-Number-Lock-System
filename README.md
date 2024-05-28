Description about project (Project.v):
The project implements a number lock system, in which the system unlocks if the input password combination matches with the pre-set password. The system comprises of de10 lite as the hardware and Quartus prime as software platform.

How Is the desired output achieved?
This project uses combination logic. A “state (s0)” is being declared in the project, where if the input is correct, the state changes to next one(s1), thereby going until state 4. Here the desired password is a 5 bit number. If the input isn’t correct the state is reset to s0(initial state). It checks at the last if the inputted combination is same as pre- set value(password combination). This implementation depends upon the current inputs. 

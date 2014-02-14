ECE281_Lab2
===========

#Work Up To VHDL


###Truth Table

First I made a truth table for a one bit full adder


The truth table can be seen below:

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/TruthTableFullAdder.gif "Truth Table for full adder")


From the Truth table above I could make my Karnaugh Maps:

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/KMapforFullAdder.gif "K-Map for One Bit full Adder")


From the K-Map I could write my Boolean Equations Below!!

Sum = A xor B xor Cin

Cout = A B or A Cin or B Cin


Which will be used for the One Bit Full Adder Behavioral Code

*****

###Schematic

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/SchematicFullAdder.gif "Schematic for One Bit Full Adder")

If you follow the input for each of the three inputs for the schematic, you can see that
our schematic matches the truth table.



****


#VHDL One Bit Full Adder

###Behavioral

The behavioral vhdl code for the one bit full adder has three inputs: the two normal inputs and
the carry in


Then the code will have two outputs the Sum and the Carry out


After I initialized my inputs and outputs in the VHDL file

I could make the below code to connect my wires and make the adder work!

```
Sum <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);
```

I initialized the test bench and deleted everything related to "clock" 
Since clock is not needed in this test bench


I created the 8 different inputs for the one bit full adder in the test bench
to match the truth table above and clicked simulate

Below is a picture of the simulation.

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/OneBitFullSim.PNG "Simulation of One Bit full adder")


As you can see the simulation results match the truth table above!!

Yay!

#End of Prelim!!

***********
***********
***********

#Lab 2: Adder and Subtractor!!

###Schematic of Four Bit Adder and Subtractor

The below picture is the schematic for the four bit adder and subtractor

The Cin is the input from the button; where if the button is pressed, the adder turns into a subtractor
or A - B.

**The only changes I made to the schematic is adding the multiplexer at the bottom left hand corner
to determine whether the output was an overflow or not.**

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/SchematicOfAdderSub.jpg "Schematic for Four Bit Adder and Subtractor")


************


###Coding the Four Bit Adder and Subtractor in VHDL

To code the VHDL file I used three components: The Full Adder from the Prelim, and two multiplexers.
    -The first multiplexer was to determine if I was doing adding or subtracting when the button was pressed.
    -The second multiplexer was to determine if there was an overflow.

I used seven internal wires!
    1)One wire for each of the carry outs.
    2)One wire for the NOT of B (the second four bit input)
    3)A wire to represent the value for B coming out of the first multiplexer, which will go into the full adder.
    4)A wire to copy the four bit sum value to send to the second multiplexer to check if there is an overflow.
    
**Note** If I were to go back and change something of my design, I would change doing the second multiplexer 
        because it could have been solved by simply taking the last two carrys and using `xor`
        
I first took the not of B:
      ```
      Bc <= not B;
      ```
      
Then I constructed the first multiplexer by sending it the value from the button, B, B_NOT, and the output
of whichever the multiplexer chooses. (Cin from the button being the deciding factor.

Then I constructed the four connected full adders:
```
A0_B0: Full_Adder PORT MAP (A(0) , Bfinal(0), Cin, Ocheck(0), C0);
```
      
Where each full adder will be sent each bit from A, Bfinal, Cin, and ouput the copy for sum, and the carry
for the next full adder.
      
Finally I constructed the final multiplexer which takes in the copy of sum, A, and Bfinal, and outputs C4 which
is whether or not there is an overflow.

The multiplexer decides this by comparing the three most significant bits from each `std_logic_vector`s
    
************

###Coding the testbench for the Adder/Subtractor

My approach was to use one nested four loop to go through each possible input for the adder, and then another
nested four loop to go through each possible input for the subtractor.

I switched back and forth from adder to subtractor by commenting out and back in the sections of code for
either the adder or subtractor.

Below shows how I initialed the inputs both to zero, and set the Cin to either a "1" or a "0" depending if 
I wanted to test subtraction or addition. Below is the initial code for subtraction.

```
    A <= "0000";
		B <= "0000";
		Cin <= '1';
		
		--Need to test all cases of A and B
		--Check every case of A
		for I in 0 to 15 loop
		
			--Go through all cases of B
			for J in 0 to 15 loop
			
```
      
Within the nested for loop I asserted true if the Sum = A - B or A + B, if I was testing either addition or
subtraction. If it was wrong I would output what the sum was, what it was supposed to be, and the value for A and B.
    
    -I would use `integer'image(to_integer(unsigned((A-B))))` to display each value where the error occured.
    
Then, also within the nested for loop I made the program output each time there was an overflow by asserting when
C4 (the output of the overflow multiplexer) equals zero. Then ouptuting each bit of the A vector, B vector,
and Sum vector when the overflow occured, using only the most significant bit.

    `STD_LOGIC'image(A(3))`
    
Below is examples of what the overflow output looked like when I started making sure each overflow was in the 
correct location:

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/OverflowSubstraction.PNG "Overflow Subtraction Output Testbench")

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/AdditionOverflowAdd.PNG "Overflow Addition Output Testbench")


When everything worked and no errors occured at the top of the simulation output it would say that the test
worked. If it doesn't work, it will show the errors in which the test didn't work. 

Below is a picture of when everything worked.

![alt text](https://raw2.github.com/JarrodWooden/ECE281_Lab2/master/EverythingWorkedNote.PNG "Everything Worked")


**************


###Constraints and Testing

When making the constraints file, I had 8 different slides I could use for input to A and B.

The four slides on the left were used for A (most significant bit to least from left to right)

The four slides on the right were used for B.

The four LED light on the right show the ouput or the Sum of A and B (whether it is addition or subtraction)

LED P15 was used for when there was an overflow it would light up.

**Button**:

Now the button was interesting, and it took a long time for me to get it to work.

The reason why it took me so long though was because I made an error in the constraints file.

Initially I set the button equal to the value of Cin, which was correct. HOWEVER, at the end of the constraints file
I thought it would be a good idea to make the far left LED light up when I was doing subtraction.

Seen Below:

`NET "Cin" LOC = "R4"; # Sch name = LD7`

However... Cin is an INPUT!!!!!

Cin cannot be used and treated like an output. So basically, the code overwrote the button and it was getting
the input from the LED, which made subtraction when the LED sensed light and addition when the lights were turned off.

HA. HA. HA.

Once I took out that line of code the button worked perfectly. I simply held the button down for subtraction.

*****************


Documentation: Sabin Park helped me write how to check if the testbench "worked" or not. He also helped me figure out
that what I did in the testbench made addition or subtraction light sensitive instead of using the button.




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

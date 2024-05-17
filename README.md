![Screenshot 2024-03-04 142147](https://github.com/deepasree7/VLSI-LAB-EXP-1/assets/161302967/4c036da1-43b7-49a8-9be6-61d003572429)
# Simulation and synthesis of Logic Gates,Adders and Subtractor using simulate and synthesis Logic Gates,Adders and Subtractor using Vivado.
.
AIM: To simulate and synthesis Logic Gates,Adders and Subtractor using Xilinx ISE.

APPARATUS REQUIRED: Xilinx 14.7 Spartan6 FPGA

PROCEDURE: STEP:1 Start the Xilinx navigator, Select and Name the New project. STEP:2 Select the device family, device, package and speed. STEP:3 Select new source in the New Project and select Verilog Module as the Source type. STEP:4 Type the File Name and Click Next and then finish button. Type the code and save it. STEP:5 Select the Behavioral Simulation in the Source Window and click the check syntax. STEP:6 Click the simulation to simulate the program and give the inputs and verify the outputs as per the truth table. STEP:7 Select the Implementation in the Sources Window and select the required file in the Processes Window. STEP:8 Select Check Syntax from the Synthesize XST Process. Double Click in the Floorplan Area/IO/Logic-Post Synthesis process in the User Constraints process group. UCF(User constraint File) is obtained. STEP:9 In the Design Object List Window, enter the pin location for each pin in the Loc column Select save from the File menu. STEP:10 Double click on the Implement Design and double click on the Generate Programming File to create a bitstream of the design.(.v) file is converted into .bit file here. STEP:12 Load the Bit file into the SPARTAN 6 FPGA STEP:11 On the board, by giving required input, the LEDs starts to glow light, indicating the output.

Logic Diagram :

Logic Gates:
![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/ee17970c-3ac9-4603-881b-88e2825f41a4)


Half Adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/0e1ecb96-0c25-4556-832b-aeeedfdfe7b9)


Full adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/9bb3964c-438f-469d-a3de-c1cca6f323fb)


Half Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/731470b7-eb4e-49f8-8bb7-2994052a7184)



Full Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/d66f874b-c1f2-44b3-a035-7149b56430c1)



8 Bit Ripple Carry Adder

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/7385a408-40a5-4203-8050-b72818622d79)


# half adder
VERILOG CODE:
```
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry; 
or(sum,a,b);
and(carry,a,b);
endmodule
```
# full adder
VERILOG CODE:
```
module fulladder(sum,cout, a,b,c);
input a,b,c;
output sum,cout;
  wire w1,w2,w3,w4,w5;
  xor x1(w1,a,b);
  xor x2(sum,w1,c);  
  and a1(w2,a,b);
  and a2(w3,b,c);
  and a3(w4,a,c);
  
  or o1(w5,w2,w3);
  or o2(cout,w5,w4);
    
endmodule
```
# half subractor
VERILOG CODE:
```
module halfsubractor( D,Bo,A,B);
input A,B;
output D,Bo;
wire w1;
xor (D,A,B);
not (w1,B);
and (Bo,B,w1);
endmodule
```
# full subractor
VERILOG CODE:
```
module full_sub(borrow,diff,a,b,c);
output borrow,diff;
input a,b,c;
wire w1,w4,w5,w6;
xor (diff,a,b,c);
not n1(w1,a);
and a1(w4,w1,b);
and a2(w5,w1,c);
and a3(w6,b,c);
or o1(borrow,w4,w5,w6);
endmodule
```
# logicgates
VERILOG CODE:
```
module logicgates(a,b,andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate);
input a,b;
output andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate;
and(andgate,a,b);
or(orgate,a,b);
xor(xorgate,a,b);
nand(nandgate,a,b);  
nor(norgate,a,b);
xnor(xnorgate,a,b);
not(notgate,a);
endmodule
```
# ripplecarryadder_4bit
VERILOG CODE:
```
module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
module rippe_adder(S, Cout, X, Y,Cin);
 input [3:0] X, Y;// Two 4-bit inputs
 input Cin;
 output [3:0] S;
 output Cout;
 wire w1, w2, w3;
 fulladder u1(S[0], w1,X[0], Y[0], Cin);
 fulladder u2(S[1], w2,X[1], Y[1], w1);
 fulladder u3(S[2], w3,X[2], Y[2], w2);
 fulladder u4(S[3], Cout,X[3], Y[3], w3);
endmodule
```
# ripplecarry_8bit
VERILOG CODE:
```
module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
module rippe_adder(S, Cout, X, Y,Cin);
 input [7:0] X, Y;// Two 4-bit inputs
 input Cin;
 output [7:0] S;
 output Cout;
 wire w1, w2, w3, w4, w5, w6, w7;
 // instantiating 8 1-bit full adders in Verilog
 fulladder u1(S[0], w1,X[0], Y[0], Cin);
 fulladder u2(S[1], w2,X[1], Y[1], w1);
 fulladder u3(S[2], w3,X[2], Y[2], w2);
 fulladder u4(S[3], w4,X[3], Y[3], w3);
 fulladder u5(S[4], w5,X[4], Y[4], w4);
 fulladder u6(S[5], w6,X[5], Y[5], w5);
 fulladder u7(S[6], w7,X[6], Y[6], w6);
 fulladder u8(S[7], Cout,X[7], Y[7], w7);
endmodule
```
OUTPUT:
half adder
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/0a99c0fb-40a0-4dfb-8624-e1055d80199d)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/9c2407e4-0716-4558-9c38-54d18cad4b0d)

FULL ADDER:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/49703017-589b-4387-bce9-41bb6536c58b)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/c81fbe8a-101e-439c-a654-302e3ee44dc2)

HALF SUBRACTOR:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/b11aa1ea-ac43-4b0b-8775-7e8629b269af)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/0292da5b-9624-44c4-a137-00f7a689779c)

FULL SUBRACTOR:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/699cf31c-70e9-4b48-bc18-c03af5b6c9ea)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/0856e18e-ffb0-4faf-9bca-3c0876dd37ea)

LOGIC GATES:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/8e43809f-bb5e-496e-96eb-7ccc6bf0f302)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/e2efc3da-e763-4fc5-80e0-51d31b599935)

RIPPLECARRY 4BITS:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/da237107-78a8-4da8-a1b2-d8d6e53f0844)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/8b732261-f621-4c63-b3bc-85531e02665c)


RIPPLECARRY 8BITS:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/2784f922-7c6e-4581-b6b7-e7c65f6703a9)

Elabrated diagram:
![image](https://github.com/Madhan0302/VLSI-LAB-EXP-1/assets/160517887/91d2a1c6-1fdf-4e2c-9514-1642e542885e)




RESULT:
      Simulation and synthesis of Logic Gates,Adders and Subtractor are succesfully verified using Vivado Software


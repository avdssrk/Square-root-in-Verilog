`timescale 1ns / 1ps
module sqrt(N,clk,ld,result,flag);
    input [7:0] N;
    input clk,ld;
    output [7:0] result;
    output flag;
    wire [7:0] temp1, temp2, temp3, guess;
    
    assign flag = (guess[7:3]==result[7:3])?1:0;
    
    reg_N register_N(N,clk,ld,temp1);
    reg_guess register_guess(temp2,N,clk,ld,guess);
    reg_result register_result(temp3,clk,ld,result);
    adder adder_8bit(guess,result,temp2);
    Divd divider(temp1,temp2,temp3);
    
endmodule

module adder(in1,in2,sum);
    input [7:0] in1,in2;
    output [7:0] sum;
    wire [7:0] temp;
    
    assign temp=in1+in2;
    assign sum ={1'b0,temp[7:1]};
endmodule 

module reg_N(in,clk,ld,out);
    input [7:0] in;
    input clk,ld;
    output reg [7:0] out;
    
    always@(posedge clk) begin
        if(ld) out<=in;
        else out<=out;
    end
endmodule

module reg_guess(in,N,clk,ld,out);
    input [7:0] in,N;
    input clk,ld;
    output reg [7:0] out;
    always @(posedge clk)
    begin
        if(ld) out<=N;
        else out<=in;
    end       
endmodule 

module reg_result(in,clk,ld,out);
    input [7:0] in;
    input clk,ld;
    output reg [7:0] out;
    always @(posedge clk)
    begin
        if(ld)
            out<=8'h01;
        else
            out<=in;
    end
endmodule

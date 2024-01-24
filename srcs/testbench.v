`timescale 1ns / 1ps

module testbench();
    reg [7:0] N;
    reg clk,ld;
    
    wire [7:0] result;
    wire flag;
    
    //FS uut(a,b,c,diff,brw);
    //Cond_sub uut(a,b,c,brw,brw,diff);
    sqrt uut(N,clk,ld,result,flag);
    //Divd uut(n,d,q);      //module Divd(n,d,q);
    initial begin
        clk=1'b0;
        ld=1'b1;
    end
    
    always #100 clk=~clk;
    initial begin
        
        #150 ld=1'b1; N=8'h90;    //sqrt(9)=3
        #250 ld=1'b0;
        #1000 ld=1'b1; N=8'h58;   //sqrt(5.5) = 2.34
        #250 ld=1'b0;
        #1000 ld=1'b1; N=8'h62;  //sqrt(6.25)=2.5
        #250 ld=1'b0;
    end
    
    /*
    //test bench for divider
    reg [7:0] n,d;
    
    wire [7:0] q;
    Divd uut(n,d,q);
    initial begin
        n=8'b1000_0000;  //8
        d=8'b1111_0000;  //15
        
        #100
        n=8'b0100_0000;  //8
        d=8'b0000_1000;  //0.5
        
        #100
        n=8'b1010_0000;  //10
        d=8'b0101_0000;  //5
        
        #100
        n=8'b1000_1000;  //8.5
        d=8'b0010_0000;  //2
        
        #100
        n=8'b0010_0000;  //2
        d=8'b0011_0000;  //3
        
        #100
        n=8'b0010_0000;  //2
        d=8'b0100_0000;  //4
        end
        */
    
endmodule

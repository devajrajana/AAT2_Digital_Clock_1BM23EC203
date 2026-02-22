`timescale 1ns/1ps

//====================================================
// File: clock_interface.sv
// Description: Interface with modports for DUT & TB
//====================================================

// Pass clk as an input to the interface
interface clock_if (input logic clk);

    logic reset;
    logic [5:0] seconds;
    logic [5:0] minutes;

    modport DUT (
        input  clk, reset,
        output seconds, minutes
    );

    modport TB (
        input  clk,        
        output reset,
        input  seconds, minutes
    );

endinterface
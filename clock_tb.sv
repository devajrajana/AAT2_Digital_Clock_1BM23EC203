//====================================================
// File: clock_tb.sv
// Description: Top-level testbench
//====================================================

`timescale 1ns/1ps

module clock_tb;

    clock_if vif();

    digital_clock dut (
        .clk     (vif.clk),
        .reset   (vif.reset),
        .seconds (vif.seconds),
        .minutes (vif.minutes)
    );

    clock_test test (vif);

    // Clock generation
    initial begin
        vif.clk = 0;
        forever #5 vif.clk = ~vif.clk;
    end

    // VCD Dump
    initial begin
        $dumpfile("clock_wave.vcd");
        $dumpvars(0, clock_tb);
    end

endmodule


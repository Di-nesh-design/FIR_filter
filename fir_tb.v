`timescale 1ns/1ps

module fir_tb();

reg clk;
reg rst;
reg signed [7:0] x;

wire signed [23:0] y;

fir_filter DUT(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always
    #5 clk = ~clk;

// Waveform generation
initial begin
    $dumpfile("fir.vcd");
    $dumpvars(0, fir_tb);
end

// Display values
initial begin
    $monitor("Time=%0t rst=%b x=%d y=%d",
              $time, rst, x, y);
end

// Test sequence
initial begin

    clk = 0;
    rst = 1;
    x = 0;

    #20;
    rst = 0;

    x = 10; #10;
    x = 20; #10;
    x = 30; #10;
    x = 40; #10;
    x = 50; #10;
    x = 60; #10;
    x = 70; #10;
    x = 80; #10;

    #100;

    $finish;
end

endmodule

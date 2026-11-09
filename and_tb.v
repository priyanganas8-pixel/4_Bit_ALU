`timescale 1ns/1ps

module and_tb;
    reg a, b;
    wire y;

    // Instantiate your gate
    and_gate uut (.a(a), .b(b), .y(y));

    initial begin
        // Setup waveform tracking
        $dumpfile("dump.vcd");
        $dumpvars(0, and_tb);

        // Apply input patterns
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule

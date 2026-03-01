module alu_tb;
    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] result;
    wire carry;

    // Instantiate the ALU
    alu dut (A, B, opcode, result, carry);

    initial begin
        // Mandatory for viewing waves online/offline
        $dumpfile("alu_waves.vcd");
        $dumpvars(0, alu_tb);

        // Test Addition
        A = 4'b0101; B = 4'b0011; opcode = 3'b000; #10;
        $display("ADD: %d + %d = %d (Carry: %b)", A, B, result, carry);

        // Test Subtraction
        A = 4'b1010; B = 4'b0100; opcode = 3'b001; #10;
        $display("SUB: %d - %d = %d", A, B, result);

        // Test AND
        A = 4'b1100; B = 4'b1010; opcode = 3'b010; #10;
        $display("AND: %b & %b = %b", A, B, result);

        $finish;
    end
endmodule
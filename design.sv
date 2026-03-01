module alu(
    input [3:0] A, B,      // 4-bit inputs
    input [2:0] opcode,     // Operation selector
    output reg [3:0] result,
    output reg carry
);
    always @(*) begin
        case(opcode)
            3'b000: {carry, result} = A + B;       // Addition
            3'b001: begin carry = 0; result = A - B; end // Subtraction
            3'b010: begin carry = 0; result = A & B; end // AND
            3'b011: begin carry = 0; result = A | B; end // OR
            3'b100: begin carry = 0; result = ~A; end    // NOT
            default: begin carry = 0; result = 4'b0000; end
        endcase
    end
endmodule
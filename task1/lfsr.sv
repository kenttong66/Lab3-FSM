module lfsr (
    input logic      clk,
    input logic      rst,
    input logic      en,
    output logic [8:1]     data_out
);

     logic [8:1]    sreg;

     always_ff @ (posedge  clk,posedge rst)
         if (rst)
           sreg <= {8'b1};
           // sreg<= 4'b1;
        else if(en) begin
           sreg [1]<= sreg[7]^sreg[3];
           sreg [2]<= sreg[1];
           sreg [3]<= sreg[2];
           sreg [4]<= sreg[3];
           sreg [5]<= sreg[4];
           sreg [6]<= sreg[5];
           sreg [7]<= sreg[6];
           sreg [8]<= sreg[7];
        end

    
    
    assign data_out = sreg;
endmodule

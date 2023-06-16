module comparer (input  logic [31:0] a, b,
	               input  logic [4:0]   rt,
	               input  logic [2:0]   cmppatternchoice,
	               output logic equal);
	               
	/*logic eq, neq;
	logic gtz, ngtz;
	logic ltz, nltz;*/

    always_comb
    begin
	/*if         (cmppatternchoice == 3'b000)
		equal = eq;
	else if (cmppatternchoice == 3'b001)
		equal = neq;
	else if (cmppatternchoice == 3'b010)
		equal = gtz;
	else if (cmppatternchoice == 3'b011)
		equal = ngtz;
	else if (cmppatternchoice == 3'b100)
		if        (rt == 5'b00000)
			equal = ltz;
		else if (rt == 5'b00001)
			equal = nltz;
	else
		equal = 1'b0;
    end*/
    
    /*eq  = (a == b);
	neq = ~eq;

	gtz  = a > 0;
	ngtz = ~gtz;

	ltz  = a < 0;
	nltz = ~ltz;*/
    
    case(cmppatternchoice)
        3'b000:  equal = a == b;
        3'b001:  equal = a != b;
        3'b010:  equal = a > b;
        3'b011:  equal = a <= b;
        3'b100:  equal = (rt == 5'b00000)? a < 0 : a >= 0;
        default: equal = 1'b0;
     endcase
     
    end
    
endmodule

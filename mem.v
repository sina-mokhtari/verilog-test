module mem (input clk, input write, input read, input [9:0] addr, input [31:0] wrdata, output [31:0] rddata);
    
    reg [7:0] memory [1023:0];

    always @(posedge clk) begin
        if(write && !read) begin
            memory[addr] <= wrdata[7:0];
            memory[addr+1] <= wrdata[15:8];
            memory[addr+2] <= wrdata[23:16];
            memory[addr+3] <= wrdata[31:24];
        end
    end

    assign rddata = (read & !write) ? 
        {memory[addr+3], memory[addr+2],
            memory[addr+1], memory[addr]} 
        : 32'd0;



endmodule
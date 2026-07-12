module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);
    reg grid [15:0][15:0];
    integer row, col;

    always @(*) begin
        for (row = 0; row < 16; row = row + 1) begin
            for (col = 0; col < 16; col = col + 1) begin
                grid[row][col] = q[row * 16 + col];
            end
        end
    end

    reg next_grid [15:0][15:0];
    reg [3:0] up, down, left, right, count;
    always @(*) begin
        for (row = 0; row < 16; row = row + 1) begin
            for (col = 0; col < 16; col = col + 1) begin
                up = (row + 15) % 16;
                down = (row + 1) % 16;
                right = (col + 1) % 16;
                left = (col + 15) % 16;

                count = grid[row][right] + grid[row][left] + grid[up][col] + grid[down][col] +
                        grid[up][right] + grid[down][right] + grid[down][left] + grid[up][left];

                case (count)
                    0, 1 : next_grid[row][col] = 1'b0;
                    2 : next_grid[row][col] = grid[row][col];
                    3 : next_grid[row][col] = 1'b1;
                    default: next_grid[row][col] = 1'b0;
                endcase
            end
        end
    end

    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (row = 0; row < 16; row = row + 1) begin
                for (col = 0; col < 16; col = col + 1) begin
                    q[row * 16 + col] <= next_grid[row][col];
                end
            end
        end
    end
endmodule
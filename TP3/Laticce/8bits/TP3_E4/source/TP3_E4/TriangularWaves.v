

module TriangularWave (
    input wire clk,
    output reg [11:0] triangular_wave
);

    reg [10:0] count;
    reg direction;

    always @(posedge clk) begin
        // Incrementa o decrementa el contador en funci�n de la direcci�n
        if (count == 0 || count == (2**11 - 1)) begin
            direction <= ~direction; // Cambia la direcci�n al llegar al m�ximo o m�nimo
        end
        
        if (direction == 1) begin
            count <= count + 1; // Incrementa el contador
        end else begin
            count <= count - 1; // Decrementa el contador
        end
    end

    always @(*) begin
        // Mapea el contador al rango de amplitud deseado (de -2^14 a 2^14 - 1)
        if (count < (2**10)) begin
            triangular_wave = count;
        end else begin
            triangular_wave = (2**11 - 1) - (count - (2**10));
        end
    end

endmodule
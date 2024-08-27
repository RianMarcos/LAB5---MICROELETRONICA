library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
    generic(
        freqclk: integer := 1; -- frequência do clock em kHz
        twindow: integer := 1  -- tempo de intervalo em ms
    );
    Port ( 
        entrada : in  STD_LOGIC;  -- Entrada do sinal a ser "debounced"
        clk : in  STD_LOGIC;      -- Sinal de clock
        saida : out  STD_LOGIC    -- Saída do sinal "debounced"
    );
end debounce;

architecture Behavioral of debounce is
    signal temp: std_logic := '0';  -- Sinal temporário para armazenar o valor estabilizado
    signal flag: std_logic := '0';  -- Sinal de flag, não utilizado no processo
    constant max: integer := freqclk * twindow;  -- Constante que define o número máximo de contagem
begin

process(clk)
    variable count: integer range 0 to max;  -- Variável para contar ciclos de clock
begin
    if(clk'event and clk = '1') then  -- Detecta a borda de subida do clock
        if(temp /= entrada) then  -- Verifica se a entrada mudou
            count := count + 1;  -- Incrementa o contador
            if(count = max) then  -- Se o contador atingir o valor máximo
                temp <= entrada;  -- Atualiza o sinal temporário com a entrada
                count := 0;  -- Reseta o contador
            end if;
        else
            count := 0;  -- Reseta o contador se a entrada não mudou
        end if;
    end if;
end process;

saida <= temp;  -- Atribui o sinal temporário à saída

end Behavioral;

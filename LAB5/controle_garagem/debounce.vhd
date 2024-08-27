library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
    generic(
        freqclk: integer := 1; -- frequ�ncia do clock em kHz
        twindow: integer := 1  -- tempo de intervalo em ms
    );
    Port ( 
        entrada : in  STD_LOGIC;  -- Entrada do sinal a ser "debounced"
        clk : in  STD_LOGIC;      -- Sinal de clock
        saida : out  STD_LOGIC    -- Sa�da do sinal "debounced"
    );
end debounce;

architecture Behavioral of debounce is
    signal temp: std_logic := '0';  -- Sinal tempor�rio para armazenar o valor estabilizado
    signal flag: std_logic := '0';  -- Sinal de flag, n�o utilizado no processo
    constant max: integer := freqclk * twindow;  -- Constante que define o n�mero m�ximo de contagem
begin

process(clk)
    variable count: integer range 0 to max;  -- Vari�vel para contar ciclos de clock
begin
    if(clk'event and clk = '1') then  -- Detecta a borda de subida do clock
        if(temp /= entrada) then  -- Verifica se a entrada mudou
            count := count + 1;  -- Incrementa o contador
            if(count = max) then  -- Se o contador atingir o valor m�ximo
                temp <= entrada;  -- Atualiza o sinal tempor�rio com a entrada
                count := 0;  -- Reseta o contador
            end if;
        else
            count := 0;  -- Reseta o contador se a entrada n�o mudou
        end if;
    end if;
end process;

saida <= temp;  -- Atribui o sinal tempor�rio � sa�da

end Behavioral;

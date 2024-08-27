library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity temporizador is
    PORT(
        rst: in STD_LOGIC;      -- Sinal de reset
        clk: in STD_LOGIC;      -- Sinal de clock
        pause: in STD_LOGIC;    -- Sinal de pausa
        Dseg: out integer;      -- Sa�da para os d�gitos das dezenas de segundos
        Useg: out integer       -- Sa�da para os d�gitos das unidades de segundos
    );
end temporizador;

architecture Behavioral of temporizador is
    CONSTANT Dmax: integer := 4;          -- Valor m�ximo para os d�gitos das dezenas de segundos
    CONSTANT Umax: integer := 10;         -- Valor m�ximo para os d�gitos das unidades de segundos
    CONSTANT Freq: integer := 50000000;   -- Frequ�ncia do clock

begin

    process(clk, rst, pause)	
        variable count_clk: integer range 0 to Freq := 0;  -- Vari�vel para contar ciclos de clock
        variable Dseg_var: integer range 0 to Dmax := 0;   -- Vari�vel para armazenar os d�gitos das dezenas de segundos
        variable Useg_var: integer range 0 to Umax := 0;   -- Vari�vel para armazenar os d�gitos das unidades de segundos
    begin
        if(rst = '1') then
            Dseg_var := 0;    -- Reseta os d�gitos das dezenas de segundos
            Useg_var := 0;    -- Reseta os d�gitos das unidades de segundos
            count_clk := 0;   -- Reseta o contador de ciclos de clock

        elsif(clk'event and clk = '1') then   -- Detecta a borda de subida do clock
            if(pause = '0') then   -- Verifica se o sinal de pausa est� desativado
                if(count_clk < Freq) then   -- Verifica se o contador de ciclos n�o atingiu o m�ximo
                    count_clk := count_clk + 1;   -- Incrementa o contador de ciclos
                else
                    count_clk := 0;   -- Reseta o contador de ciclos
                    Useg_var := Useg_var + 1;   -- Incrementa os d�gitos das unidades de segundos

                    if(Useg_var = Umax) then   -- Verifica se os d�gitos das unidades de segundos atingiram o m�ximo
                        Useg_var := 0;   -- Reseta os d�gitos das unidades de segundos
                        Dseg_var := Dseg_var + 1;   -- Incrementa os d�gitos das dezenas de segundos

                        if(Dseg_var = Dmax) then   -- Verifica se os d�gitos das dezenas de segundos atingiram o m�ximo
                            Dseg_var := 0;   -- Reseta os d�gitos das dezenas de segundos
                        end if;
                    end if;
                end if;
            end if;
        else
            count_clk := count_clk;   -- Mant�m o valor do contador de ciclos
        end if;

        Dseg <= Dseg_var;   -- Atribui os d�gitos das dezenas de segundos � sa�da
        Useg <= Useg_var;   -- Atribui os d�gitos das unidades de segundos � sa�da
    end process;

end Behavioral;

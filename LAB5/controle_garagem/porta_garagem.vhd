library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity porta_garagem is
    Port (
        remoto : in  STD_LOGIC;          -- Entrada para o controle remoto
        aberta : in  STD_LOGIC;          -- Sensor indicando se a garagem está aberta
        fechada : in  STD_LOGIC;         -- Sensor indicando se a garagem está fechada
        rst : in  STD_LOGIC;             -- Sinal de reset
        clk : in  STD_LOGIC;             -- Sinal de clock
        ligar : out  STD_LOGIC;          -- Saída para ligar o motor
        direcao : out  STD_LOGIC;        -- Saída para definir a direção do motor
        led: out STD_LOGIC_VECTOR(5 downto 0) -- Saída de debug para monitoramento do estado
    );
end porta_garagem;

architecture Behavioral of porta_garagem is

type state is (st_fechado, st_aberto, abrindo, fechando, parado_abrindo, parado_fechando); -- Definição dos estados
SIGNAL present_state, future_state: state; -- Estado atual e estado futuro
SIGNAL estado_bt: STD_LOGIC; -- Sinal de estado do botão (controle remoto)
SIGNAL pause: STD_LOGIC; -- Sinal de pausa do temporizador
SIGNAL Useg_sig: integer range 0 to 10; -- Sinal para contar segundos
SIGNAL Dseg_sig: integer range 0 to 4; -- Sinal para contar décimos de segundo
SIGNAL flag: std_logic; -- Sinal de flag para alternância de estado
signal flag_timer: std_logic :='0'; -- Sinal para controle do temporizador

-- Componentes para debounce e temporizador
component temporizador is 
    PORT(
        rst: in STD_LOGIC;
        clk: in STD_LOGIC;
        pause: in STD_LOGIC;
        Dseg: out integer;
        Useg: out integer
    );
end component;


component debounce is
    PORT(
        entrada: in std_logic;
        clk: in std_logic;
        saida: out std_logic
    );
end component;



begin

-- Instanciação do componente debounce para tratar o botão remoto
bt: debounce port map(remoto, clk, estado_bt);

-- Instanciação do componente Timer para contar tempo
tempo: temporizador PORT MAP(flag_timer, clk, pause, Dseg_sig, Useg_sig);

-- Processo para atualização do estado presente com base no clock e reset
process(rst, clk)
begin
    if (rst='1') then
        present_state <= st_fechado; -- Reset: Estado inicial é fechado
    elsif rising_edge(clk) then
        present_state <= future_state; -- Atualiza o estado presente com o futuro na borda de subida do clock
    end if;
end process;

-- Processo para alternar o sinal de flag baseado no estado do botão
-- impede de ficar com o dedo pressionado no botão para sempre e continuar dando sinal 
process(rst, estado_bt)
begin
    if (rst='1') then
        flag <= '0'; -- Reset do flag
    elsif (estado_bt'event and estado_bt='0') then
        flag <= not(flag); -- Alterna o flag na borda de descida do botão
    end if;
end process;

-- Processo principal de controle da porta da garagem
process (present_state, remoto, aberta, fechada, estado_bt, flag, Dseg_sig)
begin    
    case present_state is
        when st_fechado => 
            ligar <= '0'; 
            direcao <= '0';
            pause <= '1';
            led <= "000001";
            flag_timer <= '1';
            
            if (estado_bt = '1' and flag = '0' and aberta = '0' and fechada = '1') then
                future_state <= abrindo; -- Muda para o estado abrindo
            else
                future_state <= st_fechado; -- Permanece no estado fechado
            end if;    
            
        when abrindo => 
            ligar <= '1'; 
            direcao <= '0';
            pause <= '1';
            led <= "000010";
            flag_timer <= '1';
            
            if (estado_bt = '1' and aberta = '0' and fechada = '0' and flag = '1') then
                future_state <= parado_abrindo; -- Muda para o estado parado abrindo
            elsif (aberta = '1' and fechada = '0') then
                future_state <= st_aberto; -- Muda para o estado aberto
            else
                future_state <= abrindo; -- Permanece no estado abrindo
            end if;            
        
        when st_aberto => 
            ligar <= '0'; 
            direcao <= '1';
            pause <= '0';
            led <= "000100";
            flag_timer <= '0';
            
            if (estado_bt = '1' and aberta = '1' and fechada = '0' and flag = '1') then
                future_state <= fechando; -- Muda para o estado fechando
            elsif (Dseg_sig = 3) then --30 segundos 
                future_state <= fechando; -- Muda para o estado fechando após 3 segundos
            else
                future_state <= st_aberto; -- Permanece no estado aberto
            end if;
    
        when fechando => 
            ligar <= '1'; 
            direcao <= '1';
            pause <= '1';
            led <= "001000";
            flag_timer <= '1';
            
            if (estado_bt = '1' and aberta = '0' and fechada = '0' and flag = '1') then 
                future_state <= parado_fechando; -- Muda para o estado parado fechando
            elsif (fechada = '1' and aberta = '0') then
                future_state <= st_fechado; -- Muda para o estado fechado
            else
                future_state <= fechando; -- Permanece no estado fechando
            end if;

        when parado_abrindo => 
            ligar <= '0'; 
            direcao <= '1';
            pause <= '0';
            led <= "010000";
            flag_timer <= '0';
        
            if (estado_bt = '1' and aberta = '0' and fechada = '0' and flag = '1') then
                future_state <= fechando; -- Muda para o estado fechando
            elsif (Dseg_sig = 3) then
                future_state <= fechando; -- Muda para o estado fechando após 3 segundos
            else
                future_state <= parado_abrindo; -- Permanece no estado parado abrindo
            end if;

        when parado_fechando => 
            ligar <= '0'; 
            direcao <= '0';
            pause <= '0';
            led <= "100000";
            flag_timer <= '0';
            
            if (estado_bt = '1' and aberta = '0' and fechada = '0' and flag = '1') then
                future_state <= abrindo; -- Muda para o estado abrindo
            elsif (Dseg_sig = 3) then
                future_state <= fechando; -- Muda para o estado fechando após 3 segundos
            else 
                future_state <= parado_fechando; -- Permanece no estado parado fechando
            end if;
        
    end case;
end process;

end Behavioral;

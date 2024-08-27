LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY porta_garagem_tb IS
END porta_garagem_tb;
 
ARCHITECTURE behavior OF porta_garagem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT porta_garagem
    PORT(
         remoto : IN  std_logic;
         aberta : IN  std_logic;
         fechada : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         ligar : OUT  std_logic;
         direcao : OUT  std_logic;
         led : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal remoto : std_logic := '0';
   signal aberta : std_logic := '0';
   signal fechada : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal ligar : std_logic;
   signal direcao : std_logic;
   signal led : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: porta_garagem PORT MAP (
          remoto => remoto,
          aberta => aberta,
          fechada => fechada,
          rst => rst,
          clk => clk,
          ligar => ligar,
          direcao => direcao,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst<='1';
		-- hold reset state for 100 ns.
      wait for 20 ns;
	rst<='0';

      wait for clk_period*10;

	  -- Configurar as entradas iniciais
	  remoto <= '0';
	  aberta <= '0';
	  fechada <= '1';
	  rst <= '0';
	 
	  wait for 10 ns; -- Fechado

	  -- Configurar remoto=1
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';
	  
	  wait for 50 ns; -- Abrindo

	  -- Configurar aberta=1
	  aberta <= '1';
	  fechada <= '0';
	  wait for 50 ns; -- Aberto

	  -- Configurar remoto=1
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';

	  wait for 50 ns; -- Fechando
	  
	  aberta <= '0';
	  fechada <= '1';

	  wait for 50 ns; -- Fechado

	  -- Configurar remoto=1
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';

	  wait for 50 ns; -- Abrindo
	  
	  fechada <= '0';
	  aberta <= '0';
	  
	  wait for 20 ns;
	  
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';

	  wait for 50 ns; -- Parado abrindo
	  
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';

	  wait for 50 ns; -- Fechando
	  
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';
	  
	  wait for 50 ns; -- Parado fechando
	  
	  remoto <= '1';
	  wait for 10 ns;
	  remoto <= '0';
	  
	  wait for 50 ns; -- Abrindo
	  
	  aberta <= '1';
	  fechada <= '0';
	  
	  wait for 30000 ms;

	  -- Aguardar um pouco
	  wait for 100 ns;

      wait;
   end process;

END;
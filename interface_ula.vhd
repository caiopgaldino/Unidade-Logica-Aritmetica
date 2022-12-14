library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 

--Interface é uma entidade reponsável por controlar as entradas e síadas da ULA
--a partir do labsland

ENTITY interface_ula IS 
    PORT ( 
        Cin: in std_logic;
        A, B : out std_logic_vector(3 downto 0);
        Operacao: in std_logic_vector(2 downto 0);
        Resultado: out std_logic_vector(3 downto 0);
        Cout: out std_logic;
        Zero: out std_logic;
        Overflow: out std_logic;
        Negativo: out std_logic
    ); 
END interface_ula; 

ARCHITECTURE logica OF interface_ula IS 
    

    COMPONENT ula
        PORT (            
            A,B : in std_logic_vector(3 downto 0);
            Cin: in std_logic;
            Operacao: in std_logic_vector(2 downto 0);
            Resultado: out std_logic_vector(3 downto 0);
            Cout: out std_logic;
            Zero: out std_logic;
            Overflow: out std_logic;
            Negativo: out std_logic
        );
    END COMPONENT;
    SIGNAL OperandoA, OperandoB : std_logic_vector(3 downto 0);
    
    BEGIN
    R: ula PORT MAP(
                     A => OperandoA,
                     B => OperandoB,
                     Cin => Cin,
                     Operacao => Operacao, 
                     Resultado => Resultado,
                     Cout => Cout,
                     Zero => Zero,
                     Overflow => Overflow,
                     Negativo => Negativo
                    );
    A <= OperandoA;
    B <= OperandoB;
END logica;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Mem is
    generic (   ELEMS : integer := 512;
                SIZE  : integer := 32);                
    port (
        clk       : in std_logic;
        seg       : out std_logic_vector (6 downto 0);
        an        : out std_logic_vector (7 downto 0));
        
end Mem;

architecture Behavioral of Mem is
    signal s_clk : std_logic;
    signal value : std_logic_vector(SIZE-1 downto 0) := (others => '0');
    signal idx   : integer := 0;
    
    type mem_type is array (0 to ELEMS-1) of std_logic_vector (SIZE-1 downto 0);
    signal mem : mem_type := (x"b72960eb", x"7bf7f864", x"236e05ea", x"0ec6da00", x"36f668b2", x"d07e3770", x"01db3c71", x"e0c4d0b1", 
x"c3b2984a", x"b40b3287", x"906740bf", x"2cf962e8", x"fd48121a", x"8379a993", x"8d7386be", x"c6b051ed", 
x"f062fcb8", x"f83c71db", x"92145bd3", x"29f0ce34", x"25e5307c", x"888e43c6", x"d89e9741", x"15501516", 
x"c8028186", x"aa504ca1", x"2008e83d", x"ca0be6c6", x"826b6cbc", x"ea341300", x"a4d6ef02", x"59bbb7e7", 
x"280128dd", x"b94cd7c4", x"59fb020c", x"3a7b61eb", x"99b482f2", x"963ac4c4", x"dd5252b1", x"e28e4321", 
x"e75e4584", x"821d1b08", x"c3538797", x"64b4fb4e", x"f728f9ba", x"4dce4a5d", x"42cc3360", x"48e6d311", 
x"ce26f738", x"1a71f662", x"af17622f", x"2e949c88", x"bb931c94", x"ca8e5616", x"0f5e6f55", x"fd348ede", 
x"48fdabc2", x"214433b6", x"b64880a5", x"f4b64551", x"4cd9a28d", x"69fb65c5", x"058f3c36", x"5af56152", 
x"59fb0e65", x"7807ad9b", x"2fab986c", x"ecec3376", x"ccbd91ae", x"7191777e", x"99a541a9", x"7d7c3a0b", 
x"b26a78f7", x"7861ceba", x"4ed2d5cb", x"6b28b40f", x"3beb3f9e", x"3fa6f629", x"ff15e2b2", x"26252afd", 
x"4e974d1c", x"163d90db", x"fc15649e", x"1dbca872", x"ee458af3", x"377802a8", x"10a915cc", x"b658dc83", 
x"0a19d638", x"914b4257", x"5ddd916a", x"44282b4f", x"5785e4fc", x"3c095d78", x"f2bdd093", x"8faccbc3", 
x"5a7a62e6", x"672102fb", x"58fe4608", x"4e1ae7e5", x"ef562b70", x"8f0232ed", x"3064da45", x"03e95583", 
x"5f8556f3", x"32848208", x"9ac2a50d", x"cea99258", x"bbcb7ed5", x"4cdf5ffc", x"4cf86e93", x"63f6983a", 
x"7f8dab7b", x"e31e4c05", x"9b882566", x"8ae9507e", x"f416043c", x"198e3df6", x"f4998956", x"2f8035f3", 
x"00e0ae5b", x"d7185f9a", x"5d1e5dee", x"be5c4279", x"233d9653", x"cc1629ce", x"efc418af", x"68a752de", 
x"3135d05b", x"86616b2a", x"cabee150", x"f2de371a", x"8f1e03f8", x"5aa78784", x"49a41632", x"effa27fe", 
x"e41ee135", x"a1e19f07", x"281a3629", x"bd1d406d", x"1f67943d", x"e6ad0597", x"5f1d3c0e", x"eacbbdf9", 
x"68d1e895", x"e1a86635", x"fc7122f2", x"d09cf63b", x"40e9af02", x"b395f8ee", x"1922e9f0", x"80d27ffb", 
x"0f62a009", x"9404c665", x"fd425624", x"c31d580c", x"2d2e3c02", x"e8dd2b9f", x"4ea545a1", x"f99c6327", 
x"9f26fbc9", x"b9ea4796", x"c51428e7", x"aa3adabd", x"94b6719b", x"d7a6f981", x"f586d76c", x"138a0533", 
x"e8899577", x"47edbe21", x"e82ec287", x"f13180e6", x"60d2b83e", x"845efaa1", x"7f43b6c7", x"6c7f5a8c", 
x"5979664c", x"1e915957", x"8bd29b69", x"8b8d2973", x"49a23d18", x"1b714686", x"a60b22b6", x"811114e3", 
x"47c188a5", x"4a36bce2", x"52c28cd4", x"57f812c5", x"081d9676", x"d0343917", x"ff9304e4", x"03745a88", 
x"fe34473c", x"4ff1735e", x"c159fed2", x"44be71a1", x"e2c07486", x"86f975e3", x"14979a4b", x"a8417939", 
x"2803547b", x"877c8788", x"627abe4f", x"2168dff5", x"c4e8cb9b", x"31d6df5c", x"c52a520a", x"7769e933", 
x"4db9a48d", x"75c063f4", x"c9287c7a", x"f2f2432b", x"ae8a0156", x"de4617e0", x"7bc12a6f", x"58b10dc1", 
x"cc6214e8", x"4b3fb3de", x"04c63aec", x"a5ade467", x"9631e5a0", x"809b7302", x"3bcc2047", x"a74cfb16", 
x"792fb34b", x"e188d465", x"8818b474", x"f92eb6f0", x"fba2707e", x"72cd609a", x"fcfca578", x"65a4cf81", 
x"5119ce33", x"8bc5c04b", x"4db4d070", x"e842f428", x"04a71812", x"e393e9fb", x"64f5f656", x"3a61e5c9", 
x"35a8cacf", x"1b4b30fe", x"67f39708", x"166cf1af", x"92a76aa6", x"daebffd3", x"41f4e3ad", x"3cc5173c", 
x"af3adcff", x"b63171ed", x"d2296788", x"e0c4c9c4", x"6f6a1ce1", x"28be78f1", x"2967c64d", x"c4decfa9", 
x"3afdfdf9", x"a8ac4b4b", x"451a37bf", x"d45eb24e", x"df9fd36e", x"a94468cb", x"01ae7329", x"d5075b24", 
x"f1934290", x"77300b45", x"e55ce7c9", x"bc7316cf", x"9d1e9e1c", x"6c84ff54", x"39922255", x"5ff066d9", 
x"6230aee6", x"5614a0c6", x"f7fada8d", x"36d10785", x"86761d48", x"3a155705", x"78326deb", x"cf8c10a5", 
x"c230713d", x"66b3b3ee", x"f8ec1120", x"3e5e9cba", x"8bc66f72", x"e3625d7b", x"dcf6bf02", x"58d77e11", 
x"aeecf3f6", x"8686caac", x"517cbbfb", x"df97851c", x"1b4f7ae4", x"e7e3648a", x"957bd55c", x"7c37220b", 
x"4dba8c3b", x"be844099", x"a36e88e4", x"09eecd56", x"18155871", x"b3d31856", x"80b09d6f", x"e2aa1d03", 
x"2df72b08", x"d57a7f8d", x"f0472074", x"4f530b0c", x"ffda59ee", x"a85eb6e4", x"67568d2e", x"71a2d82e", 
x"7c6ac845", x"10b09311", x"e3fb5955", x"bbdd7d8a", x"72454f93", x"21a11bcf", x"79e9c74b", x"273198bc", 
x"f70158d9", x"8b5be1e1", x"d0a2b98e", x"1ef5bfaf", x"21312841", x"27a3c5a6", x"667116be", x"b8bfc977", 
x"608ad24e", x"5810294c", x"b42b270b", x"362db228", x"0038c574", x"4c75c2bd", x"f10cf41a", x"35e76e3b", 
x"3f6d5bb6", x"98319de9", x"0ec5bfe2", x"c22d7025", x"9d8ac7ee", x"4791016b", x"5e2e9727", x"3f0cacee", 
x"1607bc20", x"db16d69b", x"b9ce71a6", x"832eb60d", x"0a06f36b", x"d8fba77c", x"6b26810f", x"c16bf1c2", 
x"0bfecb31", x"170a530d", x"a1210180", x"02ed5ed0", x"5d7e01a4", x"68daec8a", x"8fee1470", x"9bed5860", 
x"edf54f4d", x"be783b41", x"a56decd2", x"1f01cfb6", x"fc851693", x"009f4565", x"a55403dc", x"d98d01fa", 
x"ec927c14", x"41c74632", x"3909f44b", x"fccf5c02", x"5ae3683f", x"5a169901", x"9050785d", x"1e00d70d", 
x"c89e1587", x"3d141c75", x"d6ce0df5", x"325320ac", x"56b3be18", x"11d88e26", x"2a604ddc", x"3d62f324", 
x"b58197b3", x"8ea99958", x"dcb7acf8", x"5a58643c", x"6d64d711", x"2c3c7088", x"9ca0f218", x"06b9307e", 
x"69de4f4b", x"063b5dc6", x"65e7c3af", x"5b5b838e", x"4bdc24c4", x"846b327f", x"8e62f7e7", x"349fba57", 
x"973bd374", x"9b9323a5", x"a634a9d2", x"3ef2a61d", x"5a67a686", x"dc7e1063", x"baf58aa9", x"7de8df3c", 
x"e6db0101", x"afe98c8a", x"5f095028", x"f3b5dc7c", x"9121ddcb", x"6ead39ff", x"1dff0357", x"eb565953", 
x"97e97b80", x"8f49cd82", x"9371f509", x"8beaad00", x"bcea7b44", x"a6e3efb3", x"6eb71509", x"98ab6ee9", 
x"f80dd35c", x"47a4fd86", x"1001c61d", x"8a54ec6c", x"b969b657", x"9ff38be6", x"a27967ef", x"61076b07", 
x"421b521f", x"2eda39f7", x"de4b15a7", x"7a37ddbb", x"07039ae9", x"290814c8", x"7f644b95", x"e0804997", 
x"7739ec7f", x"230c3001", x"d4c57f79", x"3ad163a3", x"318d24e0", x"749fcaed", x"52779b07", x"4a694bec", 
x"88c5d88e", x"e8f2786f", x"6797e344", x"91c7c040", x"b2dbfbfd", x"4c1d8007", x"224a35bf", x"6d81c7dd", 
x"4ec80247", x"33704006", x"2289158e", x"31b8c36c", x"0fd5231e", x"a950fdd8", x"ce1c3d10", x"17790aeb", 
x"ef29f093", x"0afc476f", x"c4de465f", x"2fbed976", x"99964087", x"d7b6c8c5", x"658b251b", x"691a08e5", 
x"44047630", x"8eca5f7c", x"03404d8d", x"7269404a", x"c66b940f", x"2991f63a", x"90b9fa23", x"a15c4322", 
x"8a05644a", x"6ac39841", x"879b9623", x"ba576f3b", x"9c33413c", x"ffa7ce9d", x"e3f99980", x"df94d5e3", 
x"d3fe7d19", x"945c0296", x"f060f63a", x"ad7dc40f", x"b9a6191e", x"63df43b5", x"bee8760e", x"4bad938f", 
x"97628e90", x"a06f9740", x"5bf607eb", x"9fb5f69c", x"050889a7", x"4137dd1e", x"5a07d4a9", x"de7e8bbb", 
x"98f18b4a", x"17844fdd", x"460e6440", x"2434289a", x"0405e0fc", x"2bbfca2d", x"e71062cb", x"890affc5");
    
    
    
begin
    
    process(s_clk)
    begin
        if (rising_edge(s_clk)) then
            value <= mem(idx);
            if (idx = (ELEMS-1)) then
                idx <= 0;
            else
                idx <= idx +1;
            end if;
        end if;
    end process;
    
    freq_divider : entity work.freq_div
    port map(   clk_in  => clk,
                clk_out => s_clk,
                reset => '0');
    
    send_to_disp : entity work.DispCont
    port map (  clk     => clk,
                -- left side
                leftL       => value(31 downto 28),
                near_leftL  => value(27 downto 24),
                near_rightL => value(23 downto 20),
                rightL	    => value(19 downto 16),
                -- right side
                leftR       => value(15 downto 12), 
                near_leftR  => value(11 downto 8),
                near_rightR => value(7 downto 4),
                rightR      => value(3 downto 0),
                -- control
                select_display  => an,
                segments        => seg);
                
end Behavioral;









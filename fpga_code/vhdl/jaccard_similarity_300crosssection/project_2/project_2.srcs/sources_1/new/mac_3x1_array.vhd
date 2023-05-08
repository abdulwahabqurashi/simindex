----------------------------------------------------------------------------------
-- Basic Mac Block
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.mult_2x2_pack.all;

entity mac_3x1_array is
    port (
        rst: in std_logic;                                ----------   reset
        clk: in std_logic ;                               ----------   clock
        in_array1 : in  t_1d_array;                       ----------  S1 Vector/array of cross-section 4
        in_array2 : in  t_1d_array;                       ----------  S2 Vector/array of cross-section 4
        outp : out integer                                ----------  Output of SUB-MAC block
        );
end mac_3x1_array;

architecture Behavioral of mac_3x1_array is

--------------------------------------------------------  Output signal for SUB-MAC block

signal outp_reg: integer;
begin


--begin
--process

p_synchronous_reset : process (clk) is
begin
   if rising_edge(clk) then
      if rst = '1' then               -- do reset
         outp_reg <= 0;
      else                            -- normal operation
             outp_reg <= integer(
                               (in_array1(0)) * (in_array2(0)) +
                               (in_array1(1)) * (in_array2(1)) +
                               (in_array1(2)) * (in_array2(2)) +
                               (in_array1(3)) * (in_array2(3)) +
                               (in_array1(4)) * (in_array2(4)) +
                               (in_array1(5)) * (in_array2(5)) +
                               (in_array1(6)) * (in_array2(6)) +
                               (in_array1(7)) * (in_array2(7)) +
                               (in_array1(8)) * (in_array2(8)) +
                               (in_array1(9)) * (in_array2(9)) +
                               (in_array1(10)) * (in_array2(10)) +
                               (in_array1(11)) * (in_array2(11)) +
                               (in_array1(12)) * (in_array2(12)) +
                               (in_array1(13)) * (in_array2(13)) +
                               (in_array1(14)) * (in_array2(14)) +
                               (in_array1(15)) * (in_array2(15)) +
                               (in_array1(16)) * (in_array2(16)) +
                               (in_array1(17)) * (in_array2(17)) +
                               (in_array1(18)) * (in_array2(18)) +
                               (in_array1(19)) * (in_array2(19)) +
                               (in_array1(20)) * (in_array2(20)) +
                               (in_array1(21)) * (in_array2(21)) +
                               (in_array1(22)) * (in_array2(22)) +
                               (in_array1(23)) * (in_array2(23)) +
                               (in_array1(24)) * (in_array2(24)) +
                               (in_array1(25)) * (in_array2(25)) +
                               (in_array1(26)) * (in_array2(26)) +
                               (in_array1(27)) * (in_array2(27)) +
                               (in_array1(28)) * (in_array2(28)) +
                               (in_array1(29)) * (in_array2(29)) +
                               (in_array1(30)) * (in_array2(30)) +
                               (in_array1(31)) * (in_array2(31)) +
                               (in_array1(32)) * (in_array2(32)) +
                               (in_array1(33)) * (in_array2(33)) +
                               (in_array1(34)) * (in_array2(34)) +
                               (in_array1(35)) * (in_array2(35)) +
                               (in_array1(36)) * (in_array2(36)) +
                               (in_array1(37)) * (in_array2(37)) +
                               (in_array1(38)) * (in_array2(38)) +
                               (in_array1(39)) * (in_array2(39)) +
                               (in_array1(40)) * (in_array2(40)) +
                               (in_array1(41)) * (in_array2(41)) +
                               (in_array1(42)) * (in_array2(42)) +
                               (in_array1(43)) * (in_array2(43)) +
                               (in_array1(44)) * (in_array2(44)) +
                               (in_array1(45)) * (in_array2(45)) +
                               (in_array1(46)) * (in_array2(46)) +
                               (in_array1(47)) * (in_array2(47)) +
                               (in_array1(48)) * (in_array2(48)) +
                               (in_array1(49)) * (in_array2(49)) +
                               (in_array1(50)) * (in_array2(50)) +
                               (in_array1(51)) * (in_array2(51)) +
                               (in_array1(52)) * (in_array2(52)) +
                               (in_array1(53)) * (in_array2(53)) +
                               (in_array1(54)) * (in_array2(54)) +
                               (in_array1(55)) * (in_array2(55)) +
                               (in_array1(56)) * (in_array2(56)) +
                               (in_array1(57)) * (in_array2(57)) +
                               (in_array1(58)) * (in_array2(58)) +
                               (in_array1(59)) * (in_array2(59)) +
                               (in_array1(60)) * (in_array2(60)) +
                               (in_array1(61)) * (in_array2(61)) +
                               (in_array1(62)) * (in_array2(62)) +
                               (in_array1(63)) * (in_array2(63)) +
                               (in_array1(64)) * (in_array2(64)) +
                               (in_array1(65)) * (in_array2(65)) +
                               (in_array1(66)) * (in_array2(66)) +
                               (in_array1(67)) * (in_array2(67)) +
                               (in_array1(68)) * (in_array2(68)) +
                               (in_array1(69)) * (in_array2(69)) +
                               (in_array1(70)) * (in_array2(70)) +
                               (in_array1(71)) * (in_array2(71)) +
                               (in_array1(72)) * (in_array2(72)) +
                               (in_array1(73)) * (in_array2(73)) +
                               (in_array1(74)) * (in_array2(74)) +
                               (in_array1(75)) * (in_array2(75)) +
                               (in_array1(76)) * (in_array2(76)) +
                               (in_array1(77)) * (in_array2(77)) +
                               (in_array1(78)) * (in_array2(78)) +
                               (in_array1(79)) * (in_array2(79)) +
                               (in_array1(80)) * (in_array2(80)) +
                               (in_array1(81)) * (in_array2(81)) +
                               (in_array1(82)) * (in_array2(82)) +
                               (in_array1(83)) * (in_array2(83)) +
                               (in_array1(84)) * (in_array2(84)) +
                               (in_array1(85)) * (in_array2(85)) +
                               (in_array1(86)) * (in_array2(86)) +
                               (in_array1(87)) * (in_array2(87)) +
                               (in_array1(88)) * (in_array2(88)) +
                               (in_array1(89)) * (in_array2(89)) +
                               (in_array1(90)) * (in_array2(90)) +
                               (in_array1(91)) * (in_array2(91)) +
                               (in_array1(92)) * (in_array2(92)) +
                               (in_array1(93)) * (in_array2(93)) +
                               (in_array1(94)) * (in_array2(94)) +
                               (in_array1(95)) * (in_array2(95)) +
                               (in_array1(96)) * (in_array2(96)) +
                               (in_array1(97)) * (in_array2(97)) +
                               (in_array1(98)) * (in_array2(98)) +
                               (in_array1(99)) * (in_array2(99)) +
                               (in_array1(100)) * (in_array2(100)) +
                               (in_array1(101)) * (in_array2(101)) +
                               (in_array1(102)) * (in_array2(102)) +
                               (in_array1(103)) * (in_array2(103)) +
                               (in_array1(104)) * (in_array2(104)) +
                               (in_array1(105)) * (in_array2(105)) +
                               (in_array1(106)) * (in_array2(106)) +
                               (in_array1(107)) * (in_array2(107)) +
                               (in_array1(108)) * (in_array2(108)) +
                               (in_array1(109)) * (in_array2(109)) +
                               (in_array1(110)) * (in_array2(110)) +
                               (in_array1(111)) * (in_array2(111)) +
                               (in_array1(112)) * (in_array2(112)) +
                               (in_array1(113)) * (in_array2(113)) +
                               (in_array1(114)) * (in_array2(114)) +
                               (in_array1(115)) * (in_array2(115)) +
                               (in_array1(116)) * (in_array2(116)) +
                               (in_array1(117)) * (in_array2(117)) +
                               (in_array1(118)) * (in_array2(118)) +
                               (in_array1(119)) * (in_array2(119)) +
                               (in_array1(120)) * (in_array2(120)) +
                               (in_array1(121)) * (in_array2(121)) +
                               (in_array1(122)) * (in_array2(122)) +
                               (in_array1(123)) * (in_array2(123)) +
                               (in_array1(124)) * (in_array2(124)) +
                               (in_array1(125)) * (in_array2(125)) +
                               (in_array1(126)) * (in_array2(126)) +
                               (in_array1(127)) * (in_array2(127)) +
                               (in_array1(128)) * (in_array2(128)) +
                               (in_array1(129)) * (in_array2(129)) +
                               (in_array1(130)) * (in_array2(130)) +
                               (in_array1(131)) * (in_array2(131)) +
                               (in_array1(132)) * (in_array2(132)) +
                               (in_array1(133)) * (in_array2(133)) +
                               (in_array1(134)) * (in_array2(134)) +
                               (in_array1(135)) * (in_array2(135)) +
                               (in_array1(136)) * (in_array2(136)) +
                               (in_array1(137)) * (in_array2(137)) +
                               (in_array1(138)) * (in_array2(138)) +
                               (in_array1(139)) * (in_array2(139)) +
                               (in_array1(140)) * (in_array2(140)) +
                               (in_array1(141)) * (in_array2(141)) +
                               (in_array1(142)) * (in_array2(142)) +
                               (in_array1(143)) * (in_array2(143)) +
                               (in_array1(144)) * (in_array2(144)) +
                               (in_array1(145)) * (in_array2(145)) +
                               (in_array1(146)) * (in_array2(146)) +
                               (in_array1(147)) * (in_array2(147)) +
                               (in_array1(148)) * (in_array2(148)) +
                               (in_array1(149)) * (in_array2(149)) +
                               (in_array1(150)) * (in_array2(150)) +
                               (in_array1(151)) * (in_array2(151)) +
                               (in_array1(152)) * (in_array2(152)) +
                               (in_array1(153)) * (in_array2(153)) +
                               (in_array1(154)) * (in_array2(154)) +
                               (in_array1(155)) * (in_array2(115)) +
                               (in_array1(156)) * (in_array2(156)) +
                               (in_array1(157)) * (in_array2(157)) +
                               (in_array1(158)) * (in_array2(158)) +
                               (in_array1(159)) * (in_array2(159)) +
                               (in_array1(160)) * (in_array2(160)) +
                               (in_array1(161)) * (in_array2(161)) +
                               (in_array1(162)) * (in_array2(162)) +
                               (in_array1(163)) * (in_array2(163)) +
                               (in_array1(164)) * (in_array2(164)) +
                               (in_array1(165)) * (in_array2(165)) +
                               (in_array1(166)) * (in_array2(166)) +
                               (in_array1(167)) * (in_array2(167)) +
                               (in_array1(168)) * (in_array2(168)) +
                               (in_array1(169)) * (in_array2(169)) +
                               (in_array1(170)) * (in_array2(170)) +
                               (in_array1(171)) * (in_array2(171)) +
                               (in_array1(172)) * (in_array2(172)) +
                               (in_array1(173)) * (in_array2(173)) +
                               (in_array1(174)) * (in_array2(174)) +
                               (in_array1(175)) * (in_array2(175)) +
                               (in_array1(176)) * (in_array2(176)) +
                               (in_array1(177)) * (in_array2(177)) +
                               (in_array1(178)) * (in_array2(178)) +
                               (in_array1(179)) * (in_array2(179)) +
                               (in_array1(180)) * (in_array2(180)) +
                               (in_array1(181)) * (in_array2(181)) +
                               (in_array1(182)) * (in_array2(182)) +
                               (in_array1(183)) * (in_array2(183)) +
                               (in_array1(184)) * (in_array2(184)) +
                               (in_array1(185)) * (in_array2(185)) +
                               (in_array1(186)) * (in_array2(186)) +
                               (in_array1(187)) * (in_array2(187)) +
                               (in_array1(188)) * (in_array2(188)) +
                               (in_array1(189)) * (in_array2(189)) +
                               (in_array1(190)) * (in_array2(190)) +
                               (in_array1(191)) * (in_array2(191)) +
                               (in_array1(192)) * (in_array2(192)) +
                               (in_array1(193)) * (in_array2(193)) +
                               (in_array1(194)) * (in_array2(194)) +
                               (in_array1(195)) * (in_array2(195)) +
                               (in_array1(196)) * (in_array2(196)) +
                               (in_array1(197)) * (in_array2(197)) +
                               (in_array1(198)) * (in_array2(198)) +
                               (in_array1(199)) * (in_array2(199)) +
                               (in_array1(200)) * (in_array2(200)) +
                               (in_array1(201)) * (in_array2(201)) +
                               (in_array1(202)) * (in_array2(202)) +
                               (in_array1(203)) * (in_array2(203)) +
                               (in_array1(204)) * (in_array2(204)) +
                               (in_array1(205)) * (in_array2(205)) +
                               (in_array1(206)) * (in_array2(206)) +
                               (in_array1(207)) * (in_array2(207)) +
                               (in_array1(208)) * (in_array2(208)) +
                               (in_array1(209)) * (in_array2(209)) +
                               (in_array1(210)) * (in_array2(210)) +
                               (in_array1(211)) * (in_array2(211)) +
                               (in_array1(212)) * (in_array2(212)) +
                               (in_array1(213)) * (in_array2(213)) +
                               (in_array1(214)) * (in_array2(214)) +
                               (in_array1(215)) * (in_array2(215)) +
                               (in_array1(216)) * (in_array2(216)) +
                               (in_array1(217)) * (in_array2(217)) +
                               (in_array1(218)) * (in_array2(218)) +
                               (in_array1(219)) * (in_array2(219)) +
                               (in_array1(220)) * (in_array2(220)) +
                               (in_array1(221)) * (in_array2(221)) +
                               (in_array1(222)) * (in_array2(222)) +
                               (in_array1(223)) * (in_array2(223)) +
                               (in_array1(224)) * (in_array2(224)) +
                               (in_array1(225)) * (in_array2(225)) +
                               (in_array1(226)) * (in_array2(226)) +
                               (in_array1(227)) * (in_array2(227)) +
                               (in_array1(228)) * (in_array2(228)) +
                               (in_array1(229)) * (in_array2(229)) +
                               (in_array1(230)) * (in_array2(230)) +
                               (in_array1(231)) * (in_array2(231)) +
                               (in_array1(232)) * (in_array2(232)) +
                               (in_array1(233)) * (in_array2(233)) +
                               (in_array1(234)) * (in_array2(234)) +
                               (in_array1(235)) * (in_array2(235)) +
                               (in_array1(236)) * (in_array2(236)) +
                               (in_array1(237)) * (in_array2(237)) +
                               (in_array1(238)) * (in_array2(238)) +
                               (in_array1(239)) * (in_array2(239)) +
                               (in_array1(240)) * (in_array2(240)) +
                               (in_array1(241)) * (in_array2(241)) +
                               (in_array1(242)) * (in_array2(242)) +
                               (in_array1(243)) * (in_array2(243)) +
                               (in_array1(244)) * (in_array2(244)) +
                               (in_array1(245)) * (in_array2(245)) +
                               (in_array1(246)) * (in_array2(246)) +
                               (in_array1(247)) * (in_array2(247)) +
                               (in_array1(248)) * (in_array2(248)) +
                               (in_array1(249)) * (in_array2(249)) +
                               (in_array1(250)) * (in_array2(250)) +
                               (in_array1(251)) * (in_array2(251)) +
                               (in_array1(252)) * (in_array2(252)) +
                               (in_array1(253)) * (in_array2(253)) +
                               (in_array1(254)) * (in_array2(254)) +
                               (in_array1(255)) * (in_array2(255)) +
                               (in_array1(256)) * (in_array2(256)) +
                               (in_array1(257)) * (in_array2(257)) +
                               (in_array1(258)) * (in_array2(258)) +
                               (in_array1(259)) * (in_array2(259)) +
                               (in_array1(260)) * (in_array2(260)) +
                               (in_array1(261)) * (in_array2(261)) +
                               (in_array1(262)) * (in_array2(262)) +
                               (in_array1(263)) * (in_array2(263)) +
                               (in_array1(264)) * (in_array2(264)) +
                               (in_array1(265)) * (in_array2(265)) +
                               (in_array1(266)) * (in_array2(266)) +
                               (in_array1(267)) * (in_array2(267)) +
                               (in_array1(268)) * (in_array2(268)) +
                               (in_array1(269)) * (in_array2(269)) +
                               (in_array1(270)) * (in_array2(270)) +
                               (in_array1(271)) * (in_array2(271)) +
                               (in_array1(272)) * (in_array2(272)) +
                               (in_array1(273)) * (in_array2(273)) +
                               (in_array1(274)) * (in_array2(274)) +
                               (in_array1(275)) * (in_array2(275)) +
                               (in_array1(276)) * (in_array2(276)) +
                               (in_array1(277)) * (in_array2(277)) +
                               (in_array1(278)) * (in_array2(278)) +
                               (in_array1(279)) * (in_array2(279)) +
                               (in_array1(280)) * (in_array2(280)) +
                               (in_array1(281)) * (in_array2(281)) +
                               (in_array1(282)) * (in_array2(282)) +
                               (in_array1(283)) * (in_array2(283)) +
                               (in_array1(284)) * (in_array2(284)) +
                               (in_array1(285)) * (in_array2(285)) +
                               (in_array1(286)) * (in_array2(286)) +
                               (in_array1(287)) * (in_array2(287)) +
                               (in_array1(288)) * (in_array2(288)) +
                               (in_array1(289)) * (in_array2(289)) +
                               (in_array1(290)) * (in_array2(290)) +
                               (in_array1(291)) * (in_array2(291)) +
                               (in_array1(292)) * (in_array2(292)) +
                               (in_array1(293)) * (in_array2(293)) +
                               (in_array1(294)) * (in_array2(294)) +
                               (in_array1(295)) * (in_array2(295)) +
                               (in_array1(296)) * (in_array2(296)) +
                               (in_array1(297)) * (in_array2(297)) +
                               (in_array1(298)) * (in_array2(298)) +
                               (in_array1(299)) * (in_array2(299)) 
                               );
      end if;
   end if;
end process p_synchronous_reset;


outp<=outp_reg;
end Behavioral;

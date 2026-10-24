module i2c_recovery_controller (busy,
    clk,
    enable,
    fault,
    recovery_done,
    rst_n,
    scl_in,
    scl_release,
    sda_in,
    sda_release);
 output busy;
 input clk;
 input enable;
 output fault;
 output recovery_done;
 input rst_n;
 input scl_in;
 output scl_release;
 input sda_in;
 output sda_release;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire net5;
 wire net1;
 wire net6;
 wire \half_count[0] ;
 wire \half_count[1] ;
 wire \half_count[2] ;
 wire \pulse_count[0] ;
 wire \pulse_count[1] ;
 wire \pulse_count[2] ;
 wire \pulse_count[3] ;
 wire net7;
 wire net2;
 wire net3;
 wire scl_phase;
 wire net8;
 wire net4;
 wire \state[0] ;
 wire \state[1] ;
 wire \state[2] ;
 wire \state[3] ;
 wire \state[4] ;
 wire \timeout_count[0] ;
 wire \timeout_count[1] ;
 wire \timeout_count[2] ;
 wire \timeout_count[3] ;
 wire \timeout_count[4] ;
 wire \timeout_count[5] ;
 wire \timeout_count[6] ;
 wire clknet_0_clk;
 wire net10;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__inv_1 _126_ (.A(\pulse_count[0] ),
    .Y(_008_));
 sky130_fd_sc_hd__and3_1 _127_ (.A(net4),
    .B(\state[4] ),
    .C(net3),
    .X(_000_));
 sky130_fd_sc_hd__inv_1 _128_ (.A(\half_count[1] ),
    .Y(_004_));
 sky130_fd_sc_hd__inv_1 _131_ (.A(\half_count[2] ),
    .Y(_094_));
 sky130_fd_sc_hd__nand3_1 _132_ (.A(\state[2] ),
    .B(_094_),
    .C(_006_),
    .Y(_095_));
 sky130_fd_sc_hd__inv_1 _133_ (.A(\state[0] ),
    .Y(_096_));
 sky130_fd_sc_hd__nand2b_1 _135_ (.A_N(net4),
    .B(net1),
    .Y(_098_));
 sky130_fd_sc_hd__mux2i_1 _136_ (.A0(\state[3] ),
    .A1(net3),
    .S(\state[2] ),
    .Y(_099_));
 sky130_fd_sc_hd__o32ai_2 _137_ (.A1(\state[2] ),
    .A2(_096_),
    .A3(\state[3] ),
    .B1(_098_),
    .B2(_099_),
    .Y(_100_));
 sky130_fd_sc_hd__nand2_1 _138_ (.A(\timeout_count[0] ),
    .B(\timeout_count[1] ),
    .Y(_101_));
 sky130_fd_sc_hd__nor4_4 _139_ (.A(_001_),
    .B(\timeout_count[4] ),
    .C(\timeout_count[3] ),
    .D(\timeout_count[2] ),
    .Y(_102_));
 sky130_fd_sc_hd__a21boi_0 _140_ (.A1(\timeout_count[6] ),
    .A2(\timeout_count[5] ),
    .B1_N(\state[3] ),
    .Y(_103_));
 sky130_fd_sc_hd__a31oi_4 _141_ (.A1(\state[3] ),
    .A2(_101_),
    .A3(_102_),
    .B1(_103_),
    .Y(_104_));
 sky130_fd_sc_hd__and2_4 _142_ (.A(_100_),
    .B(_104_),
    .X(_105_));
 sky130_fd_sc_hd__mux2i_1 _144_ (.A0(_004_),
    .A1(_095_),
    .S(_105_),
    .Y(_018_));
 sky130_fd_sc_hd__nand2_1 _145_ (.A(\state[2] ),
    .B(_094_),
    .Y(_107_));
 sky130_fd_sc_hd__nor2_1 _146_ (.A(\half_count[0] ),
    .B(_107_),
    .Y(_108_));
 sky130_fd_sc_hd__mux2_4 _147_ (.A0(\half_count[0] ),
    .A1(_108_),
    .S(_105_),
    .X(_019_));
 sky130_fd_sc_hd__inv_1 _148_ (.A(\timeout_count[5] ),
    .Y(_109_));
 sky130_fd_sc_hd__nand2_1 _149_ (.A(\timeout_count[6] ),
    .B(\timeout_count[5] ),
    .Y(_110_));
 sky130_fd_sc_hd__a21o_2 _150_ (.A1(_101_),
    .A2(_102_),
    .B1(_110_),
    .X(_111_));
 sky130_fd_sc_hd__inv_1 _151_ (.A(\state[3] ),
    .Y(_112_));
 sky130_fd_sc_hd__nor2_1 _152_ (.A(_112_),
    .B(_098_),
    .Y(_113_));
 sky130_fd_sc_hd__and3_1 _153_ (.A(\timeout_count[0] ),
    .B(\timeout_count[2] ),
    .C(\timeout_count[1] ),
    .X(_114_));
 sky130_fd_sc_hd__nand3_1 _154_ (.A(\timeout_count[4] ),
    .B(\timeout_count[3] ),
    .C(_114_),
    .Y(_115_));
 sky130_fd_sc_hd__nand2_1 _155_ (.A(net4),
    .B(net3),
    .Y(_116_));
 sky130_fd_sc_hd__nor3_1 _156_ (.A(\state[0] ),
    .B(\state[3] ),
    .C(\state[4] ),
    .Y(_117_));
 sky130_fd_sc_hd__a21o_1 _157_ (.A1(\state[4] ),
    .A2(_116_),
    .B1(_117_),
    .X(_118_));
 sky130_fd_sc_hd__a31oi_1 _158_ (.A1(_111_),
    .A2(_113_),
    .A3(_115_),
    .B1(_118_),
    .Y(_119_));
 sky130_fd_sc_hd__or2_1 _159_ (.A(_112_),
    .B(_098_),
    .X(_120_));
 sky130_fd_sc_hd__or4_1 _160_ (.A(\timeout_count[5] ),
    .B(_118_),
    .C(_120_),
    .D(_115_),
    .X(_121_));
 sky130_fd_sc_hd__o21ai_0 _161_ (.A1(_109_),
    .A2(_119_),
    .B1(_121_),
    .Y(_020_));
 sky130_fd_sc_hd__a21oi_1 _162_ (.A1(\state[4] ),
    .A2(_116_),
    .B1(_117_),
    .Y(_122_));
 sky130_fd_sc_hd__nand3_1 _163_ (.A(_111_),
    .B(_122_),
    .C(_113_),
    .Y(_036_));
 sky130_fd_sc_hd__nand3_1 _164_ (.A(_001_),
    .B(\timeout_count[3] ),
    .C(\timeout_count[2] ),
    .Y(_037_));
 sky130_fd_sc_hd__inv_1 _165_ (.A(\timeout_count[4] ),
    .Y(_038_));
 sky130_fd_sc_hd__nand2b_1 _166_ (.A_N(_037_),
    .B(_038_),
    .Y(_039_));
 sky130_fd_sc_hd__a31oi_1 _167_ (.A1(_111_),
    .A2(_113_),
    .A3(_037_),
    .B1(_118_),
    .Y(_040_));
 sky130_fd_sc_hd__o22ai_1 _168_ (.A1(_036_),
    .A2(_039_),
    .B1(_040_),
    .B2(_038_),
    .Y(_021_));
 sky130_fd_sc_hd__a21oi_1 _169_ (.A1(_101_),
    .A2(_102_),
    .B1(_110_),
    .Y(_041_));
 sky130_fd_sc_hd__o31ai_1 _170_ (.A1(_041_),
    .A2(_120_),
    .A3(_114_),
    .B1(_122_),
    .Y(_042_));
 sky130_fd_sc_hd__nand2b_1 _171_ (.A_N(\timeout_count[3] ),
    .B(_114_),
    .Y(_043_));
 sky130_fd_sc_hd__o2bb2ai_1 _172_ (.A1_N(\timeout_count[3] ),
    .A2_N(_042_),
    .B1(_043_),
    .B2(_036_),
    .Y(_022_));
 sky130_fd_sc_hd__o31ai_1 _173_ (.A1(_001_),
    .A2(_041_),
    .A3(_120_),
    .B1(_122_),
    .Y(_044_));
 sky130_fd_sc_hd__or2b_1 _174_ (.A(\timeout_count[2] ),
    .B_N(_001_),
    .X(_045_));
 sky130_fd_sc_hd__o2bb2ai_1 _175_ (.A1_N(\timeout_count[2] ),
    .A2_N(_044_),
    .B1(_045_),
    .B2(_036_),
    .Y(_023_));
 sky130_fd_sc_hd__nand2_1 _176_ (.A(_111_),
    .B(_113_),
    .Y(_046_));
 sky130_fd_sc_hd__nand2_1 _177_ (.A(_002_),
    .B(_122_),
    .Y(_047_));
 sky130_fd_sc_hd__nand2_1 _178_ (.A(\timeout_count[1] ),
    .B(_118_),
    .Y(_048_));
 sky130_fd_sc_hd__o21ai_0 _179_ (.A1(_046_),
    .A2(_047_),
    .B1(_048_),
    .Y(_024_));
 sky130_fd_sc_hd__nand2_1 _180_ (.A(\timeout_count[0] ),
    .B(_118_),
    .Y(_049_));
 sky130_fd_sc_hd__o21ai_0 _181_ (.A1(\timeout_count[0] ),
    .A2(_036_),
    .B1(_049_),
    .Y(_025_));
 sky130_fd_sc_hd__nand3_1 _182_ (.A(scl_phase),
    .B(\half_count[2] ),
    .C(_012_),
    .Y(_050_));
 sky130_fd_sc_hd__nor2_1 _183_ (.A(\pulse_count[2] ),
    .B(_050_),
    .Y(_051_));
 sky130_fd_sc_hd__nand2_1 _184_ (.A(\state[2] ),
    .B(_050_),
    .Y(_052_));
 sky130_fd_sc_hd__nand3_1 _185_ (.A(_100_),
    .B(_104_),
    .C(_052_),
    .Y(_053_));
 sky130_fd_sc_hd__a32o_1 _186_ (.A1(\state[2] ),
    .A2(_105_),
    .A3(_051_),
    .B1(_053_),
    .B2(\pulse_count[2] ),
    .X(_026_));
 sky130_fd_sc_hd__nand2_1 _187_ (.A(scl_phase),
    .B(\half_count[2] ),
    .Y(_054_));
 sky130_fd_sc_hd__nand2_1 _188_ (.A(\state[2] ),
    .B(_054_),
    .Y(_055_));
 sky130_fd_sc_hd__nand3_1 _189_ (.A(_100_),
    .B(_104_),
    .C(_055_),
    .Y(_056_));
 sky130_fd_sc_hd__nand3_1 _190_ (.A(scl_phase),
    .B(_011_),
    .C(\half_count[2] ),
    .Y(_057_));
 sky130_fd_sc_hd__nand3_1 _191_ (.A(\state[2] ),
    .B(_100_),
    .C(_104_),
    .Y(_058_));
 sky130_fd_sc_hd__o2bb2ai_1 _192_ (.A1_N(\pulse_count[1] ),
    .A2_N(_056_),
    .B1(_057_),
    .B2(_058_),
    .Y(_027_));
 sky130_fd_sc_hd__nand3_1 _193_ (.A(\state[2] ),
    .B(\pulse_count[0] ),
    .C(_054_),
    .Y(_059_));
 sky130_fd_sc_hd__nor3b_1 _194_ (.A(\pulse_count[0] ),
    .B(_054_),
    .C_N(\state[2] ),
    .Y(_060_));
 sky130_fd_sc_hd__nand3_1 _195_ (.A(_100_),
    .B(_104_),
    .C(_060_),
    .Y(_061_));
 sky130_fd_sc_hd__o211ai_1 _196_ (.A1(_008_),
    .A2(_105_),
    .B1(_059_),
    .C1(_061_),
    .Y(_028_));
 sky130_fd_sc_hd__inv_1 _197_ (.A(\half_count[0] ),
    .Y(_003_));
 sky130_fd_sc_hd__inv_1 _198_ (.A(\pulse_count[1] ),
    .Y(_009_));
 sky130_fd_sc_hd__nand2_1 _199_ (.A(\state[4] ),
    .B(_116_),
    .Y(_062_));
 sky130_fd_sc_hd__nor2b_1 _200_ (.A(net3),
    .B_N(\state[2] ),
    .Y(_063_));
 sky130_fd_sc_hd__o21ai_0 _201_ (.A1(\state[1] ),
    .A2(_063_),
    .B1(net1),
    .Y(_064_));
 sky130_fd_sc_hd__nand2_1 _202_ (.A(_062_),
    .B(_064_),
    .Y(_014_));
 sky130_fd_sc_hd__nand3_1 _203_ (.A(net1),
    .B(\state[2] ),
    .C(net3),
    .Y(_065_));
 sky130_fd_sc_hd__nand2_1 _204_ (.A(\pulse_count[3] ),
    .B(_010_),
    .Y(_066_));
 sky130_fd_sc_hd__nor3_1 _205_ (.A(\pulse_count[2] ),
    .B(_054_),
    .C(_066_),
    .Y(_067_));
 sky130_fd_sc_hd__o32ai_1 _206_ (.A1(net4),
    .A2(_065_),
    .A3(_067_),
    .B1(_111_),
    .B2(_120_),
    .Y(_015_));
 sky130_fd_sc_hd__nand2_1 _207_ (.A(net4),
    .B(\state[3] ),
    .Y(_068_));
 sky130_fd_sc_hd__nand2_1 _208_ (.A(_096_),
    .B(_068_),
    .Y(_069_));
 sky130_fd_sc_hd__a21oi_1 _209_ (.A1(net1),
    .A2(_069_),
    .B1(_000_),
    .Y(_070_));
 sky130_fd_sc_hd__nand2_1 _210_ (.A(_046_),
    .B(_070_),
    .Y(_016_));
 sky130_fd_sc_hd__nor2_1 _211_ (.A(net4),
    .B(_067_),
    .Y(_071_));
 sky130_fd_sc_hd__nor2_1 _212_ (.A(_065_),
    .B(_071_),
    .Y(_017_));
 sky130_fd_sc_hd__nor2_1 _213_ (.A(scl_phase),
    .B(_094_),
    .Y(_072_));
 sky130_fd_sc_hd__nand3_1 _214_ (.A(_100_),
    .B(_104_),
    .C(_107_),
    .Y(_073_));
 sky130_fd_sc_hd__a32o_1 _215_ (.A1(\state[2] ),
    .A2(_105_),
    .A3(_072_),
    .B1(_073_),
    .B2(scl_phase),
    .X(_029_));
 sky130_fd_sc_hd__nand2_1 _216_ (.A(_094_),
    .B(_007_),
    .Y(_074_));
 sky130_fd_sc_hd__o22ai_1 _217_ (.A1(_094_),
    .A2(_105_),
    .B1(_058_),
    .B2(_074_),
    .Y(_030_));
 sky130_fd_sc_hd__or3_1 _218_ (.A(\state[2] ),
    .B(\state[1] ),
    .C(\state[4] ),
    .X(_075_));
 sky130_fd_sc_hd__or3_1 _219_ (.A(\state[0] ),
    .B(\state[3] ),
    .C(_075_),
    .X(_076_));
 sky130_fd_sc_hd__inv_1 _220_ (.A(net5),
    .Y(_077_));
 sky130_fd_sc_hd__nand2_1 _221_ (.A(net1),
    .B(\state[2] ),
    .Y(_078_));
 sky130_fd_sc_hd__o221ai_1 _222_ (.A1(_111_),
    .A2(_120_),
    .B1(_076_),
    .B2(_077_),
    .C1(_078_),
    .Y(_031_));
 sky130_fd_sc_hd__nand2b_1 _223_ (.A_N(net3),
    .B(net1),
    .Y(_079_));
 sky130_fd_sc_hd__a21oi_1 _224_ (.A1(\state[2] ),
    .A2(_079_),
    .B1(_000_),
    .Y(_080_));
 sky130_fd_sc_hd__nand2_1 _225_ (.A(\state[0] ),
    .B(_080_),
    .Y(_081_));
 sky130_fd_sc_hd__a22o_1 _226_ (.A1(_075_),
    .A2(_080_),
    .B1(_081_),
    .B2(net6),
    .X(_032_));
 sky130_fd_sc_hd__nor4_1 _227_ (.A(_109_),
    .B(_038_),
    .C(_118_),
    .D(_037_),
    .Y(_082_));
 sky130_fd_sc_hd__a2bb2oi_1 _228_ (.A1_N(\timeout_count[6] ),
    .A2_N(_082_),
    .B1(_046_),
    .B2(_122_),
    .Y(_033_));
 sky130_fd_sc_hd__nand2_1 _229_ (.A(\pulse_count[2] ),
    .B(\pulse_count[1] ),
    .Y(_083_));
 sky130_fd_sc_hd__or3_1 _230_ (.A(_008_),
    .B(_054_),
    .C(_083_),
    .X(_084_));
 sky130_fd_sc_hd__nor3b_1 _231_ (.A(\pulse_count[3] ),
    .B(_084_),
    .C_N(\state[2] ),
    .Y(_085_));
 sky130_fd_sc_hd__a21boi_0 _232_ (.A1(_100_),
    .A2(_104_),
    .B1_N(\pulse_count[3] ),
    .Y(_086_));
 sky130_fd_sc_hd__and3_1 _233_ (.A(\state[2] ),
    .B(\pulse_count[3] ),
    .C(_084_),
    .X(_087_));
 sky130_fd_sc_hd__a211o_1 _234_ (.A1(_105_),
    .A2(_085_),
    .B1(_086_),
    .C1(_087_),
    .X(_034_));
 sky130_fd_sc_hd__nor2_1 _235_ (.A(net4),
    .B(_065_),
    .Y(_088_));
 sky130_fd_sc_hd__or3_1 _236_ (.A(\half_count[2] ),
    .B(net4),
    .C(_065_),
    .X(_089_));
 sky130_fd_sc_hd__a21oi_1 _237_ (.A1(_076_),
    .A2(_089_),
    .B1(net8),
    .Y(_090_));
 sky130_fd_sc_hd__a21oi_1 _238_ (.A1(_088_),
    .A2(_072_),
    .B1(_090_),
    .Y(_035_));
 sky130_fd_sc_hd__nor4_1 _239_ (.A(\state[2] ),
    .B(\state[0] ),
    .C(\state[1] ),
    .D(\state[3] ),
    .Y(_091_));
 sky130_fd_sc_hd__nor2_1 _240_ (.A(net1),
    .B(_091_),
    .Y(_013_));
 sky130_fd_sc_hd__ha_1 _241_ (.A(\timeout_count[0] ),
    .B(\timeout_count[1] ),
    .COUT(_001_),
    .SUM(_002_));
 sky130_fd_sc_hd__ha_1 _242_ (.A(_003_),
    .B(_004_),
    .COUT(_005_),
    .SUM(_006_));
 sky130_fd_sc_hd__ha_1 _243_ (.A(\half_count[0] ),
    .B(\half_count[1] ),
    .COUT(_007_),
    .SUM(_123_));
 sky130_fd_sc_hd__ha_1 _244_ (.A(_008_),
    .B(_009_),
    .COUT(_010_),
    .SUM(_011_));
 sky130_fd_sc_hd__ha_1 _245_ (.A(\pulse_count[0] ),
    .B(\pulse_count[1] ),
    .COUT(_012_),
    .SUM(_124_));
 sky130_fd_sc_hd__conb_1 _247__1 (.HI(sda_release));
 sky130_fd_sc_hd__dfrtp_1 \busy$_DFFE_PN0P_  (.D(_031_),
    .Q(net5),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \fault$_DFFE_PN0P_  (.D(_032_),
    .Q(net6),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \half_count[0]$_DFFE_PN0P_  (.D(_019_),
    .Q(\half_count[0] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \half_count[1]$_DFFE_PN0P_  (.D(_018_),
    .Q(\half_count[1] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \half_count[2]$_DFFE_PN0P_  (.D(_030_),
    .Q(\half_count[2] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input2 (.A(enable),
    .X(net1));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input3 (.A(rst_n),
    .X(net2));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input4 (.A(scl_in),
    .X(net3));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input5 (.A(sda_in),
    .X(net4));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output6 (.A(net5),
    .X(busy));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output7 (.A(net6),
    .X(fault));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output8 (.A(net7),
    .X(recovery_done));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output9 (.A(net8),
    .X(scl_release));
 sky130_fd_sc_hd__buf_4 place11 (.A(net2),
    .X(net10));
 sky130_fd_sc_hd__dfrtp_1 \pulse_count[0]$_DFFE_PN0P_  (.D(_028_),
    .Q(\pulse_count[0] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pulse_count[1]$_DFFE_PN0P_  (.D(_027_),
    .Q(\pulse_count[1] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pulse_count[2]$_DFFE_PN0P_  (.D(_026_),
    .Q(\pulse_count[2] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pulse_count[3]$_DFFE_PN0P_  (.D(_034_),
    .Q(\pulse_count[3] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \recovery_done$_DFF_PN0_  (.D(_000_),
    .Q(net7),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \scl_phase$_DFFE_PN0P_  (.D(_029_),
    .Q(scl_phase),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfstp_2 \scl_release$_DFFE_PN1P_  (.D(_035_),
    .Q(net8),
    .SET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfstp_2 \state[0]$_DFF_PN1_  (.D(_013_),
    .Q(\state[0] ),
    .SET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[1]$_DFF_PN0_  (.D(_014_),
    .Q(\state[1] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[2]$_DFF_PN0_  (.D(_015_),
    .Q(\state[2] ),
    .RESET_B(net10),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[3]$_DFF_PN0_  (.D(_016_),
    .Q(\state[3] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[4]$_DFF_PN0_  (.D(_017_),
    .Q(\state[4] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[0]$_DFFE_PN0P_  (.D(_025_),
    .Q(\timeout_count[0] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[1]$_DFFE_PN0P_  (.D(_024_),
    .Q(\timeout_count[1] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[2]$_DFFE_PN0P_  (.D(_023_),
    .Q(\timeout_count[2] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[3]$_DFFE_PN0P_  (.D(_022_),
    .Q(\timeout_count[3] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[4]$_DFFE_PN0P_  (.D(_021_),
    .Q(\timeout_count[4] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[5]$_DFFE_PN0P_  (.D(_020_),
    .Q(\timeout_count[5] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \timeout_count[6]$_DFFE_PN0P_  (.D(_033_),
    .Q(\timeout_count[6] ),
    .RESET_B(net10),
    .CLK(clknet_1_1__leaf_clk));
endmodule

/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2717149903;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *UNISIM_P_0947159679;
char *IEEE_P_0774719531;
char *IEEE_P_3564397177;
char *UNISIM_P_3222816464;
char *IEEE_P_1367372525;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_3499444699_init();
    ieee_p_0774719531_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    ieee_p_3620187407_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_3401931040_2959432447_init();
    xilinxcorelib_a_4241928121_1709443946_init();
    xilinxcorelib_a_2160421635_0543512595_init();
    xilinxcorelib_a_0363913818_3212880686_init();
    work_a_3141313704_0061377522_init();
    xilinxcorelib_a_0769294348_2959432447_init();
    xilinxcorelib_a_0094411418_1709443946_init();
    xilinxcorelib_a_0820480265_0543512595_init();
    xilinxcorelib_a_0394496243_3212880686_init();
    work_a_0771720111_3618797048_init();
    work_a_0293490426_3212880686_init();
    work_a_3135778967_3212880686_init();
    work_a_1326138332_3212880686_init();
    work_a_3387861403_3212880686_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_1490675510_1976025627_init();
    unisim_a_1997526498_2930107152_init();
    work_a_1475033672_3212880686_init();
    work_a_0608643525_3212880686_init();
    work_a_4125997296_3212880686_init();
    work_a_1504232629_2372691052_init();


    xsi_register_tops("work_a_1504232629_2372691052");

    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");

    return xsi_run_simulation(argc, argv);

}

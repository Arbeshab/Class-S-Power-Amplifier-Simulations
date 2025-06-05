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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/projects/complete_system_mash222_freq_synth_sim_corrected/sys_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *STD_TEXTIO;
extern char *IEEE_P_0774719531;

int ieee_p_0774719531_sub_5108929503364814004_2162500114(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1504232629_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(84, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6128);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12U);
    xsi_driver_first_trans_delta(t1, 1U, 12U, 0LL);

LAB2:    t7 = (t0 + 5968);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1504232629_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(85, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6192);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_delta(t1, 1U, 1, 0LL);

LAB2:    t8 = (t0 + 5984);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1504232629_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 5152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 6256);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4960);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 6256);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4960);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1504232629_2372691052_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int64 t5;
    char *t6;
    int t7;

LAB0:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 2752U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6000);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(116, ng0);
    t3 = (t0 + 5208);
    t4 = (t0 + 3936U);
    t5 = xsi_get_sim_current_time();
    std_textio_write8(STD_TEXTIO, t3, t4, t5, (unsigned char)0, 0, 1000LL);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 5208);
    t3 = (t0 + 3936U);
    t4 = (t0 + 3208U);
    t6 = *((char **)t4);
    t2 = *((unsigned char *)t6);
    std_textio_write4(STD_TEXTIO, t1, t3, t2, (unsigned char)0, 0);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 5208);
    t3 = (t0 + 3936U);
    t4 = (t0 + 2312U);
    t6 = *((char **)t4);
    t4 = (t0 + 10176U);
    t7 = ieee_p_0774719531_sub_5108929503364814004_2162500114(IEEE_P_0774719531, t6, t4);
    std_textio_write5(STD_TEXTIO, t1, t3, t7, (unsigned char)0, 0);
    goto LAB3;

}

static void work_a_1504232629_2372691052_p_4(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int64 t5;
    char *t6;
    int t7;

LAB0:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 2752U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6032);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(129, ng0);
    t3 = (t0 + 5456);
    t4 = (t0 + 4008U);
    t5 = xsi_get_sim_current_time();
    std_textio_write8(STD_TEXTIO, t3, t4, t5, (unsigned char)0, 0, 1000LL);
    xsi_set_current_line(130, ng0);
    t1 = (t0 + 5456);
    t3 = (t0 + 4008U);
    t4 = (t0 + 3328U);
    t6 = *((char **)t4);
    t2 = *((unsigned char *)t6);
    std_textio_write4(STD_TEXTIO, t1, t3, t2, (unsigned char)0, 0);
    xsi_set_current_line(131, ng0);
    t1 = (t0 + 5456);
    t3 = (t0 + 4008U);
    t4 = (t0 + 2632U);
    t6 = *((char **)t4);
    t4 = (t0 + 10192U);
    t7 = ieee_p_0774719531_sub_5108929503364814004_2162500114(IEEE_P_0774719531, t6, t4);
    std_textio_write5(STD_TEXTIO, t1, t3, t7, (unsigned char)0, 0);
    xsi_set_current_line(132, ng0);
    t1 = (t0 + 5456);
    t3 = (t0 + 3760U);
    t4 = (t0 + 4008U);
    std_textio_writeline(STD_TEXTIO, t1, t3, t4);
    goto LAB3;

}


extern void work_a_1504232629_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1504232629_2372691052_p_0,(void *)work_a_1504232629_2372691052_p_1,(void *)work_a_1504232629_2372691052_p_2,(void *)work_a_1504232629_2372691052_p_3,(void *)work_a_1504232629_2372691052_p_4};
	xsi_register_didat("work_a_1504232629_2372691052", "isim/sys_tb_isim_beh.exe.sim/work/a_1504232629_2372691052.didat");
	xsi_register_executes(pe);
}

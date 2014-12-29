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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/sineGen_tb.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3499444699;



static void work_a_4138130050_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;
    int64 t9;
    int64 t10;

LAB0:    t1 = (t0 + 3160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 4072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1648U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2968);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1768U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 1648U);
    t4 = *((char **)t2);
    t8 = *((int64 *)t4);
    t9 = (t8 / 2);
    t10 = (t7 + t9);
    t2 = (t0 + 1768U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    *((int64 *)t2) = t10;
    t6 = (t0 + 1712U);
    xsi_variable_act(t6);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 4072);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1648U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2968);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1768U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 1648U);
    t4 = *((char **)t2);
    t8 = *((int64 *)t4);
    t9 = (t8 / 2);
    t10 = (t7 + t9);
    t2 = (t0 + 1768U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    *((int64 *)t2) = t10;
    t6 = (t0 + 1712U);
    xsi_variable_act(t6);
    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4138130050_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;

LAB0:    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1648U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 * 10);
    t2 = (t0 + 3216);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);
    t2 = xsi_get_transient_memory(24U);
    memset(t2, 0, 24U);
    t3 = t2;
    memset(t3, (unsigned char)2, 24U);
    t6 = (t0 + 4136);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 24U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 7576);
    t11 = (11U != 11U);
    if (t11 == 1)
        goto LAB8;

LAB9:    t6 = (t0 + 4136);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 11U);
    xsi_driver_first_trans_delta(t6, 13U, 11U, 0LL);
    xsi_set_current_line(77, ng0);

LAB12:    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_size_not_matching(11U, 11U, 0);
    goto LAB9;

LAB10:    goto LAB2;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

}

static void work_a_4138130050_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    int64 t6;

LAB0:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3464);
    t2 = (t0 + 2512U);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 7384U);
    t5 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t4, t3);
    std_textio_write5(STD_TEXTIO, t1, t2, t5, (unsigned char)0, 0);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 3464);
    t2 = (t0 + 2512U);
    std_textio_write4(STD_TEXTIO, t1, t2, (unsigned char)9, (unsigned char)0, 0);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 3464);
    t2 = (t0 + 2512U);
    t3 = (t0 + 1768U);
    t4 = *((char **)t3);
    t6 = *((int64 *)t4);
    std_textio_write8(STD_TEXTIO, t1, t2, t6, (unsigned char)0, 0, 1000LL);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3464);
    t2 = (t0 + 2336U);
    t3 = (t0 + 2512U);
    std_textio_writeline(STD_TEXTIO, t1, t2, t3);
    t1 = (t0 + 3976);
    *((int *)t1) = 1;

LAB1:    return;
}


extern void work_a_4138130050_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4138130050_2372691052_p_0,(void *)work_a_4138130050_2372691052_p_1,(void *)work_a_4138130050_2372691052_p_2};
	xsi_register_didat("work_a_4138130050_2372691052", "isim/sineGen_tb_isim_beh.exe.sim/work/a_4138130050_2372691052.didat");
	xsi_register_executes(pe);
}

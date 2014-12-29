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
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/sineGen.vhd";
extern char *IEEE_P_0774719531;
extern char *IEEE_P_3499444699;

char *ieee_p_0774719531_sub_1496620905533649268_2162500114(char *, char *, char *, char *, char *, char *);


static void work_a_0225633957_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 7248U);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 7216U);
    t6 = ieee_p_0774719531_sub_1496620905533649268_2162500114(IEEE_P_0774719531, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (24U != t9);
    if (t10 == 1)
        goto LAB2;

LAB3:    t11 = (t0 + 4072);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 24U);
    xsi_driver_first_trans_fast(t11);
    t2 = (t0 + 3960);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(24U, t9, 0);
    goto LAB3;

}

static void work_a_0225633957_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = (47 - 47);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4136);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 24U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 3976);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0225633957_3212880686_p_2(char *t0)
{
    char t1[16];
    char t7[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = (23 - 21);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 21;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 21);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = ieee_std_logic_arith_conv_signed_signext(IEEE_P_3499444699, t1, t2, t7, 24);
    t12 = (t0 + 4200);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 24U);
    xsi_driver_first_trans_fast(t12);

LAB2:    t17 = (t0 + 3992);
    *((int *)t17) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0225633957_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0225633957_3212880686_p_0,(void *)work_a_0225633957_3212880686_p_1,(void *)work_a_0225633957_3212880686_p_2};
	xsi_register_didat("work_a_0225633957_3212880686", "isim/sineGen_tb_isim_beh.exe.sim/work/a_0225633957_3212880686.didat");
	xsi_register_executes(pe);
}

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
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/pdmModule.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_0774719531;

unsigned char ieee_p_0774719531_sub_1306448836232566608_2162500114(char *, char *, char *, char *, char *);
char *ieee_p_0774719531_sub_1496620905533649268_2162500114(char *, char *, char *, char *, char *, char *);
char *ieee_p_0774719531_sub_1496620905533721142_2162500114(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1596354913_3212880686_p_0(char *t0)
{
    char t7[16];
    char t11[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3304);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t1 = (t0 + 5944U);
    t4 = (t0 + 6098);
    t9 = (t11 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 23;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t14 = (23 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t15;
    t10 = ieee_p_0774719531_sub_1496620905533649268_2162500114(IEEE_P_0774719531, t7, t3, t1, t4, t11);
    t12 = (t7 + 12U);
    t15 = *((unsigned int *)t12);
    t17 = (1U * t15);
    t2 = (24U != t17);
    if (t2 == 1)
        goto LAB10;

LAB11:    t13 = (t0 + 3384);
    t16 = (t13 + 56U);
    t19 = *((char **)t16);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t10, 24U);
    xsi_driver_first_trans_fast(t13);

LAB6:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 5960U);
    t4 = (t0 + 1832U);
    t8 = *((char **)t4);
    t4 = (t0 + 5976U);
    t9 = ieee_p_0774719531_sub_1496620905533649268_2162500114(IEEE_P_0774719531, t7, t3, t1, t8, t4);
    t10 = (t7 + 12U);
    t15 = *((unsigned int *)t10);
    t17 = (1U * t15);
    t2 = (24U != t17);
    if (t2 == 1)
        goto LAB12;

LAB13:    t12 = (t0 + 3448);
    t13 = (t12 + 56U);
    t16 = *((char **)t13);
    t19 = (t16 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 24U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 5960U);
    t4 = (t0 + 6122);
    t9 = (t7 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 23;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t14 = (23 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t15;
    t2 = ieee_p_0774719531_sub_1306448836232566608_2162500114(IEEE_P_0774719531, t3, t1, t4, t7);
    if (t2 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 3512);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t8 = (t4 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB15:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 3576);
    t4 = (t1 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1032U);
    t8 = *((char **)t3);
    t3 = (t0 + 5944U);
    t9 = (t0 + 6074);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 23;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (23 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = ieee_p_0774719531_sub_1496620905533721142_2162500114(IEEE_P_0774719531, t7, t8, t3, t9, t11);
    t16 = (t7 + 12U);
    t15 = *((unsigned int *)t16);
    t17 = (1U * t15);
    t18 = (24U != t17);
    if (t18 == 1)
        goto LAB8;

LAB9:    t19 = (t0 + 3384);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t13, 24U);
    xsi_driver_first_trans_fast(t19);
    goto LAB6;

LAB8:    xsi_size_not_matching(24U, t17, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(24U, t17, 0);
    goto LAB11;

LAB12:    xsi_size_not_matching(24U, t17, 0);
    goto LAB13;

LAB14:    xsi_set_current_line(37, ng0);
    t10 = (t0 + 3512);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t16 = (t13 + 56U);
    t19 = *((char **)t16);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t10);
    goto LAB15;

}


extern void work_a_1596354913_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1596354913_3212880686_p_0};
	xsi_register_didat("work_a_1596354913_3212880686", "isim/pdmModule_isim_beh.exe.sim/work/a_1596354913_3212880686.didat");
	xsi_register_executes(pe);
}

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
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/msClock.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_3660129611_3212880686_p_0(char *t0)
{
    char t15[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t16;
    unsigned int t17;

LAB0:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 5208U);
    t5 = (t0 + 1648U);
    t6 = *((char **)t5);
    t5 = (t0 + 5192U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 5208U);
    t4 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t15, t3, t1, 1);
    t5 = (t15 + 12U);
    t16 = *((unsigned int *)t5);
    t17 = (1U * t16);
    t2 = (15U != t17);
    if (t2 == 1)
        goto LAB8;

LAB9:    t6 = (t0 + 3024);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 15U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 3088);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(29, ng0);
    t8 = xsi_get_transient_memory(15U);
    memset(t8, 0, 15U);
    t9 = t8;
    memset(t9, (unsigned char)2, 15U);
    t10 = (t0 + 3024);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 15U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(30, ng0);
    t1 = (t0 + 3088);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    xsi_size_not_matching(15U, t17, 0);
    goto LAB9;

}


extern void work_a_3660129611_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3660129611_3212880686_p_0};
	xsi_register_didat("work_a_3660129611_3212880686", "isim/msClock_isim_beh.exe.sim/work/a_3660129611_3212880686.didat");
	xsi_register_executes(pe);
}

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
char *ieee_p_3620187407_sub_2255506239096238868_3965413181(char *, char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_970019341842465249_3965413181(char *, char *, char *, int );


static void work_a_3660129611_3212880686_p_0(char *t0)
{
    char t3[16];
    char *t1;
    unsigned char t2;
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

LAB0:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 4944U);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t4, t1, 0);
    if (t2 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 2968);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB8:    t1 = (t0 + 2824);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 4944U);
    t6 = ieee_p_3620187407_sub_2255506239096238868_3965413181(IEEE_P_3620187407, t3, t5, t4, 1);
    t7 = (t3 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (12U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 2904);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 12U);
    xsi_driver_first_trans_fast(t11);
    goto LAB3;

LAB5:    xsi_size_not_matching(12U, t9, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(29, ng0);
    t5 = (t0 + 2968);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(30, ng0);
    t1 = (t0 + 4981);
    t5 = (t0 + 2904);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 12U);
    xsi_driver_first_trans_fast(t5);
    goto LAB8;

}


extern void work_a_3660129611_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3660129611_3212880686_p_0};
	xsi_register_didat("work_a_3660129611_3212880686", "isim/msClock_isim_beh.exe.sim/work/a_3660129611_3212880686.didat");
	xsi_register_executes(pe);
}

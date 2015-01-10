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
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/ntof_tb.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1366267000076357978_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_0079551401_2372691052_p_0(char *t0)
{
    char t14[16];
    char *t1;
    char *t2;
    int64 t3;
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
    unsigned int t15;
    unsigned int t16;

LAB0:    t1 = (t0 + 2864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t3 = (50 * 1000LL);
    t2 = (t0 + 2672);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);

LAB8:    t2 = (t0 + 1888U);
    t4 = *((char **)t2);
    t2 = (t0 + 5872U);
    t5 = (t0 + 1768U);
    t6 = *((char **)t5);
    t5 = (t0 + 5824U);
    t7 = ieee_p_3620187407_sub_1366267000076357978_3965413181(IEEE_P_3620187407, t4, t2, t6, t5);
    if (t7 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(65, ng0);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(60, ng0);
    t8 = (t0 + 1888U);
    t9 = *((char **)t8);
    t8 = (t0 + 3248);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1888U);
    t4 = *((char **)t2);
    t2 = (t0 + 5872U);
    t5 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t14, t4, t2, 1);
    t6 = (t0 + 1888U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    t9 = (t14 + 12U);
    t15 = *((unsigned int *)t9);
    t16 = (1U * t15);
    memcpy(t6, t5, t16);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 2672);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:;
LAB12:    goto LAB8;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    goto LAB2;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

}


extern void work_a_0079551401_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0079551401_2372691052_p_0};
	xsi_register_didat("work_a_0079551401_2372691052", "isim/ntof_tb_isim_beh.exe.sim/work/a_0079551401_2372691052.didat");
	xsi_register_executes(pe);
}

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



int xilinxcorelib_p_1494456928_sub_18134273225168052361_836292547(char *t1, int t2)
{
    char t4[8];
    int t0;
    char *t5;
    int t6;
    int t7;
    int t8;

LAB0:    t5 = (t4 + 4U);
    *((int *)t5) = t2;
    t6 = (t2 + 7);
    t7 = (t6 / 8);
    t8 = (t7 * 8);
    t0 = t8;

LAB1:    return t0;
LAB2:;
}

int xilinxcorelib_p_1494456928_sub_4149316172666319140_836292547(char *t1, int t2)
{
    char t4[8];
    int t0;
    char *t5;
    int t6;
    int t7;
    int t8;

LAB0:    t5 = (t4 + 4U);
    *((int *)t5) = t2;
    t6 = (t2 + 31);
    t7 = (t6 / 32);
    t8 = (t7 * 32);
    t0 = t8;

LAB1:    return t0;
LAB2:;
}


extern void xilinxcorelib_p_1494456928_init()
{
	static char *se[] = {(void *)xilinxcorelib_p_1494456928_sub_18134273225168052361_836292547,(void *)xilinxcorelib_p_1494456928_sub_4149316172666319140_836292547};
	xsi_register_didat("xilinxcorelib_p_1494456928", "isim/sineGen_tb_isim_beh.exe.sim/xilinxcorelib/p_1494456928.didat");
	xsi_register_subprogram_executes(se);
}

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
static const char *ng0 = "/home/meccastreissand/Documents/FourthYear/EE4GVHDLAssignment/designs/Digital_Audio_Synthesiser/UART_RX_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3846602194_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 4840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3752);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 4840);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3752);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3846602194_2372691052_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 1792U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4760);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(104, ng0);
    t3 = (t0 + 4904);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

}

static void work_a_3846602194_2372691052_p_2(char *t0)
{
    char t23[16];
    char t24[16];
    char t25[16];
    char t27[16];
    char t29[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t26;
    char *t28;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    t1 = (t0 + 4440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(114, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 9258);
    *((int *)t2) = 48;
    t4 = (t0 + 9262);
    *((int *)t4) = 104;
    t5 = 48;
    t6 = 104;

LAB8:    if (t5 <= t6)
        goto LAB9;

LAB11:    xsi_set_current_line(161, ng0);

LAB69:    *((char **)t1) = &&LAB70;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(119, ng0);
    t7 = (t0 + 9266);
    t9 = (t0 + 2968U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    memcpy(t9, t7, 10U);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 9276);
    *((int *)t2) = 0;
    t4 = (t0 + 9280);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB12:    if (t11 <= t12)
        goto LAB13;

LAB15:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 9284);
    t7 = (t0 + 9258);
    t8 = (t0 + 2608U);
    t9 = *((char **)t8);
    t11 = *((int *)t9);
    t8 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t23, *((int *)t7), t11);
    t19 = ((IEEE_P_2592010699) + 4000);
    t20 = (t25 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t12 = (0 - 0);
    t15 = (t12 * 1);
    t15 = (t15 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t15;
    t10 = xsi_base_array_concat(t10, t24, t19, (char)97, t2, t25, (char)97, t8, t23, (char)101);
    t21 = (t0 + 9285);
    t28 = ((IEEE_P_2592010699) + 4000);
    t30 = (t29 + 0U);
    t31 = (t30 + 0U);
    *((int *)t31) = 0;
    t31 = (t30 + 4U);
    *((int *)t31) = 0;
    t31 = (t30 + 8U);
    *((int *)t31) = 1;
    t13 = (0 - 0);
    t15 = (t13 * 1);
    t15 = (t15 + 1);
    t31 = (t30 + 12U);
    *((unsigned int *)t31) = t15;
    t26 = xsi_base_array_concat(t26, t27, t28, (char)97, t10, t24, (char)97, t21, t29, (char)101);
    t31 = (t0 + 2968U);
    t32 = *((char **)t31);
    t31 = (t32 + 0);
    t33 = (t23 + 12U);
    t15 = *((unsigned int *)t33);
    t15 = (t15 * 1U);
    t16 = (1U + t15);
    t17 = (t16 + 1U);
    memcpy(t31, t26, t17);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 9286);
    *((int *)t2) = 0;
    t4 = (t0 + 9290);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB21:    if (t11 <= t12)
        goto LAB22;

LAB24:    xsi_set_current_line(133, ng0);
    t2 = (t0 + 9294);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 10U);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 9304);
    *((int *)t2) = 0;
    t4 = (t0 + 9308);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB30:    if (t11 <= t12)
        goto LAB31;

LAB33:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 9312);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 10U);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 9322);
    *((int *)t2) = 0;
    t4 = (t0 + 9326);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB39:    if (t11 <= t12)
        goto LAB40;

LAB42:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 9330);
    t7 = (t0 + 9258);
    t8 = (t0 + 2608U);
    t9 = *((char **)t8);
    t11 = *((int *)t9);
    t8 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t23, *((int *)t7), t11);
    t19 = ((IEEE_P_2592010699) + 4000);
    t20 = (t25 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t12 = (0 - 0);
    t15 = (t12 * 1);
    t15 = (t15 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t15;
    t10 = xsi_base_array_concat(t10, t24, t19, (char)97, t2, t25, (char)97, t8, t23, (char)101);
    t21 = (t0 + 9331);
    t28 = ((IEEE_P_2592010699) + 4000);
    t30 = (t29 + 0U);
    t31 = (t30 + 0U);
    *((int *)t31) = 0;
    t31 = (t30 + 4U);
    *((int *)t31) = 0;
    t31 = (t30 + 8U);
    *((int *)t31) = 1;
    t13 = (0 - 0);
    t15 = (t13 * 1);
    t15 = (t15 + 1);
    t31 = (t30 + 12U);
    *((unsigned int *)t31) = t15;
    t26 = xsi_base_array_concat(t26, t27, t28, (char)97, t10, t24, (char)97, t21, t29, (char)101);
    t31 = (t0 + 2968U);
    t32 = *((char **)t31);
    t31 = (t32 + 0);
    t33 = (t23 + 12U);
    t15 = *((unsigned int *)t33);
    t15 = (t15 * 1U);
    t16 = (1U + t15);
    t17 = (t16 + 1U);
    memcpy(t31, t26, t17);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 9332);
    *((int *)t2) = 0;
    t4 = (t0 + 9336);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB48:    if (t11 <= t12)
        goto LAB49;

LAB51:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 9340);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    memcpy(t7, t2, 10U);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 9350);
    *((int *)t2) = 0;
    t4 = (t0 + 9354);
    *((int *)t4) = 9;
    t11 = 0;
    t12 = 9;

LAB57:    if (t11 <= t12)
        goto LAB58;

LAB60:
LAB10:    t2 = (t0 + 9258);
    t5 = *((int *)t2);
    t4 = (t0 + 9262);
    t6 = *((int *)t4);
    if (t5 == t6)
        goto LAB11;

LAB66:    t11 = (t5 + 1);
    t5 = t11;
    t7 = (t0 + 9258);
    *((int *)t7) = t5;
    goto LAB8;

LAB13:    xsi_set_current_line(121, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9276);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB14:    t2 = (t0 + 9276);
    t11 = *((int *)t2);
    t4 = (t0 + 9280);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB15;

LAB20:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9276);
    *((int *)t7) = t11;
    goto LAB12;

LAB16:    goto LAB14;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB22:    xsi_set_current_line(128, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9286);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB27:    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB23:    t2 = (t0 + 9286);
    t11 = *((int *)t2);
    t4 = (t0 + 9290);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB24;

LAB29:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9286);
    *((int *)t7) = t11;
    goto LAB21;

LAB25:    goto LAB23;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

LAB31:    xsi_set_current_line(135, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9304);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB32:    t2 = (t0 + 9304);
    t11 = *((int *)t2);
    t4 = (t0 + 9308);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB33;

LAB38:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9304);
    *((int *)t7) = t11;
    goto LAB30;

LAB34:    goto LAB32;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB40:    xsi_set_current_line(142, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9322);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB45:    *((char **)t1) = &&LAB46;
    goto LAB1;

LAB41:    t2 = (t0 + 9322);
    t11 = *((int *)t2);
    t4 = (t0 + 9326);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB42;

LAB47:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9322);
    *((int *)t7) = t11;
    goto LAB39;

LAB43:    goto LAB41;

LAB44:    goto LAB43;

LAB46:    goto LAB44;

LAB49:    xsi_set_current_line(149, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9332);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB50:    t2 = (t0 + 9332);
    t11 = *((int *)t2);
    t4 = (t0 + 9336);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB51;

LAB56:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9332);
    *((int *)t7) = t11;
    goto LAB48;

LAB52:    goto LAB50;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB58:    xsi_set_current_line(156, ng0);
    t7 = (t0 + 2968U);
    t8 = *((char **)t7);
    t7 = (t0 + 9350);
    t13 = *((int *)t7);
    t14 = (t13 - 9);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(9, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t9 = (t8 + t17);
    t18 = *((unsigned char *)t9);
    t10 = (t0 + 4968);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t18;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 2848U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4248);
    xsi_process_wait(t2, t3);

LAB63:    *((char **)t1) = &&LAB64;
    goto LAB1;

LAB59:    t2 = (t0 + 9350);
    t11 = *((int *)t2);
    t4 = (t0 + 9354);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB60;

LAB65:    t13 = (t11 + 1);
    t11 = t13;
    t7 = (t0 + 9350);
    *((int *)t7) = t11;
    goto LAB57;

LAB61:    goto LAB59;

LAB62:    goto LAB61;

LAB64:    goto LAB62;

LAB67:    goto LAB2;

LAB68:    goto LAB67;

LAB70:    goto LAB68;

}


extern void work_a_3846602194_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3846602194_2372691052_p_0,(void *)work_a_3846602194_2372691052_p_1,(void *)work_a_3846602194_2372691052_p_2};
	xsi_register_didat("work_a_3846602194_2372691052", "isim/UART_RX_tb_isim_beh.exe.sim/work/a_3846602194_2372691052.didat");
	xsi_register_executes(pe);
}

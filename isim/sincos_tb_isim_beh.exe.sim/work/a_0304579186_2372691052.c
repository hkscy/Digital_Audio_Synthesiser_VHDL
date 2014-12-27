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
static const char *ng0 = "/home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/sincos_tb.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3499444699;
extern char *STD_STANDARD;

char *ieee_p_3499444699_sub_17544701978858283880_3536714472(char *, char *, int , int );


static void work_a_0304579186_2372691052_p_0(char *t0)
{
    char t8[16];
    char t24[16];
    char t26[16];
    char t32[16];
    char t34[16];
    char t38[16];
    char t44[16];
    char t49[16];
    char t51[16];
    char t55[16];
    char t61[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int64 t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    int t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    char *t25;
    char *t27;
    char *t28;
    int t29;
    char *t31;
    char *t33;
    char *t35;
    char *t36;
    int t37;
    char *t39;
    char *t40;
    int t41;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    char *t48;
    char *t50;
    char *t52;
    char *t53;
    int t54;
    char *t56;
    char *t57;
    int t58;
    char *t59;
    char *t60;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;

LAB0:    t1 = (t0 + 3200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);

LAB4:    t2 = (t0 + 2376U);
    t3 = std_textio_endfile(t2);
    t4 = (!(t3));
    if (t4 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(73, ng0);

LAB18:    *((char **)t1) = &&LAB19;

LAB1:    return;
LAB5:    xsi_set_current_line(60, ng0);
    t5 = (t0 + 3008);
    t6 = (t0 + 2376U);
    t7 = (t0 + 2552U);
    std_textio_readline(STD_TEXTIO, t5, t6, t7);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3008);
    t5 = (t0 + 2552U);
    t6 = (t0 + 1808U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    std_textio_read10(STD_TEXTIO, t2, t5, t6);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3008);
    t5 = (t0 + 2552U);
    t6 = (t0 + 1928U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    std_textio_read10(STD_TEXTIO, t2, t5, t6);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1808U);
    t5 = *((char **)t2);
    t9 = *((int *)t5);
    t2 = ieee_p_3499444699_sub_17544701978858283880_3536714472(IEEE_P_3499444699, t8, t9, 24);
    t6 = (t8 + 12U);
    t10 = *((unsigned int *)t6);
    t10 = (t10 * 1U);
    t3 = (24U != t10);
    if (t3 == 1)
        goto LAB8;

LAB9:    t7 = (t0 + 3584);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 24U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(66, ng0);
    t15 = (10 * 1000LL);
    t2 = (t0 + 3008);
    xsi_process_wait(t2, t15);

LAB12:    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB6:;
LAB8:    xsi_size_not_matching(24U, t10, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1512U);
    t5 = *((char **)t2);
    t10 = (47 - 47);
    t16 = (t10 * 1U);
    t17 = (0 + t16);
    t2 = (t5 + t17);
    t6 = (t8 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 47;
    t7 = (t6 + 4U);
    *((int *)t7) = 24;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t9 = (24 - 47);
    t18 = (t9 * -1);
    t18 = (t18 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t18;
    t19 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t2, t8);
    t7 = (t0 + 2048U);
    t11 = *((char **)t7);
    t7 = (t11 + 0);
    *((int *)t7) = t19;
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1928U);
    t5 = *((char **)t2);
    t9 = *((int *)t5);
    t2 = (t0 + 2048U);
    t6 = *((char **)t2);
    t19 = *((int *)t6);
    t20 = (t9 - t19);
    t21 = (t20>=0?t20: -t20);
    t3 = (t21 <= 1);
    if (t3 == 0)
        goto LAB14;

LAB15:    goto LAB4;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

LAB14:    t2 = (t0 + 6812);
    t11 = ((STD_STANDARD) + 384);
    t12 = (t0 + 1808U);
    t13 = *((char **)t12);
    t22 = *((int *)t13);
    t12 = xsi_int_to_mem(t22);
    t14 = xsi_string_variable_get_image(t8, t11, t12);
    t25 = ((STD_STANDARD) + 984);
    t27 = (t26 + 0U);
    t28 = (t27 + 0U);
    *((int *)t28) = 1;
    t28 = (t27 + 4U);
    *((int *)t28) = 40;
    t28 = (t27 + 8U);
    *((int *)t28) = 1;
    t29 = (40 - 1);
    t10 = (t29 * 1);
    t10 = (t10 + 1);
    t28 = (t27 + 12U);
    *((unsigned int *)t28) = t10;
    t23 = xsi_base_array_concat(t23, t24, t25, (char)97, t2, t26, (char)97, t14, t8, (char)101);
    t28 = (t0 + 6852);
    t33 = ((STD_STANDARD) + 984);
    t35 = (t34 + 0U);
    t36 = (t35 + 0U);
    *((int *)t36) = 1;
    t36 = (t35 + 4U);
    *((int *)t36) = 17;
    t36 = (t35 + 8U);
    *((int *)t36) = 1;
    t37 = (17 - 1);
    t10 = (t37 * 1);
    t10 = (t10 + 1);
    t36 = (t35 + 12U);
    *((unsigned int *)t36) = t10;
    t31 = xsi_base_array_concat(t31, t32, t33, (char)97, t23, t24, (char)97, t28, t34, (char)101);
    t36 = ((STD_STANDARD) + 384);
    t39 = (t0 + 1928U);
    t40 = *((char **)t39);
    t41 = *((int *)t40);
    t39 = xsi_int_to_mem(t41);
    t42 = xsi_string_variable_get_image(t38, t36, t39);
    t45 = ((STD_STANDARD) + 984);
    t43 = xsi_base_array_concat(t43, t44, t45, (char)97, t31, t32, (char)97, t42, t38, (char)101);
    t46 = (t0 + 6869);
    t50 = ((STD_STANDARD) + 984);
    t52 = (t51 + 0U);
    t53 = (t52 + 0U);
    *((int *)t53) = 1;
    t53 = (t52 + 4U);
    *((int *)t53) = 15;
    t53 = (t52 + 8U);
    *((int *)t53) = 1;
    t54 = (15 - 1);
    t10 = (t54 * 1);
    t10 = (t10 + 1);
    t53 = (t52 + 12U);
    *((unsigned int *)t53) = t10;
    t48 = xsi_base_array_concat(t48, t49, t50, (char)97, t43, t44, (char)97, t46, t51, (char)101);
    t53 = ((STD_STANDARD) + 384);
    t56 = (t0 + 2048U);
    t57 = *((char **)t56);
    t58 = *((int *)t57);
    t56 = xsi_int_to_mem(t58);
    t59 = xsi_string_variable_get_image(t55, t53, t56);
    t62 = ((STD_STANDARD) + 984);
    t60 = xsi_base_array_concat(t60, t61, t62, (char)97, t48, t49, (char)97, t59, t55, (char)101);
    t63 = (t8 + 12U);
    t10 = *((unsigned int *)t63);
    t16 = (40U + t10);
    t17 = (t16 + 17U);
    t64 = (t38 + 12U);
    t18 = *((unsigned int *)t64);
    t65 = (t17 + t18);
    t66 = (t65 + 15U);
    t67 = (t55 + 12U);
    t68 = *((unsigned int *)t67);
    t69 = (t66 + t68);
    xsi_report(t60, t69, (unsigned char)1);
    goto LAB15;

LAB16:    goto LAB2;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

}


extern void work_a_0304579186_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0304579186_2372691052_p_0};
	xsi_register_didat("work_a_0304579186_2372691052", "isim/sincos_tb_isim_beh.exe.sim/work/a_0304579186_2372691052.didat");
	xsi_register_executes(pe);
}

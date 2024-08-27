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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Rian/Documents/MICROELETRONICA/LAB5_N - Copia/controle_garagem/temporizador.vhd";



static void work_a_4008741536_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    int t12;
    char *t13;
    int t14;
    unsigned char t15;
    char *t16;
    int t17;
    int t18;
    char *t19;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2328U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 2328U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t12;

LAB3:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 3952);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t13 = *((char **)t11);
    *((int *)t13) = t12;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 4016);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t13 = *((char **)t11);
    *((int *)t13) = t12;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3872);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 2448U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(28, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 2328U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    goto LAB3;

LAB5:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1352U);
    t8 = *((char **)t2);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t3 = t7;
    goto LAB9;

LAB10:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2328U);
    t11 = *((char **)t2);
    t12 = *((int *)t11);
    t2 = (t0 + 2208U);
    t13 = *((char **)t2);
    t14 = *((int *)t13);
    t15 = (t12 < t14);
    if (t15 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 2328U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t14 = (t12 + 1);
    t1 = (t0 + 2568U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t14;
    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 2088U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t3 = (t12 == t14);
    if (t3 != 0)
        goto LAB16;

LAB18:
LAB17:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2328U);
    t16 = *((char **)t2);
    t17 = *((int *)t16);
    t18 = (t17 + 1);
    t2 = (t0 + 2328U);
    t19 = *((char **)t2);
    t2 = (t19 + 0);
    *((int *)t2) = t18;
    goto LAB14;

LAB16:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2568U);
    t8 = *((char **)t1);
    t1 = (t8 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t14 = (t12 + 1);
    t1 = (t0 + 2448U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t14;
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t12 = *((int *)t2);
    t1 = (t0 + 1968U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t3 = (t12 == t14);
    if (t3 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB17;

LAB19:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2448U);
    t8 = *((char **)t1);
    t1 = (t8 + 0);
    *((int *)t1) = 0;
    goto LAB20;

}


extern void work_a_4008741536_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4008741536_3212880686_p_0};
	xsi_register_didat("work_a_4008741536_3212880686", "isim/porta_garagem_tb_isim_beh.exe.sim/work/a_4008741536_3212880686.didat");
	xsi_register_executes(pe);
}

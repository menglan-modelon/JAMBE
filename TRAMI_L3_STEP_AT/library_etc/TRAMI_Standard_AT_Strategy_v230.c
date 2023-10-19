















typedef signed char       schar;
typedef unsigned char     uchar;
typedef signed short      sshort;
#define TRUE        1               
#define FALSE       0               
#define _LoopTime   10.0f           
#define _MaxGr      12              
#define _MaxCL      _MaxGr          
#define _MaxSyn     (_MaxGr - 1)    
#define _GrRev      11              
#define _GrNP       0               
#define _Shift_Up   1
#define _Shift_CD   2
#define _Shift_TD   3
#define _Shift_ND   4
#define _Shift_NR   5
#define _PI  3.141592

#include "TRAMI_Standare_AT_StrategyData_v230_L3_9AT_d01.c"



    
    float   r_starting_device_input     ;
    float   r_gearbox_input             ;
    float   r_gearbox_output            ;
    float   r_synchoro_dif [_MaxSyn]    ;
    float   temp_trans_fluid            ;
    float   temp_engine_water           ;
    float   v_vehicle                   ;
    float   tq_brake                    ;
    float   accel_position              ;
    sshort  shifter_position            ;
    float   r_engine                    ;
    float   r_engine_idle               ;
    float   tq_engine_target            ;
    float   tq_engine                   ;
    float   tq_engine_min_pos           ;
    float   tq_engine_max_pos           ;
    float   tq_p2m_req                  ;
    schar   flag_k0cl_open_req          ;
    float   r_p2m                       ;
    float   f_synchro_old[_MaxSyn]      ;
    
    float   gear_ratio_old              ;
    schar   flag_shift_old              ;
    schar   flag_shift_end_speed_old    ;
    schar   flag_ap_load_shift_old      ;
    schar   flag_tq_load_shift_old      ;
    sshort  gear_shift_map_old          ;
    sshort  gear_target_old             ;
    sshort  gear_before_shift_old       ;
    sshort  gear_sub1_tmp_old           ;
    sshort  gear_sub2_tmp_old           ;
    float   t_shift_wait_old            ;
    float   t_shift_period_old          ;
    float   t_shift_interval_old        ;
    float   t_tq_phase_old              ;
    float   t_shift_end_old             ;
    float   t_neutral_old               ;
    schar   flag_cvt_step_shift_old     ;
    schar   flag_cvt_step_shift_ap_old  ;

    
    schar   flag_engine_idle_control    ;

    
    float   tq_cl_creep_cont            ;

    
    float   tq_torq_converter_input     ;
    float   tq_torq_converter_output    ;
    float   spd_ratio_torq_converter    ;
    float   torq_ratio_torq_converter   ;
    float   cap_factor_torq_converter   ;

    
    float   tq_cl_slip_control          ;
    float   r_cl_slip_target            ;
    float   r_cl_slip_act               ;
    float   r_starting_device_target    ;
    float   tq_torq_converter_slip_tg   ;
    float   tq_cl_slip_base             ;
    float   tq_cl_slip_correct          ;
    float   tq_flyweel_output           ;

    
    float   tq_gearbox_input            ;

    
    schar   flag_load_shift             ;
    schar   flag_ap_load_shift          ;
    schar   flag_tq_load_shift          ;

    
    schar   flag_cvt_step_shift         ;
    schar   flag_cvt_step_shift_ap      ;

    
    float   virtual_gear_cvt_map        ;

    
    sshort  gear_shift_map              ;

    
    schar   flag_shift_end_judge        ;
    schar   flag_shift_end_speed        ;
    float   t_shift_end                 ;

    
    sshort  gear_target                 ;
    sshort  gear_before_shift           ;
    float   virtual_gear_target         ;
    float   virtual_gear_before_shift   ;
    float   t_shift_wait                ;
    float   t_shift_period              ;
    float   t_shift_interval                ;
    schar   flag_shift                  ;
    float   r_gb_input_tg_gear          ;

    
    sshort  gear_shift_kind             ;

    
    float   gear_ratio                  ;
    float   gear_ratio_before_shift     ;
    float   gear_ratio_after_shift      ;

    
    sshort  gear_sub                    ;
    sshort  gear_sub1                   ;
    sshort  gear_sub2                   ;
    float   t_neutral                   ;
    sshort  gear_sub1_tmp               ;
    sshort  gear_sub2_tmp               ;

    
    schar   flag_synchro_ready          ;

    
    sshort  gear_cl_com                 ;

    
    sshort  n_engage_clutch             ;
    sshort  n_release_clutch            ;

    
    float   tq_inertia_engage_cl        ;
    float   tq_inertia_release_cl       ;
    float   tq_shift_up_reduction_req   ;
    float   tq_shift_up_reduction       ;
    float   tq_eng_shift_up_reduction   ;
    float   tq_p2m_shift_up_reduction   ;
    float   t_shift_time_tg             ;
    float   r_delta_speed               ;
    float   tq_inertia                  ;

    
    float   rate_torque_phase           ;
    float   t_tq_phase                  ;

    
    float   tq_clutch_cap_inp   [_MaxCL];
    float   tq_engage_cl_cap            ;
    float   tq_release_cl_cap           ;

    
    float   tq_clutch_cap       [_MaxCL];
    float   rate_clutch_share   [_MaxCL];

    
    float   f_synchro           [_MaxSyn];
    schar   flag_synchro_com    [_MaxSyn];

    
    float   viscosity_trans_fluid       ;
    float   density_trans_fluid         ;

    
    float   p_line                      ;

    
    float   p_pulley_primary            ;
    float   p_pulley_secoundary         ;
    float   p_pulley_sec_base           ;
    float   factor_safety_pulley_sec    ;
    float   p_pulley_sec_min            ;
    float   radius_pulley_pri           ;
    float   radius_pulley_sec           ;
    float   radius_pullye_sec_od        ;
    float   stroke_pulley_sec           ;
    float   f_spg_pulley_sec            ;
    float   f_centrifugal_pr_sec        ;
    float   f_clamp_pully_sec           ;
    float   ratio_variator_cap          ;
    float   ratio_pulley_clamp          ;
    float   f_clamp_pully_pri           ;
    float   f_centrifugal_pr_pri        ;

    
    float   i_actuator                  ;

    
    float   i_eop                       ;

    
    float   q_cooler_trans_fluid        ;
    float   q_cooler_engine_water       ;

    
    schar   flag_shift_up_tq_request    ;

    
    float   tq_engine_max_req           ;
    float   tq_engine_min_req           ;
    float   r_engine_target             ;

    
    float   tq_trans_input              ;
    float   tq_gain_drivetrain          ;
    schar   flag_lockup                 ;

    
    float   tq_k0_clutch_cap            ;
    sshort  status_k0_clutch            ;

    
    float   tq_p2m_target               ;

    
    float   tq_starting_device_input    ;







extern void TCU_Main(
    
    
    float   *trans_gear                     ,   
    float   *trans_gear_ratio               ,   
    float   tau_clutch_cap  [_MaxCL]        ,   
    float   f_synchro_n     [_MaxSyn]       ,   
    float   *tau_k0_clutch_cap              ,   
    float   *tau_p2m_target                 ,   
    float   *p_line_pa                      ,   
    float   *p_pulley_pri_pa                ,   
    float   *p_pulley_sec_pa                ,   
    float   *i_actuator_ampere              ,   
    float   *i_eop_ampere                   ,   
    float   *qv_cooler_trans_fluid_m3ps     ,   
    float   *qv_cooler_eng_water_m3ps       ,   
    
    float   *torque_gain_drivetrain         ,   
    schar   *flag_trans_shift               ,   
    
    float   *tau_engine_max_req             ,   
    float   *tau_engine_min_req             ,   
    float   *w_engine_target_radps          ,   
    float   *tau_trans_input                ,   
    schar   *flag_trans_lockup              ,   
    
    schar   flag_initialize                 ,   
    
    float   w_starting_device_input_radps   ,   
    float   w_gearbox_input_radps           ,   
    float   w_gearbox_output_radps          ,   
    float   w_synchoro_dif_radps[_MaxSyn]   ,   
    float   t_trans_fluid_k                 ,   
    float   t_engine_water_k                ,   
    
    float   v_vehicle_mps                   ,   
    float   tau_brake                       ,   
    
    float   accel_position_per              ,   
    sshort  trans_shifter_position          ,   
    
    float   w_engine_radps                  ,   
    float   w_engine_idle_radps             ,   
    float   tau_engine_target               ,   
    float   tau_engine                      ,   
    float   tau_engine_min_pos              ,   
    float   tau_engine_max_pos              ,   
    
    float   tau_p2m_req                     ,   
    schar   flag_k0_clutch_open             ,   
    sshort  drive_mode                      ,   
    
    float   obs_tcu[10]                         
) ;

float      F_abs( float val  );
float      F_max( float val_1,float val_2  );
float      F_min( float val_1,float val_2  );
float      Table_search_2D( void *tbl, void *axis, float data, uchar num  );
float      Table_search_3D( void *map, float x_nrm, uchar xn, float y_nrm, uchar yn  );
float      Table_search_4D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn,  float nrm_z, uchar zn);
void       Switch_with_hys(schar *flag, schar flag_old, float val, float cal, float hys);
float      F_Pow ( float val , uchar n );
void    TCU_Engin_Idle_Control (
        
        schar   *flag_engine_idle_control,
        
        schar    flag_initialize,
        float   r_engine_idle,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        float   r_gb_input_tg_gear
);
void    TCU_Creep_Control (
        
        float   *tq_cl_creep_cont,
        
        schar    flag_initialize,
        sshort  gear_target
);
void    TCU_Fluid_Coupling_Torque (
        
        float   *tq_torq_converter_input,
        float   *tq_torq_converter_output,
        float   *spd_ratio_torq_converter,
        float   *torq_ratio_torq_converter,
        float   *cap_factor_torq_converter,
        
        float   r_starting_device_input,
        float   r_gearbox_input
);
void    TCU_Slip_Control (
        
        float   *tq_cl_slip_control,        
        float   *r_cl_slip_target,          
        float   *r_cl_slip_act,             
        float   *r_starting_device_target,  
        float   *tq_torq_converter_slip_tg, 
        float   *tq_cl_slip_base,
        float   *tq_cl_slip_correct,
        float   *tq_flyweel_output,
        
        schar    flag_initialize,
        schar   flag_shift,
        float   r_starting_device_input,
        float   r_gb_input_tg_gear,
        float   tq_starting_device_input,
        float   r_engine_idle,
        float   gear_ratio_after_shift,
        sshort  gear_target,
        sshort  gear_target_old,
        schar   flag_engine_idle_control,   
        schar   flag_k0cl_open_req
);
void    TCU_Torque_Input_GearBox(
        
        float   *tq_gearbox_input,
        
        float   tq_starting_device_input,
        float   torq_ratio_torq_converter
);
void     TCU_Load_shift(
        
        schar   *flag_load_shift,
        schar   *flag_ap_load_shift,
        schar   *flag_tq_load_shift,
        
        schar   flag_ap_load_shift_old,
        schar   flag_tq_load_shift_old,
        float   accel_position,
        float   tq_engine_target
);
void     TCU_CVT_Step_Shift (
        
        schar   *flag_cvt_step_shift,    
        schar   *flag_cvt_step_shift_ap, 
        
        float   accel_position,
        schar   flag_cvt_step_shift_old,
        schar   flag_cvt_step_shift_ap_old,
        schar   flag_shift
);
void     TCU_Shift_Schedule(
        
        sshort  *gear_shift_map,
        
        sshort  gear_shift_map_old,
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle,
        schar   flag_cvt_step_shift,
        schar   flag_k0cl_open_req
);
void     TCU_Continuously_shift_schedule (
        
        float   *virtual_gear_cvt_map,  
        
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle
);

void     TCU_Shift_End_Jugdement (
        
        schar   *flag_shift_end_judge,
        schar   *flag_shift_end_speed,
        float   *t_shift_end,
        
        schar   flag_shift_end_speed_old,
        float   t_shift_end_old,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   rate_torque_phase,
        sshort  gear_shift_kind,
        float   t_shift_period
);
void     TCU_Gear_Target(
        
        sshort  *gear_target,               
        sshort  *gear_before_shift,         
        float   *virtual_gear_target,       
        float   *virtual_gear_before_shift, 
        float   *t_shift_wait,
        float   *t_shift_period,
        float   *t_shift_interval,
        schar   *flag_shift,
        
        schar    flag_initialize,
        sshort  gear_before_shift_old,
        float   t_shift_wait_old,
        float   t_shift_period_old,
        float   t_shift_interval_old,
        schar   flag_shift_old,
        sshort  gear_shift_map,
        sshort  gear_shift_map_old,
        schar   flag_load_shift,
        sshort  shifter_position,
        schar   flag_shift_end_judge,
        schar   flag_cvt_step_shift,
        schar   flag_cvt_step_shift_old,
        float   virtual_gear_cvt_map
);
void    TCU_Gear_Shift_Type (
        
        sshort  *gear_shift_kind,
        
        schar   flag_load_shift,
        schar   flag_shift,
        sshort  gear_target,
        sshort  gear_before_shift
);
void     TCU_Target_Gear_Ratio (
        
        float   *gear_ratio         ,       
        float   *gear_ratio_befire_shift,   
        float   *gear_ratio_after_shift,    
        float   *r_gb_input_tg_gear,        
        
        float   gear_ratio_old,
        sshort  gear_target,
        sshort  gear_before_shift,
        float   virtual_gear_cvt_map
);
void     TCU_Sub_Gear(
        
        sshort  *gear_sub,
        sshort  *gear_sub1,
        sshort  *gear_sub2,
        float   *t_neutral,
        sshort  *gear_sub1_tmp,
        sshort  *gear_sub2_tmp,
        
        sshort  gear_sub1_tmp_old,
        sshort  gear_sub2_tmp_old,
        float   t_neutral_old,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        sshort  shifter_position,
        schar   flag_shift
);
void     TCU_SYNCHORO_STATUS (
        
        schar   *flag_synchro_ready,
        
        sshort  gear_target,
        float   f_synchro      [_MaxSyn],
        float   r_synchoro_dif [_MaxSyn]
);
void     TCU_Gear_Clutch_Control(
        
        sshort  *gear_cl_com,
        
        schar    flag_initialize,
        schar   flag_synchro_ready,
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_shift_kind,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear
);
void     TCU_Shift_Clutch (
    
        sshort  *n_engage_clutch,
        sshort  *n_release_clutch,
        
        sshort  gear_target,
        sshort  gear_before_shift
);
void    TCU_Shift_Inertia_Torq (
        
        float *tq_inertia_engage_cl,        
        float *tq_inertia_release_cl,       
        float *tq_shift_up_reduction_req,   
        float *tq_shift_up_reduction,       
        float *tq_eng_shift_up_reduction,   
        float *tq_p2m_shift_up_reduction,   
        float *t_shift_time_tg,             
        float *r_delta_speed,               
        float *tq_inertia,                  
        
        schar    flag_initialize,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        float   r_p2m,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   tq_engine_target,
        float   tq_engine_min_pos,
        schar   flag_k0cl_open_req,
        float   tq_p2m_req
);
void     TCU_Torque_Phase (
        
        float   *rate_torque_phase,
        float   *t_tq_phase,
        
        float   t_tq_phase_old,
        schar   flag_shift,
        sshort  gear_shift_kind,
        sshort  gear_cl_com,
        sshort  gear_target
);
void     TCU_Clutch_Control (
        
        float   tq_clutch_cap_inp[_MaxCL],
        float   *tq_engage_cl_cap,
        float   *tq_release_cl_cap,
        
        float   tq_gearbox_input,
        float   tq_cl_slip_control,
        float   tq_inertia_engage_cl,
        float   tq_inertia_release_cl,
        float   rate_torque_phase,
        schar   flag_shift,
        sshort  n_engage_clutch,
        sshort  n_release_clutch,
        sshort  gear_cl_com,
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_cl_creep_cont
);
void     TCU_Clutch_Torque_Capacity (
        
        float   *tq_clutch_cap,
        float   *rate_clutch_share,
        
        sshort  gear_target,
        sshort  gear_before_shift,
        float   tq_clutch_cap_inp[]
);
void     TCU_SYNCHORO_CONTROL (
        
        float   f_synchro     [_MaxSyn],
        schar   flag_synchro_com [_MaxSyn],
        
        float   f_synchro_old [_MaxSyn],
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_sub1,
        sshort  gear_sub2
);
void     TCU_Pressure_CVT_Pulley (
        
        float   *p_pulley_primary,
        float   *p_pulley_secoundary,
        
        float   tq_gearbox_input,
        float   r_gearbox_input,
        float   r_gearbox_output,
        float   gear_ratio,
        float   gear_ratio_after_shift,
        float   viscosity_trans_fluid,
        float   density_trans_fluid
);
void     TCU_Trans_Fluid_Characteristic (
        
        float   *viscosity_trans_fluid,             
        float   *density_trans_fluid,               
        
        float   temp_trans_fluid
);
void     TCU_Pressure_Line_Control (
        
        float   *p_line,
        
        float   tq_gearbox_input,
        sshort  gear_target,
        float   p_pulley_primary,
        float   p_pulley_secoundary
);
void     TCU_Acutuator_Control (
        
        float   *i_actuator,
        
        sshort  gear_target
);
void     TCU_EOP_Control (
        
        float   *i_eop,
        
        float   r_engine,
        float   temp_trans_fluid
);
void     TCU_Cooler_Flow_Rate_Control (
        
        float   *q_cooler_trans_fluid,
        float   *q_cooler_engine_water,
        
        float   temp_trans_fluid
);
void     TCU_Up_Shift_Torque_Reduction (
        
        schar   *flag_shift_up_tq_request,
        
        float    tq_eng_shift_up_reduction,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_before_shift,
        schar   flag_shift,
        float   rate_torque_phase,
        float   r_gb_input_tg_gear,
        float   r_gearbox_input,
        float   tq_engine_min_pos,
        float   tq_inertia_engage_cl
);
void     TCU_Engine_Torque_Request (
        
        float   *tq_engine_max_req,         
        float   *tq_engine_min_req,         
        float   *r_engine_target,           
        
        float   tq_engine_target,
        float   tq_eng_shift_up_reduction,
        schar   flag_shift_up_tq_request,
        schar   flag_k0cl_open_req
);
void     TCU_Information_For_ECU (
        
        float   *tq_trans_input             ,   
        float   *tq_gain_drivetrain         ,   
        schar   *flag_lockup                ,   
        
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_torq_converter_input,
        float   tq_cl_creep_cont,
        float   tq_cl_slip_base,
        float   gear_ratio,
        float   torq_ratio_torq_converter
);
void     TCU_Disconnect_Clutch_Control(
        
        float   *tq_k0_clutch_cap,      
        sshort  *status_k0_clutch,      
        
        schar   flag_k0cl_open_req, 
        float   r_engine,               
        float   r_starting_device_input,
        float   tq_engine_target,       
        schar    flag_initialize

);
void     TCU_P2_Motor_Control(
        
        float   *tq_p2m_target,         
        
        sshort  status_k0_clutch,
        schar   flag_shift_up_tq_request,
        float   tq_starting_device_input,
        float   tq_p2m_req,
        float   r_engine,
        float   tq_p2m_shift_up_reduction
);
void    TCU_Torque_Input_Starting_Device(
        
        float   *tq_starting_device_input,      
        
        float   tq_engine_target,
        float   tq_p2m_target
);








float      F_abs( float val ){
    
    
    
    float ans;
    if( val > 0.0 ) { ans =  val; }
    else            { ans = -val; }
    return(ans);
}

float      F_max(float val_1,float val_2){
    
    
    
    float ans;
    if( val_1 >= val_2 ) { ans = val_1; }
    else                 { ans = val_2; }
    return(ans);
}

float      F_min(float val_1,float val_2){
    
    
    
    float ans;
    if( val_1 <= val_2 ) { ans = val_1; }
    else                 { ans = val_2; }
    return(ans);
}


float      Table_search_2D( void *tbl, void *axis, float data, uchar num ){
    
    
    
    uchar   data_int  ;
    uchar   i     ;
    float   xdata ;
    float   flt   ;
    float   ans   ;

    if (  data < *(float*)axis  )        {  data = *(float*)axis         ;}
    if (  *((float*)axis+num-1) < data  ){  data = *((float*)axis+num-1) ;}

    for(  i=1  ; ( i < num-1 ) && ( *((float*)axis+i) <= data )  ;  i++ );

    if ( *((float*)axis+i) - *((float*)axis+i-1) ==0 ) {
        xdata = (float)i - 1.0f;
    }
    else {
        xdata = ( data - *((float*)axis+i-1) )
                  / ( *((float*)axis+i) - *((float*)axis+i-1) ) + (float)i - 1.0f;
    }
    data_int = ( uchar ) xdata ;
    flt = xdata - ( float ) data_int ;
    if(data_int >= num-1){ ans = *((float*)tbl+num-1);}
    else{
        ans = flt * ( *((float*)tbl+data_int+1) - *((float*)tbl+data_int)) + *((float*)tbl+data_int);
    }
    return ans;
}


float      Table_search_3D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn ){
    
    
    
    uchar   int_x ;
    uchar   int_y ;
    uchar   offset1 ;
    uchar   offset2 ;
    float   flt_x  ;
    float   flt_y  ;
    float   x1    ;
    float   x2    ;
    float   ans   ;

    
    nrm_x = F_max(  0.0, F_min( nrm_x,(float)(xn-1) )  );
    nrm_y = F_max(  0.0, F_min( nrm_y,(float)(yn-1) )  );
    
    int_x = ( uchar ) nrm_x ;
    int_y = ( uchar ) nrm_y ;
    flt_x = nrm_x - ( float ) int_x ;
    flt_y = nrm_y - ( float ) int_y ;
    offset1 = xn * int_y;
    offset2 = xn *(int_y+1);
    
    if( flt_x == 0.0 ){
        x1 = *( (float*)map + offset1+int_x );
    }
    else{
        x1 = flt_x * ( *((float*)map + offset1 + int_x + 1 ) - *( (float*)map + offset1 + int_x ) )
              + *( (float*)map + offset1 + int_x);
    }
    
    if( flt_y ==0.0 ){
        x2 = x1;
    }
    else {
        if( flt_x == 0.0 ){
            x2 = *( (float*)map + offset2 + int_x );
        }
        else {
            x2 = flt_x * ( *((float*)map + offset2 + int_x + 1 ) - *( (float*)map + offset2 + int_x ) )
                + *((float*)map+offset2+int_x);
        }

    }
    
    ans = flt_y * ( x2 - x1 ) + x1;
    return ans;
}


float      Table_search_4D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn,  float nrm_z, uchar zn){
    
    
    
    uchar   i_z1 ;
    uchar   i_z2 ;
    float   z1   ;
    float   z2   ;
    uchar   int_z ;
    float   flt_z  ;
    float   ans  ;
    
    nrm_z = F_max(  0.0, F_min( nrm_z,(float)(zn-1) )  );
    
    i_z1 = (uchar)nrm_z ;
    i_z2 = (uchar)nrm_z + 1 ;
    z1 = Table_search_3D( (float*)map + (xn * yn * i_z1), nrm_x, xn, nrm_y, yn );
    z2 = Table_search_3D( (float*)map + (xn * yn * i_z2), nrm_x, xn, nrm_y, yn );
    int_z = ( uchar ) nrm_z ;
    flt_z = nrm_z - ( float ) int_z ;
    ans = flt_z * ( z2 - z1 ) + z1;
    return ans;
}


void       Switch_with_hys(schar *flag, schar flag_old, float val, float cal, float hys){
   
    
    
    if     ( val>=cal)     { *flag=TRUE; }
    else if( val< cal-hys) { *flag=FALSE;}
    else                   { *flag=flag_old;}
}

float      F_Pow ( float val , uchar n ){
   
    
    
    sshort   i;
    float ans;
    ans = val;
    for( i = 0 ; i < n-1 ; i++ ){
        ans = ans * val ;
    }
    return ans;
}














void     TCU_Main(
    
    
    float   *trans_gear                     ,   
    float   *trans_gear_ratio               ,   
    float   tau_clutch_cap  [_MaxCL]        ,   
    float   f_synchro_n     [_MaxSyn]       ,   
    float   *tau_k0_clutch_cap              ,   
    float   *tau_p2m_target                 ,   
    float   *p_line_pa                      ,   
    float   *p_pulley_pri_pa                ,   
    float   *p_pulley_sec_pa                ,   
    float   *i_actuator_ampere              ,   
    float   *i_eop_ampere                   ,   
    float   *qv_cooler_trans_fluid_m3ps     ,   
    float   *qv_cooler_eng_water_m3ps       ,   
    
    float   *torque_gain_drivetrain         ,   
    schar   *flag_trans_shift               ,   
    
    float   *tau_engine_max_req             ,   
    float   *tau_engine_min_req             ,   
    float   *w_engine_target_radps          ,   
    float   *tau_trans_input                ,   
    schar   *flag_trans_lockup              ,   
    
    schar   flag_initialize                 ,   
    
    float   w_starting_device_input_radps   ,   
    float   w_gearbox_input_radps           ,   
    float   w_gearbox_output_radps          ,   
    float   w_synchoro_dif_radps[_MaxSyn]   ,   
    float   t_trans_fluid_k                 ,   
    float   t_engine_water_k                ,   
    
    float   v_vehicle_mps                   ,   
    float   tau_brake                       ,   
    
    float   accel_position_per              ,   
    sshort  trans_shifter_position          ,   
    
    float   w_engine_radps                  ,   
    float   w_engine_idle_radps             ,   
    float   tau_engine_target               ,   
    float   tau_engine                      ,   
    float   tau_engine_min_pos              ,   
    float   tau_engine_max_pos              ,   
    
    float   tau_p2m_req                     ,   
    schar   flag_k0_clutch_open             ,   
    sshort  drive_mode                      ,   
    
    float   obs_tcu[10]                         
) {
    sshort  i;

    
    
    
    
    if( flag_initialize ){
        r_starting_device_input             = 0.0 ;
        r_gearbox_input                     = 0.0 ;
        r_gearbox_output                    = 0.0 ;
        r_synchoro_dif[10]                  = 0.0 ;
        temp_trans_fluid                    = 0.0 ;
        temp_engine_water                   = 0.0 ;
        v_vehicle                           = 0.0 ;
        tq_brake                            = 0.0 ;
        accel_position                      = 0.0 ;
        shifter_position                    = 0   ;
        r_engine                            = 0.0 ;
        r_engine_idle                       = 0.0 ;
        tq_engine_target                    = 0.0 ;
        tq_engine                           = 0.0 ;
        tq_engine_min_pos                   = 0.0 ;
        tq_engine_max_pos                   = 0.0 ;
        tq_p2m_req                          = 0.0 ;
        flag_k0cl_open_req                  = 0   ;
        r_p2m                               = 0.0 ;
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i]                = 0.0 ;
        }
        gear_ratio_old                      = 0.0 ;
        flag_shift_old                      = 0   ;
        flag_shift_end_speed_old            = 0   ;
        flag_ap_load_shift_old              = 0   ;
        flag_tq_load_shift_old              = 0   ;
        gear_shift_map_old                  = 0   ;
        gear_target_old                     = 0   ;
        gear_before_shift_old               = 0   ;
        gear_sub1_tmp_old                   = 0   ;
        gear_sub2_tmp_old                   = 0   ;
        t_shift_wait_old                    = 0.0 ;
        t_shift_period_old                  = 0.0 ;
        t_shift_interval_old                = 0.0 ;
        t_tq_phase_old                      = 0.0 ;
        t_shift_end_old                     = 0.0 ;
        t_neutral_old                       = 0.0 ;
        flag_cvt_step_shift_old             = 0   ;
        flag_cvt_step_shift_ap_old          = 0   ;

        
        flag_engine_idle_control            = 0  ;

        
        tq_cl_creep_cont                    = 0.0 ;

        
        tq_torq_converter_input             = 0.0 ;
        tq_torq_converter_output            = 0.0 ;
        spd_ratio_torq_converter            = 0.0 ;
        torq_ratio_torq_converter           = 0.0 ;
        cap_factor_torq_converter           = 0.0 ;

        
        tq_cl_slip_control                  = 0.0 ;
        r_cl_slip_target                    = 0.0 ;
        r_cl_slip_act                       = 0.0 ;
        r_starting_device_target            = 0.0 ;
        tq_torq_converter_slip_tg           = 0.0 ;
        tq_cl_slip_base                     = 0.0 ;
        tq_cl_slip_correct                  = 0.0 ;
        tq_flyweel_output                   = 0.0 ;

        
        tq_gearbox_input                    = 0.0 ;

        
        flag_load_shift                     = 0   ;
        flag_ap_load_shift                  = 0   ;
        flag_tq_load_shift                  = 0   ;

        
        flag_cvt_step_shift                 = 0   ;
        flag_cvt_step_shift_ap              = 0   ;

        
        virtual_gear_cvt_map                = 0.0 ;

        
        gear_shift_map                      = 0   ;

        
        flag_shift_end_judge                = 0   ;
        flag_shift_end_speed                = 0   ;
        t_shift_end                         = 0.0 ;

        
        gear_target                         = 0   ;
        gear_before_shift                   = 0    ;
        virtual_gear_target                 = 0.0 ;
        virtual_gear_before_shift           = 0.0 ;
        t_shift_wait                        = 0.0 ;
        t_shift_period                      = 0.0 ;
        t_shift_interval_old                = 0.0 ;
        flag_shift                          = 0   ;
        r_gb_input_tg_gear                  = 0.0 ;

        
        gear_shift_kind                     = 0   ;

        
        gear_ratio                          = 0   ;
        gear_ratio_before_shift             = 0   ;
        gear_ratio_after_shift              = 0   ;
        r_gb_input_tg_gear                  = 0   ;

        
        gear_sub                            = 0   ;
        gear_sub1                           = 0   ;
        gear_sub2                           = 0   ;
        t_neutral                           = 0.0 ;
        gear_sub1_tmp                       = 0   ;
        gear_sub2_tmp                       = 0   ;

        
        flag_synchro_ready                  = 0   ;

        
        gear_cl_com                         = 0   ;

        
        n_engage_clutch                     = 0   ;
        n_release_clutch                    = 0   ;

        
        tq_inertia_engage_cl                = 0.0 ;
        tq_inertia_release_cl               = 0.0 ;
        tq_shift_up_reduction_req           = 0.0 ;
        tq_shift_up_reduction               = 0.0 ;
        tq_eng_shift_up_reduction           = 0.0 ;
        tq_p2m_shift_up_reduction           = 0.0 ;
        t_shift_time_tg                     = 0.0 ;
        r_delta_speed                       = 0.0 ;
        tq_inertia                          = 0.0 ;

        
        rate_torque_phase                   = 0.0 ;
        t_tq_phase                          = 0.0 ;

        
        for( i=0; i<_MaxCL ; i++){
            tq_clutch_cap_inp [i]           = 0.0 ;
        }
        tq_engage_cl_cap                    = 0.0 ;
        tq_release_cl_cap                   = 0.0 ;

        
        for( i=0; i<_MaxCL ; i++){
            tq_clutch_cap     [i]           = 0.0 ;
            rate_clutch_share [i]           = 0.0 ;
        }
        
        for( i=0; i<_MaxSyn ; i++){
            f_synchro         [i]           = 0.0 ;
            flag_synchro_com  [i]           = 0   ;
        }

        
        viscosity_trans_fluid               = 0.0 ;
        density_trans_fluid                 = 0.0 ;

        
        p_line                              = 0.0 ;

        
        p_pulley_primary                    = 0.0 ;
        p_pulley_secoundary                 = 0.0 ;

        
        i_actuator                          = 0.0 ;

        
        i_eop                               = 0.0 ;

        
        q_cooler_trans_fluid                = 0.0 ;
        q_cooler_engine_water               = 0.0 ;

        
        flag_shift_up_tq_request            = 0   ;

        
        tq_engine_max_req                   = 0.0 ;
        tq_engine_min_req                   = 0.0 ;
        r_engine_target                     = 0.0 ;

        
        tq_trans_input                      = 0.0 ;
        tq_gain_drivetrain                  = 0.0 ;
        flag_lockup                         = 0   ;

        
        tq_k0_clutch_cap                    = 0.0 ;
        status_k0_clutch                    = 0   ;

        
        tq_p2m_target                       = 0.0 ;

        
        tq_starting_device_input            = 0.0 ;
    }

    
    
    
    
    
    if( flag_initialize ){
        r_starting_device_input             = 0.0 ;
        r_gearbox_input                     = 0.0 ;
        r_gearbox_output                    = 0.0 ;
        r_synchoro_dif[10]                  = 0.0 ;
        temp_trans_fluid                    = 0.0 ;
        temp_engine_water                   = 0.0 ;
        v_vehicle                           = 0.0 ;
        tq_brake                            = 0.0 ;
        accel_position                      = 0.0 ;
        shifter_position                    = 0   ;
        r_engine                            = 0.0 ;
        r_engine_idle                       = 0.0 ;
        tq_engine_target                    = 0.0 ;
        tq_engine                           = 0.0 ;
        tq_engine_min_pos                   = 0.0 ;
        tq_engine_max_pos                   = 0.0 ;
        tq_p2m_req                          = 0.0 ;
        flag_k0cl_open_req                  = 0   ;
        r_p2m                               = 0.0 ;
    }
    else {
        r_starting_device_input = w_starting_device_input_radps * 60.0f / ( 2.0 * _PI ) ; 
        r_gearbox_input     = w_gearbox_input_radps  * 60.0f / ( 2.0 * _PI )            ; 
        r_gearbox_output    = w_gearbox_output_radps * 60.0f / ( 2.0 * _PI )            ; 
        for( i=0; i<_MaxSyn ; i++){
            r_synchoro_dif [i] = w_synchoro_dif_radps[i] * 60.0f / ( 2.0f * _PI )       ; 
        }
        temp_trans_fluid    = t_trans_fluid_k  - 273.15f                                ; 
        temp_engine_water   = t_engine_water_k - 273.15f                                ; 
        v_vehicle           = v_vehicle_mps * 3600.0f / 1000.0f                         ; 
        tq_brake            = tau_brake                                                 ; 
        accel_position      = accel_position_per                                        ; 
        shifter_position    = trans_shifter_position                                    ; 
        r_engine            = w_engine_radps        * 60.0f / ( 2.0 * _PI )             ; 
        r_engine_idle       = w_engine_idle_radps   * 60.0f / ( 2.0 * _PI )             ; 
        tq_engine_target    = tau_engine_target                                         ; 
        tq_engine           = tau_engine                                                ; 
        tq_engine_min_pos   = F_max( CONST_TQ_ENG_MIN_POS_L , F_min(CONST_TQ_ENG_MIN_POS_H, tau_engine_min_pos )) ; 
        tq_engine_max_pos   = F_max( CONST_TQ_ENG_MAX_POS_L , F_min(CONST_TQ_ENG_MAX_POS_H, tau_engine_max_pos )) ; 
        tq_p2m_req          = tau_p2m_req                                               ; 
        flag_k0cl_open_req = flag_k0_clutch_open                                        ; 
        
        r_p2m = r_starting_device_input;    
    }
    
    
    
    
    
     TCU_Disconnect_Clutch_Control(
        
        &tq_k0_clutch_cap,      
        &status_k0_clutch,      
        
        flag_k0cl_open_req, 
        r_engine,               
        r_starting_device_input,
        tq_engine_target,       
        flag_initialize
     );

    
    TCU_Torque_Input_Starting_Device(
        
        &tq_starting_device_input,      
        
        tq_engine_target,
        tq_p2m_target
    );

    
    
    
    
    

    
    TCU_Engin_Idle_Control (
        
        &flag_engine_idle_control,      
        
        flag_initialize,
        r_engine_idle,
        accel_position,
        v_vehicle,
        gear_target,
        r_gb_input_tg_gear
    );

    
    TCU_Creep_Control (
        
        &tq_cl_creep_cont,              
        
        flag_initialize,
        gear_target
    );

    
    TCU_Fluid_Coupling_Torque (
        
        &tq_torq_converter_input,       
        &tq_torq_converter_output,      
        &spd_ratio_torq_converter,      
        &torq_ratio_torq_converter,     
        &cap_factor_torq_converter,     
        
        r_starting_device_input,
        r_gearbox_input
    );

    
    TCU_Slip_Control (
        &tq_cl_slip_control,        
        &r_cl_slip_target,          
        &r_cl_slip_act,             
        &r_starting_device_target,  
        &tq_torq_converter_slip_tg, 
        &tq_cl_slip_base,
        &tq_cl_slip_correct,
        &tq_flyweel_output,
        
        flag_initialize,
        flag_shift,
        r_starting_device_input,
        r_gb_input_tg_gear,
        tq_starting_device_input,
        r_engine_idle,
        gear_ratio_after_shift,
        gear_target,
        gear_target_old,
        flag_engine_idle_control,   
        flag_k0cl_open_req
    );

    
    TCU_Torque_Input_GearBox(
        
        &tq_gearbox_input,              
        
        tq_starting_device_input,
        torq_ratio_torq_converter
    );

    
    
    
    
    
    
    if( flag_initialize ){
        flag_ap_load_shift_old  =  FALSE ;
        flag_tq_load_shift_old  =  FALSE ;
    }
    else{
        flag_ap_load_shift_old  =   flag_ap_load_shift  ;
        flag_tq_load_shift_old  =   flag_tq_load_shift  ;
    }
    TCU_Load_shift(
        
        &flag_load_shift,       
        &flag_ap_load_shift,    
        &flag_tq_load_shift,    
        
        flag_ap_load_shift_old,
        flag_tq_load_shift_old,
        accel_position,
        tq_starting_device_input
    );

    
    if( flag_initialize ){
        flag_cvt_step_shift_old    = FALSE ;
        flag_cvt_step_shift_ap_old = FALSE ;
    }
    else {
        flag_cvt_step_shift_old    = flag_cvt_step_shift    ;
        flag_cvt_step_shift_ap_old = flag_cvt_step_shift_ap ;
    }
    TCU_CVT_Step_Shift (
        
        &flag_cvt_step_shift   , 
        &flag_cvt_step_shift_ap, 
        
        accel_position,
        flag_cvt_step_shift_old,
        flag_cvt_step_shift_ap_old,
        flag_shift
    );

    
    TCU_Continuously_shift_schedule(
        
        &virtual_gear_cvt_map,      
        
        shifter_position,
        accel_position,
        v_vehicle
    );      

    
    if( flag_initialize ){
        gear_shift_map_old = FALSE ;
    }
    else {
        gear_shift_map_old = gear_shift_map;
    }
    TCU_Shift_Schedule(
        
        &gear_shift_map,        
        
        gear_shift_map_old,
        shifter_position,
        accel_position,
        v_vehicle,
        flag_cvt_step_shift,
        flag_k0cl_open_req
    );

    if( flag_initialize ){
        flag_shift_end_speed_old = FALSE ;
        t_shift_end_old          = FALSE ;
    }
    else {
        flag_shift_end_speed_old = flag_shift_end_speed ;
        t_shift_end_old          = t_shift_end ;
    }
    
    TCU_Shift_End_Jugdement (
        
        &flag_shift_end_judge,  
        &flag_shift_end_speed,  
        &t_shift_end,           
        
        flag_shift_end_speed_old,
        t_shift_end_old,
        r_gearbox_input,
        r_gb_input_tg_gear,
        rate_torque_phase,
        gear_shift_kind,
        t_shift_period
    );

    
    if( flag_initialize ){
        gear_target_old         = FALSE ;
        gear_before_shift_old   = FALSE ;
        t_shift_wait_old        = FALSE ;
        t_shift_period_old      = FALSE ;
        t_shift_interval_old    = FALSE ;
        flag_shift_old          = FALSE ;
    }
    else{
        gear_target_old         = gear_target           ;
        gear_before_shift_old   = gear_before_shift     ;
        t_shift_wait_old        = t_shift_wait          ;
        t_shift_period_old      = t_shift_period        ;
        t_shift_interval_old    = t_shift_interval      ;
        flag_shift_old          = flag_shift            ;
    }
    TCU_Gear_Target(
        
        &gear_target,               
        &gear_before_shift,         
        &virtual_gear_target,       
        &virtual_gear_before_shift, 
        &t_shift_wait,              
        &t_shift_period,            
        &t_shift_interval,          
        &flag_shift,                
        
        flag_initialize,
        gear_before_shift_old,
        t_shift_wait_old,
        t_shift_period_old,
        t_shift_interval_old,
        flag_shift_old,
        gear_shift_map,
        gear_shift_map_old,
        flag_load_shift,
        shifter_position,
        flag_shift_end_judge,
        flag_cvt_step_shift,
        flag_cvt_step_shift_old,
        virtual_gear_cvt_map
    );

    
    TCU_Gear_Shift_Type (
        
        &gear_shift_kind,       
                                
                                
                                
                                
                                
        
        flag_load_shift,
        flag_shift,
        gear_target,
        gear_before_shift
    );

    
    if( flag_initialize ){
        gear_ratio_old = FALSE ;
    }
    else {
        gear_ratio_old = gear_ratio;
    }
    TCU_Target_Gear_Ratio (
        
        &gear_ratio         ,       
        &gear_ratio_before_shift,   
        &gear_ratio_after_shift,    
        &r_gb_input_tg_gear,        
        
        gear_ratio_old,
        gear_target,
        gear_before_shift,
        virtual_gear_cvt_map
    );

    
    if( flag_initialize ){
        gear_sub2_tmp_old = FALSE ;
        gear_sub1_tmp_old = FALSE ;
        t_neutral_old = FALSE;
    }
    else {
        gear_sub2_tmp_old = gear_sub2_tmp;
        gear_sub1_tmp_old = gear_sub1_tmp;
        t_neutral_old = t_neutral;
    }
    TCU_Sub_Gear(
        
        &gear_sub,          
        &gear_sub1,         
        &gear_sub2,         
        &t_neutral,         
        &gear_sub1_tmp,
        &gear_sub2_tmp,
        
        gear_sub1_tmp_old,
        gear_sub2_tmp_old,
        t_neutral_old,
        accel_position,
        v_vehicle,
        gear_target,
        gear_target_old,
        gear_before_shift,
        shifter_position,
        flag_shift
    );

    
    
    
    
    

    
    TCU_SYNCHORO_STATUS (
        
        &flag_synchro_ready,    
        
        gear_target,
        f_synchro,
        r_synchoro_dif
    );

    
    TCU_Gear_Clutch_Control(
        
        &gear_cl_com,           
        
        flag_initialize,
        flag_synchro_ready,
        gear_target,
        gear_before_shift,
        gear_shift_kind,
        r_gearbox_input,
        r_gb_input_tg_gear
    );

    
    TCU_Shift_Clutch (
        
        &n_engage_clutch,       
        &n_release_clutch,      
        
        gear_target,
        gear_before_shift
    );

    

    TCU_Shift_Inertia_Torq (
        
        &tq_inertia_engage_cl,      
        &tq_inertia_release_cl,     
        &tq_shift_up_reduction_req, 
        &tq_shift_up_reduction,     
        &tq_eng_shift_up_reduction, 
        &tq_p2m_shift_up_reduction, 
        &t_shift_time_tg,           
        &r_delta_speed,             
        &tq_inertia,                
        
        flag_initialize,
        gear_shift_kind,
        gear_target,
        gear_target_old,
        gear_before_shift,
        r_p2m,
        r_gearbox_input,
        r_gb_input_tg_gear,
        tq_engine_target,
        tq_engine_min_pos,
        flag_k0cl_open_req,
        tq_p2m_req
    );
    if( flag_initialize ){
        t_tq_phase_old = FALSE ;
    }
    else {
        t_tq_phase_old = t_tq_phase;
    }
    
    TCU_Torque_Phase (
        &rate_torque_phase,         
        &t_tq_phase,                
        t_tq_phase_old,
        flag_shift,
        gear_shift_kind,
        gear_cl_com,
        gear_target
    );

    
    TCU_Clutch_Control (
        
        tq_clutch_cap_inp,          
        &tq_engage_cl_cap,          
        &tq_release_cl_cap,         
        
        tq_gearbox_input,
        tq_cl_slip_control,
        tq_inertia_engage_cl,
        tq_inertia_release_cl,
        rate_torque_phase,
        flag_shift,
        n_engage_clutch,
        n_release_clutch,
        gear_cl_com,
        gear_target,
        flag_engine_idle_control,
        tq_cl_creep_cont
    );

    
    TCU_Clutch_Torque_Capacity (
        
        tq_clutch_cap,          
        rate_clutch_share,      
        
        gear_target,
        gear_before_shift,
        tq_clutch_cap_inp
    );

    
    if( flag_initialize ){
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i] = 0.0 ;
        }
    }
    else {
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i] = f_synchro[i] ;
        }
    }
    TCU_SYNCHORO_CONTROL (
        
        f_synchro,              
        flag_synchro_com,       
        
        f_synchro_old,
        gear_target,
        gear_before_shift,
        gear_sub1,
        gear_sub2
    );

    
    
    
    
    
    
    TCU_Trans_Fluid_Characteristic (
        
        &viscosity_trans_fluid,             
        &density_trans_fluid,               
        
        temp_trans_fluid
    );

    
    TCU_Pressure_CVT_Pulley (
        
        &p_pulley_primary,
        &p_pulley_secoundary,
        
        tq_gearbox_input,
        r_gearbox_input,
        r_gearbox_output,
        gear_ratio,
        gear_ratio_after_shift,
        viscosity_trans_fluid,
        density_trans_fluid
    );

    
    TCU_Pressure_Line_Control (
        
        &p_line,                
        
        tq_gearbox_input,
        gear_target,
        p_pulley_primary,
        p_pulley_secoundary

    );

    
    TCU_Acutuator_Control (
        
        &i_actuator,            
        
        gear_target
    );

    
    TCU_EOP_Control (
        
        &i_eop,                 
        
        r_engine,
        temp_trans_fluid
    );

    
    TCU_Cooler_Flow_Rate_Control (
        
        &q_cooler_trans_fluid,  
        &q_cooler_engine_water, 
        
        temp_trans_fluid
    );

    
    
    
    
    

    
    TCU_Up_Shift_Torque_Reduction (
        
        &flag_shift_up_tq_request,      
        
        tq_eng_shift_up_reduction,
        gear_shift_kind,
        gear_target,
        gear_before_shift,
        flag_shift,
        rate_torque_phase,
        r_gb_input_tg_gear,
        r_gearbox_input,
        tq_engine_min_pos,
        tq_inertia_engage_cl
    );

    
     TCU_Engine_Torque_Request (
        
        &tq_engine_max_req,             
        &tq_engine_min_req,             
        &r_engine_target,               
        
        tq_engine_target,
        tq_eng_shift_up_reduction,
        flag_shift_up_tq_request,
        flag_k0cl_open_req
    );

    
    TCU_Information_For_ECU (
        
        &tq_trans_input             ,   
        &tq_gain_drivetrain         ,   
        &flag_lockup                ,   
        
        gear_target,
        flag_engine_idle_control,
        tq_torq_converter_input,
        tq_cl_creep_cont,
        tq_cl_slip_base,
        gear_ratio,
        torq_ratio_torq_converter
    );

    
    
    
    
    
    TCU_P2_Motor_Control(
        
        &tq_p2m_target,         
        
        status_k0_clutch,
        flag_shift_up_tq_request,
        tq_starting_device_input,
        tq_p2m_req,
        r_engine,
        tq_p2m_shift_up_reduction
    );

    
    
    
    
    
    *trans_gear                 = virtual_gear_target                       ; 
    *trans_gear_ratio           = gear_ratio                                ; 
    for( i=0; i<_MaxCL ; i++){
        tau_clutch_cap[i] = tq_clutch_cap[i]                                ; 
    }
    for( i=0; i<_MaxSyn ; i++){
        f_synchro_n[i] = f_synchro[i]                                       ; 
    }
    *tau_k0_clutch_cap          = tq_k0_clutch_cap                          ; 
    *tau_p2m_target             = tq_p2m_target                             ; 
    *p_line_pa                  = p_line                * 1000.0f           ; 
    *p_pulley_pri_pa            = p_pulley_primary      * 1000.0f           ; 
    *p_pulley_sec_pa            = p_pulley_secoundary   * 1000.0f           ; 
    *i_actuator_ampere          = i_actuator                                ; 
    *i_eop_ampere               = i_eop                                     ; 
    *qv_cooler_trans_fluid_m3ps = q_cooler_trans_fluid  / 1000.0f / 60.0f   ; 
    *qv_cooler_eng_water_m3ps   = q_cooler_engine_water / 1000.0f / 60.0f   ; 
    *torque_gain_drivetrain     = tq_gain_drivetrain                        ; 
    *flag_trans_shift           = flag_shift                                ; 
    *tau_engine_max_req         = tq_engine_max_req                         ; 
    *tau_engine_min_req         = tq_engine_min_req                         ; 
    *w_engine_target_radps      = r_engine_target / 60.0f * ( 2 * _PI )     ; 
    *tau_trans_input            = tq_trans_input                            ; 
    *flag_trans_lockup          = flag_lockup                               ; 

}










void    TCU_Engin_Idle_Control (
        
        schar   *flag_engine_idle_control,  
        
        schar    flag_initialize,
        float   r_engine_idle,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        float   r_gb_input_tg_gear
    ){
    
    
    
    if ( flag_initialize ){
        *flag_engine_idle_control = FALSE ;
    }
    else if( gear_target == 0
        || ( r_gb_input_tg_gear < r_engine_idle || r_gb_input_tg_gear < MAT_R_SLIP_CONT_MIN[gear_target] || v_vehicle < CONST_V_IDLE_SPEED_CONT )
        && accel_position < CONST_AP_IDLE_SPEED_CONT )
    {
        *flag_engine_idle_control = TRUE ;
    }
    else {
        *flag_engine_idle_control = FALSE;
    }
}


void    TCU_Creep_Control (
        
        float   *tq_cl_creep_cont,  
        
        schar    flag_initialize,
        sshort  gear_target
    ){
    
    
    
    if( flag_initialize ){
        *tq_cl_creep_cont = 0.0f;
    }
    else if( gear_target==0 ){
        *tq_cl_creep_cont = 0.0f;
    }
    else{
        *tq_cl_creep_cont = CONST_TQ_CREEP_CONT;
    }
}


void    TCU_Fluid_Coupling_Torque (
        
        float   *tq_torq_converter_input,       
        float   *tq_torq_converter_output,      
        float   *spd_ratio_torq_converter,      
        float   *torq_ratio_torq_converter,     
        float   *cap_factor_torq_converter,     
        
        float   r_starting_device_input,
        float   r_gearbox_input
    ){
    
    
    
    
    if( r_engine <= 100.0f){
        *spd_ratio_torq_converter= 0.0f;
    }
    else{
        *spd_ratio_torq_converter = r_gearbox_input / r_engine;
    }
    
    *cap_factor_torq_converter =
             Table_search_2D(T2D_COUPLING_CAP_FACT_Y, T2D_COUPLING_CAP_FACT_X, *spd_ratio_torq_converter, 15);
    
    *torq_ratio_torq_converter =
             Table_search_2D(T2D_COUPLING_TQ_RATIO_Y, T2D_COUPLING_TQ_RATIO_X, *spd_ratio_torq_converter, 15);

    *tq_torq_converter_input
        = (*cap_factor_torq_converter) * r_starting_device_input * r_starting_device_input / 1000000.0f;
    *tq_torq_converter_output
        = (*tq_torq_converter_input) * (*torq_ratio_torq_converter);
}


void    TCU_Slip_Control (
        
        float   *tq_cl_slip_control,        
        float   *r_cl_slip_target,          
        float   *r_cl_slip_act,             
        float   *r_starting_device_target,  
        float   *tq_torq_converter_slip_tg, 
        float   *tq_cl_slip_base,
        float   *tq_cl_slip_correct,
        float   *tq_flyweel_output,
        
        schar    flag_initialize,
        schar   flag_shift,
        float   r_starting_device_input,
        float   r_gb_input_tg_gear,
        float   tq_starting_device_input,
        float   r_engine_idle,
        float   gear_ratio_after_shift,
        sshort  gear_target,
        sshort  gear_target_old,
        schar   flag_engine_idle_control,   
        schar   flag_k0cl_open_req
    ){
    
    
    

    
    

    float r_cl_slip_target_map;
    float r_cl_slip_target_temp;
    float spd_ratio_torq_converter_tg;
    float cap_factor_torq_converter_tg;
    float dw_flyweel            ;
    float total_gear_ratio      ;   
    float inertia_shift         ;

    
    if( flag_initialize ){
        *r_cl_slip_target = 0.0 ;
    }
    else if( flag_k0cl_open_req == FALSE ){  
        if( gear_target == 1 || gear_target == _GrRev){ 
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G1 ,
                              Table_search_2D(T2DX_R_SLIP_G1_Y, T2DX_R_SLIP_G1_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G1_Y, T2DY_R_SLIP_G1_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 2){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G2 ,
                              Table_search_2D(T2DX_R_SLIP_G2_Y, T2DX_R_SLIP_G2_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G2_Y, T2DY_R_SLIP_G2_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 3){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G3 ,
                              Table_search_2D(T2DX_R_SLIP_G3_Y, T2DX_R_SLIP_G3_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G3_Y, T2DY_R_SLIP_G3_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 4){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G4 ,
                              Table_search_2D(T2DX_R_SLIP_G4_Y, T2DX_R_SLIP_G4_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G4_Y, T2DY_R_SLIP_G4_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 5){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G5 ,
                              Table_search_2D(T2DX_R_SLIP_G5_Y, T2DX_R_SLIP_G5_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G5_Y, T2DY_R_SLIP_G5_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 6){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G6 ,
                              Table_search_2D(T2DX_R_SLIP_G6_Y, T2DX_R_SLIP_G6_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G6_Y, T2DY_R_SLIP_G6_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 7){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G7 ,
                              Table_search_2D(T2DX_R_SLIP_G7_Y, T2DX_R_SLIP_G7_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G7_Y, T2DY_R_SLIP_G7_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 8){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G8 ,
                              Table_search_2D(T2DX_R_SLIP_G8_Y, T2DX_R_SLIP_G8_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G8_Y, T2DY_R_SLIP_G8_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 9){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G9 ,
                              Table_search_2D(T2DX_R_SLIP_G9_Y, T2DX_R_SLIP_G9_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G9_Y, T2DY_R_SLIP_G9_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else {
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G10 ,
                              Table_search_2D(T2DX_R_SLIP_G10_Y, T2DX_R_SLIP_G10_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G10_Y, T2DY_R_SLIP_G10_X, tq_starting_device_input  , 9), 9 ) ;
        }
        
        if( tq_starting_device_input>0 ){ r_cl_slip_target_temp = F_max(r_cl_slip_target_map, 0.0) ;}
        else                            { r_cl_slip_target_temp = F_min(r_cl_slip_target_map, 0.0) ;}

        
        *r_cl_slip_target = F_max( r_engine_idle - r_gb_input_tg_gear, r_cl_slip_target_temp);
    }
    else {  
        *r_cl_slip_target = 0.0 ;
    }
    
    if( flag_initialize ){
        *r_starting_device_target = 0.0;
    }
    else {
        *r_starting_device_target = r_gb_input_tg_gear + (*r_cl_slip_target);
    }
    
    
    
    if( (*r_starting_device_target) <= 100.0f){
        spd_ratio_torq_converter_tg= 0.0f;
    }
    else{
        spd_ratio_torq_converter_tg = r_gb_input_tg_gear / (*r_starting_device_target);
    }
    
    cap_factor_torq_converter_tg =
         Table_search_2D(T2D_COUPLING_CAP_FACT_Y, T2D_COUPLING_CAP_FACT_X, spd_ratio_torq_converter_tg, 15);
    
    if( flag_initialize ){
        *tq_torq_converter_slip_tg = 0.0 ;
    }
    else if( flag_shift || gear_target != gear_target_old ){;} 
    else {
        *tq_torq_converter_slip_tg
            = cap_factor_torq_converter_tg
                 * (*r_starting_device_target) * (*r_starting_device_target) / 1000000.0f;
    }

    
    if( flag_k0cl_open_req ){
        inertia_shift = CONST_INERTIA_P2M;
    }
    else {
        inertia_shift = CONST_INERTIA_P2M + CONST_INERTIA_CLANK;
    }
    total_gear_ratio = CONST_FGR * gear_ratio_after_shift;
    if( total_gear_ratio == 0 ){
        dw_flyweel = 0.0f ;
    }
    else {
        dw_flyweel =  tq_starting_device_input / 
            ( inertia_shift + CONST_CAR_WEIGHT * CONST_R_TIRE * CONST_R_TIRE /(total_gear_ratio * total_gear_ratio ) );
    }
    *tq_flyweel_output = tq_starting_device_input - inertia_shift * dw_flyweel;

    if( (*tq_flyweel_output) >= 0 ){
        *tq_cl_slip_base = F_max( (*tq_flyweel_output) - (*tq_torq_converter_slip_tg), 0.0f );
    }
    else{
        *tq_cl_slip_base = - F_min( (*tq_flyweel_output) - (*tq_torq_converter_slip_tg), 0.0f );
    }
    
    
    
    if( flag_initialize ){
        *r_cl_slip_act = 0.0 ;
    }
    else {
        *r_cl_slip_act = r_starting_device_input - r_gb_input_tg_gear;
    }
    
    if( flag_initialize ){
        *tq_cl_slip_correct = 0.0f;
    }
    else if( flag_engine_idle_control == TRUE ){
        *tq_cl_slip_correct = 0.0f;
    }
    else if( flag_shift || gear_target != gear_target_old ){;} 
    else{
        if( *r_cl_slip_act >0 ){
            *tq_cl_slip_correct
            = Table_search_2D(T2D_TQ_CL_SLIP_GAIN_Y, T2D_TQ_CL_SLIP_GAIN_X, *r_cl_slip_act - *r_cl_slip_target, 5);
        }
        else {
            *tq_cl_slip_correct
            = - Table_search_2D(T2D_TQ_CL_SLIP_GAIN_Y, T2D_TQ_CL_SLIP_GAIN_X, *r_cl_slip_act - *r_cl_slip_target, 5);
        }
    }

    
    
    if( F_abs(*r_cl_slip_act) < CONST_R_FULL_LOCKUP && F_abs(*r_cl_slip_target) <= CONST_R_FULL_LOCKUP ){
        *tq_cl_slip_control = F_max( (*tq_cl_slip_base) + (*tq_cl_slip_correct), 0.0f) + CONST_TQ_ENGAGE_CL_MARGIN;
    }
    else {
        *tq_cl_slip_control = F_max( (*tq_cl_slip_base) + (*tq_cl_slip_correct), 0.0f) ;
    }
}


void    TCU_Torque_Input_GearBox(
        
        float   *tq_gearbox_input,          
        
        float   tq_starting_device_input,       
        float   torq_ratio_torq_converter       
){
    
    
    
    *tq_gearbox_input = tq_starting_device_input * torq_ratio_torq_converter;
}


void     TCU_Load_shift(
        
        schar   *flag_load_shift,       
        schar   *flag_ap_load_shift,    
        schar   *flag_tq_load_shift,    
        
        schar   flag_ap_load_shift_old,
        schar   flag_tq_load_shift_old,
        float   accel_position,
        float   tq_starting_device_input
){
    
    
    
    Switch_with_hys( flag_ap_load_shift, flag_ap_load_shift_old, accel_position ,   CONST_AP_LOAD_SFT, CONST_AP_LOAD_SFT_HYS);
    Switch_with_hys( flag_tq_load_shift, flag_tq_load_shift_old, tq_starting_device_input , CONST_TQ_LOAD_SFT, CONST_TQ_LOAD_SFT_HYS);
    if( (*flag_ap_load_shift) == TRUE || (*flag_tq_load_shift) == TRUE ){
        *flag_load_shift = TRUE;
    }
    else{
        *flag_load_shift = FALSE;
    }
}


void     TCU_CVT_Step_Shift (
        
        schar   *flag_cvt_step_shift,    
        schar   *flag_cvt_step_shift_ap, 
        
        float   accel_position,
        schar   flag_cvt_step_shift_old,
        schar   flag_cvt_step_shift_ap_old,
        schar   flag_shift
){
    
    
    
    Switch_with_hys( flag_cvt_step_shift_ap, flag_cvt_step_shift_ap_old, accel_position , CONST_AP_CVT_STEP_SHIFT, CONST_AP_CVT_STEP_SHIFT_HYS );
    if( flag_cvt_step_shift_old == TRUE ){
        if ( (*flag_cvt_step_shift_ap) == FALSE && flag_shift == FALSE ){ 
            *flag_cvt_step_shift = FALSE ;
        }
        else {
            *flag_cvt_step_shift = TRUE ;
        }
    }
    else {
        if ( (*flag_cvt_step_shift_ap) == TRUE ){
            *flag_cvt_step_shift = TRUE ;
        }
        else {
            *flag_cvt_step_shift = FALSE ;
        }
    }
}


void     TCU_Continuously_shift_schedule (
        
        float   *virtual_gear_cvt_map,  
        
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle
){
    
    
    
    float v_shift_A;
    float v_shift_9;
    float v_shift_8;
    float v_shift_7;
    float v_shift_6;
    float v_shift_5;
    float v_shift_4;
    float v_shift_3;
    float v_shift_2;
    float v_shift_1;
    float v_shift_lo ;
    float v_shift_hi ;
    sshort tmp_gear_cvt_map;
    
    v_shift_A = Table_search_2D(T2D_V_SFT_A_Y, T2D_V_SFT_A_X, accel_position, 10);
    v_shift_9 = Table_search_2D(T2D_V_SFT_9_Y, T2D_V_SFT_9_X, accel_position, 10);
    v_shift_8 = Table_search_2D(T2D_V_SFT_8_Y, T2D_V_SFT_8_X, accel_position, 10);
    v_shift_7 = Table_search_2D(T2D_V_SFT_7_Y, T2D_V_SFT_7_X, accel_position, 10);
    v_shift_6 = Table_search_2D(T2D_V_SFT_6_Y, T2D_V_SFT_6_X, accel_position, 10);
    v_shift_5 = Table_search_2D(T2D_V_SFT_5_Y, T2D_V_SFT_5_X, accel_position, 10);
    v_shift_4 = Table_search_2D(T2D_V_SFT_4_Y, T2D_V_SFT_4_X, accel_position, 10);
    v_shift_3 = Table_search_2D(T2D_V_SFT_3_Y, T2D_V_SFT_3_X, accel_position, 10);
    v_shift_2 = Table_search_2D(T2D_V_SFT_2_Y, T2D_V_SFT_2_X, accel_position, 10);
    v_shift_1 = Table_search_2D(T2D_V_SFT_1_Y, T2D_V_SFT_1_X, accel_position, 10);
    
    if     ( v_vehicle >= v_shift_A ){ v_shift_lo = v_shift_A ; v_shift_hi = v_shift_A ;  tmp_gear_cvt_map = 10 ;}
    else if( v_vehicle >= v_shift_9 ){ v_shift_lo = v_shift_9 ; v_shift_hi = v_shift_A ;  tmp_gear_cvt_map =  9 ;}
    else if( v_vehicle >= v_shift_8 ){ v_shift_lo = v_shift_8 ; v_shift_hi = v_shift_9 ;  tmp_gear_cvt_map =  8 ;}
    else if( v_vehicle >= v_shift_7 ){ v_shift_lo = v_shift_7 ; v_shift_hi = v_shift_8 ;  tmp_gear_cvt_map =  7 ;}
    else if( v_vehicle >= v_shift_6 ){ v_shift_lo = v_shift_6 ; v_shift_hi = v_shift_7 ;  tmp_gear_cvt_map =  6 ;}
    else if( v_vehicle >= v_shift_5 ){ v_shift_lo = v_shift_5 ; v_shift_hi = v_shift_6 ;  tmp_gear_cvt_map =  5 ;}
    else if( v_vehicle >= v_shift_4 ){ v_shift_lo = v_shift_4 ; v_shift_hi = v_shift_5 ;  tmp_gear_cvt_map =  4 ;}
    else if( v_vehicle >= v_shift_3 ){ v_shift_lo = v_shift_3 ; v_shift_hi = v_shift_4 ;  tmp_gear_cvt_map =  3 ;}
    else if( v_vehicle >= v_shift_2 ){ v_shift_lo = v_shift_2 ; v_shift_hi = v_shift_3 ;  tmp_gear_cvt_map =  2 ;}
    else if( v_vehicle >= v_shift_1 ){ v_shift_lo = v_shift_1 ; v_shift_hi = v_shift_2 ;  tmp_gear_cvt_map =  1 ;}
    else                             { v_shift_lo = v_shift_1 ; v_shift_hi = v_shift_1 ;  tmp_gear_cvt_map =  1 ;}
    
    if      ( shifter_position == -1 ){
        *virtual_gear_cvt_map = _GrRev;
    }
    else {  
        if( v_shift_hi == v_shift_lo ){
            *virtual_gear_cvt_map = (float)tmp_gear_cvt_map;
        }
        else {
            *virtual_gear_cvt_map = (float)tmp_gear_cvt_map + ( v_vehicle - v_shift_lo ) / (v_shift_hi - v_shift_lo ); 
        }
    }
}


void     TCU_Shift_Schedule(
        
        sshort  *gear_shift_map,    
        
        sshort  gear_shift_map_old,
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle,
        schar   flag_cvt_step_shift,
        schar   flag_k0cl_open_req
){
    
    
    
    float v_shift_A9;
    float v_shift_98;
    float v_shift_87;
    float v_shift_76;
    float v_shift_65;
    float v_shift_54;
    float v_shift_43;
    float v_shift_32;
    float v_shift_21;
    float v_shift_9A;
    float v_shift_89;
    float v_shift_78;
    float v_shift_67;
    float v_shift_56;
    float v_shift_45;
    float v_shift_34;
    float v_shift_23;
    float v_shift_12;

    
    if( flag_k0cl_open_req ){ 
        v_shift_A9 = Table_search_2D(T2D_V_SFT_EV_A9_Y, T2D_V_SFT_EV_A9_X, accel_position, 10);
        v_shift_98 = Table_search_2D(T2D_V_SFT_EV_98_Y, T2D_V_SFT_EV_98_X, accel_position, 10);
        v_shift_87 = Table_search_2D(T2D_V_SFT_EV_87_Y, T2D_V_SFT_EV_87_X, accel_position, 10);
        v_shift_76 = Table_search_2D(T2D_V_SFT_EV_76_Y, T2D_V_SFT_EV_76_X, accel_position, 10);
        v_shift_65 = Table_search_2D(T2D_V_SFT_EV_65_Y, T2D_V_SFT_EV_65_X, accel_position, 10);
        v_shift_54 = Table_search_2D(T2D_V_SFT_EV_54_Y, T2D_V_SFT_EV_54_X, accel_position, 10);
        v_shift_43 = Table_search_2D(T2D_V_SFT_EV_43_Y, T2D_V_SFT_EV_43_X, accel_position, 10);
        v_shift_32 = Table_search_2D(T2D_V_SFT_EV_32_Y, T2D_V_SFT_EV_32_X, accel_position, 10);
        v_shift_21 = Table_search_2D(T2D_V_SFT_EV_21_Y, T2D_V_SFT_EV_21_X, accel_position, 10);
        
        v_shift_9A = Table_search_2D(T2D_V_SFT_EV_9A_Y, T2D_V_SFT_EV_9A_X, accel_position, 10);
        v_shift_89 = Table_search_2D(T2D_V_SFT_EV_89_Y, T2D_V_SFT_EV_89_X, accel_position, 10);
        v_shift_78 = Table_search_2D(T2D_V_SFT_EV_78_Y, T2D_V_SFT_EV_78_X, accel_position, 10);
        v_shift_67 = Table_search_2D(T2D_V_SFT_EV_67_Y, T2D_V_SFT_EV_67_X, accel_position, 10);
        v_shift_56 = Table_search_2D(T2D_V_SFT_EV_56_Y, T2D_V_SFT_EV_56_X, accel_position, 10);
        v_shift_45 = Table_search_2D(T2D_V_SFT_EV_45_Y, T2D_V_SFT_EV_45_X, accel_position, 10);
        v_shift_34 = Table_search_2D(T2D_V_SFT_EV_34_Y, T2D_V_SFT_EV_34_X, accel_position, 10);
        v_shift_23 = Table_search_2D(T2D_V_SFT_EV_23_Y, T2D_V_SFT_EV_23_X, accel_position, 10);
        v_shift_12 = Table_search_2D(T2D_V_SFT_EV_12_Y, T2D_V_SFT_EV_12_X, accel_position, 10);
    }
    else {  
        v_shift_A9 = Table_search_2D(T2D_V_SFT_A9_Y, T2D_V_SFT_A9_X, accel_position, 10);
        v_shift_98 = Table_search_2D(T2D_V_SFT_98_Y, T2D_V_SFT_98_X, accel_position, 10);
        v_shift_87 = Table_search_2D(T2D_V_SFT_87_Y, T2D_V_SFT_87_X, accel_position, 10);
        v_shift_76 = Table_search_2D(T2D_V_SFT_76_Y, T2D_V_SFT_76_X, accel_position, 10);
        v_shift_65 = Table_search_2D(T2D_V_SFT_65_Y, T2D_V_SFT_65_X, accel_position, 10);
        v_shift_54 = Table_search_2D(T2D_V_SFT_54_Y, T2D_V_SFT_54_X, accel_position, 10);
        v_shift_43 = Table_search_2D(T2D_V_SFT_43_Y, T2D_V_SFT_43_X, accel_position, 10);
        v_shift_32 = Table_search_2D(T2D_V_SFT_32_Y, T2D_V_SFT_32_X, accel_position, 10);
        v_shift_21 = Table_search_2D(T2D_V_SFT_21_Y, T2D_V_SFT_21_X, accel_position, 10);
        
        v_shift_9A = Table_search_2D(T2D_V_SFT_9A_Y, T2D_V_SFT_9A_X, accel_position, 10);
        v_shift_89 = Table_search_2D(T2D_V_SFT_89_Y, T2D_V_SFT_89_X, accel_position, 10);
        v_shift_78 = Table_search_2D(T2D_V_SFT_78_Y, T2D_V_SFT_78_X, accel_position, 10);
        v_shift_67 = Table_search_2D(T2D_V_SFT_67_Y, T2D_V_SFT_67_X, accel_position, 10);
        v_shift_56 = Table_search_2D(T2D_V_SFT_56_Y, T2D_V_SFT_56_X, accel_position, 10);
        v_shift_45 = Table_search_2D(T2D_V_SFT_45_Y, T2D_V_SFT_45_X, accel_position, 10);
        v_shift_34 = Table_search_2D(T2D_V_SFT_34_Y, T2D_V_SFT_34_X, accel_position, 10);
        v_shift_23 = Table_search_2D(T2D_V_SFT_23_Y, T2D_V_SFT_23_X, accel_position, 10);
        v_shift_12 = Table_search_2D(T2D_V_SFT_12_Y, T2D_V_SFT_12_X, accel_position, 10);
    }
    
    if      ( shifter_position == -1 ){
        *gear_shift_map = _GrRev;
    }
    else if ( CONST_CVT ==1 && flag_cvt_step_shift==FALSE ){ 
        *gear_shift_map = 1;
    }
    else {  
        if     ( (gear_shift_map_old<=10 && v_vehicle>=v_shift_9A) || (gear_shift_map_old==10 && v_vehicle>=v_shift_A9) ){ *gear_shift_map = 10; }
        else if( (gear_shift_map_old<=9  && v_vehicle>=v_shift_89) || (gear_shift_map_old>=9  && v_vehicle>=v_shift_98) ){ *gear_shift_map =  9; }
        else if( (gear_shift_map_old<=8  && v_vehicle>=v_shift_78) || (gear_shift_map_old>=8  && v_vehicle>=v_shift_87) ){ *gear_shift_map =  8; }
        else if( (gear_shift_map_old<=7  && v_vehicle>=v_shift_67) || (gear_shift_map_old>=7  && v_vehicle>=v_shift_76) ){ *gear_shift_map =  7; }
        else if( (gear_shift_map_old<=6  && v_vehicle>=v_shift_56) || (gear_shift_map_old>=6  && v_vehicle>=v_shift_65) ){ *gear_shift_map =  6; }
        else if( (gear_shift_map_old<=5  && v_vehicle>=v_shift_45) || (gear_shift_map_old>=5  && v_vehicle>=v_shift_54) ){ *gear_shift_map =  5; }
        else if( (gear_shift_map_old<=4  && v_vehicle>=v_shift_34) || (gear_shift_map_old>=4  && v_vehicle>=v_shift_43) ){ *gear_shift_map =  4; }
        else if( (gear_shift_map_old<=3  && v_vehicle>=v_shift_23) || (gear_shift_map_old>=3  && v_vehicle>=v_shift_32) ){ *gear_shift_map =  3; }
        else if( (gear_shift_map_old<=2  && v_vehicle>=v_shift_12) || (gear_shift_map_old>=2  && v_vehicle>=v_shift_21) ){ *gear_shift_map =  2; }
        else                                                                                                             { *gear_shift_map =  1; }
    }
}


void     TCU_Shift_End_Jugdement (
        
        schar   *flag_shift_end_judge,  
        schar   *flag_shift_end_speed,  
        float   *t_shift_end,           
        
        schar   flag_shift_end_speed_old,   
        float   t_shift_end_old,            
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   rate_torque_phase,
        sshort  gear_shift_kind,
        float   t_shift_period
){
    
    
    

    sshort i;

    
    
    if( t_shift_period <= CONST_T_SFT_END_EN ){
        *flag_shift_end_speed = FALSE;
    }
    else {
        if      ( gear_shift_kind == _Shift_Up ){
            if ( r_gearbox_input < r_gb_input_tg_gear +  CONST_R_SHIFT_END_UP ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else if ( gear_shift_kind == _Shift_ND ||  gear_shift_kind == _Shift_NR ){
            if ( r_gearbox_input < r_gb_input_tg_gear +  CONST_R_SHIFT_END_EG ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else if ( gear_shift_kind==_Shift_TD  ){
            if ( r_gearbox_input > r_gb_input_tg_gear -  CONST_R_SHIFT_END_TD ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else { /* gear_shift_kind==_Shift_CD   */
            if ( r_gearbox_input > r_gb_input_tg_gear -  CONST_R_SHIFT_END_CD ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
    }

    
    
    if( (*flag_shift_end_speed)==FALSE || rate_torque_phase <1.0f ){
        *t_shift_end = CONST_T_SFT_END_JUDGE;
    }
    else {
        *t_shift_end = F_max( 0.0f, t_shift_end_old-_LoopTime );
    }
    
    
    if( *t_shift_end > 0.0f ){
        *flag_shift_end_judge = FALSE;
    }
    else{
        *flag_shift_end_judge = TRUE ;
    }
}


void     TCU_Gear_Target(
        
        sshort  *gear_target,               
        sshort  *gear_before_shift,         
        float   *virtual_gear_target,       
        float   *virtual_gear_before_shift, 
        float   *t_shift_wait,              
        float   *t_shift_period,            
        float   *t_shift_interval,          
        schar   *flag_shift,                
        
        schar    flag_initialize,
        sshort  gear_before_shift_old,      
        float   t_shift_wait_old,           
        float   t_shift_period_old,         
        float   t_shift_interval_old,       
        schar   flag_shift_old,             
        sshort  gear_shift_map,
        sshort  gear_shift_map_old,
        schar   flag_load_shift,
        sshort  shifter_position,
        schar   flag_shift_end_judge,
        schar   flag_cvt_step_shift,
        schar   flag_cvt_step_shift_old,
        float   virtual_gear_cvt_map
){
    
    
    
    sshort i,j;
    sshort  engage_clutch_num;
    sshort  release_clutch_num;
    
    
    
    
    if( gear_shift_map != gear_shift_map_old && flag_shift_old == FALSE && t_shift_wait_old<=0.0f ){
        *t_shift_wait = CONST_T_SHIFT_WAIT;
    }
    else {
        *t_shift_wait = F_max( t_shift_wait_old - _LoopTime, 0.0f );
    }

    
    
    
    
    if( flag_initialize ){
        *gear_target = 0;
    }
    else if ( shifter_position == -1 ){ 
        *gear_target = _GrRev;
    }
    else if ( shifter_position == 0 ){  
        *gear_target = 0;
    }
    else if( gear_before_shift_old == _GrRev || gear_before_shift_old == _GrNP){
        
        *gear_target = gear_shift_map;
    }
    else if ( flag_shift_old == FALSE ){
        
        
        
        if( (gear_shift_map > gear_before_shift_old) && (*t_shift_interval > CONST_T_SHIFT_INTERVAL) ){
            *gear_target =gear_before_shift_old + 1; 
        }
        
        
        
        else if( gear_shift_map < gear_before_shift_old ){
            
            if(  flag_load_shift  ){
                if ( *t_shift_wait <= 0.0f ){ 
                    
                    if( gear_shift_map < (gear_before_shift_old) - CONST_SKIP_SHIFT_MAX ){
                        j = (gear_before_shift_old) - CONST_SKIP_SHIFT_MAX;
                    }
                    else {
                        j = gear_shift_map;
                    }
                    
                    if( CONST_CVT>0 ){
                        *gear_target = j; 
                    }
                    else {
                        for( ; j < (gear_before_shift_old) ; j++ ){
                            engage_clutch_num  = 0 ;
                            release_clutch_num = 0 ;
                            for( i = 0 ; i <_MaxCL ; i++ ){
                                if     ( MAT_CL_ENGAGE [i][gear_before_shift_old]==0 && MAT_CL_ENGAGE [i][j] > 0 ){
                                    engage_clutch_num ++ ; 
                                }
                                if     ( MAT_CL_ENGAGE [i][gear_before_shift_old] >0 && MAT_CL_ENGAGE [i][j] ==0 ){
                                    release_clutch_num ++ ; 
                                }
                            }
                            if( engage_clutch_num == 1 && release_clutch_num == 1 ){
                                break;
                            }
                        }
                        *gear_target = j;
                    }
                }
                else {;}
            }
            
            else {
                *gear_target =gear_before_shift_old - 1; 
            }
        }
        else {;}
    }

    
    
    
    if(    ( CONST_CVT == 0 && ( *gear_target != gear_target_old ) )
        || ( CONST_CVT == 1 && flag_cvt_step_shift == TRUE && ( flag_cvt_step_shift_old == FALSE || *gear_target != gear_target_old ) )
    ){
        *flag_shift = TRUE;
    }
    else if( gear_before_shift_old == *gear_target
        ||  t_shift_period_old >= CONST_T_SFT_END_MAX
        || (t_shift_period_old >= CONST_T_SFT_END_MIN && flag_shift_end_judge) ){
        *flag_shift = FALSE;
    }
    else {
        ;
    }
    
    
    
    if( gear_before_shift_old == *gear_target || *flag_shift == FALSE ){
        *t_shift_period = 0.0f;
    }
    else {
        *t_shift_period = t_shift_period_old + _LoopTime ;
    }

    
    
    
    if( *flag_shift == TRUE ){
        *t_shift_interval = 0.0f;
    }
    else {
        *t_shift_interval = t_shift_interval_old + _LoopTime ;
    }
    
    
    
    if( flag_initialize ){
        *gear_before_shift = 0;
    }
    else if( CONST_CVT>0 && flag_cvt_step_shift==TRUE &&  flag_cvt_step_shift_old==FALSE ){
        if( virtual_gear_cvt_map > (float)(*gear_target) ){
            *gear_before_shift  = (sshort) virtual_gear_cvt_map + 1 ;
        }
        else {
            *gear_before_shift  = (sshort) virtual_gear_cvt_map ;
        }
    }
    else if( *flag_shift == FALSE ){
        *gear_before_shift = *gear_target;
    }
    else {;}

    
    
    
    if( CONST_CVT>0 && flag_cvt_step_shift==FALSE ){
        *virtual_gear_target = virtual_gear_cvt_map;
    }
    else {
        *virtual_gear_target = (float)(*gear_target);
    }
    
    
    
    if( flag_initialize ){
        *virtual_gear_before_shift = 0.0 ;
    }
    else if( *flag_shift == FALSE ){
        *virtual_gear_before_shift = *virtual_gear_target;
    }
    else {;}
}


void    TCU_Gear_Shift_Type (
        
        sshort  *gear_shift_kind,       
        
        schar   flag_load_shift,
        schar   flag_shift,
        sshort  gear_target,
        sshort  gear_before_shift
){
    
    
    
    
    
    
    
    
    if( flag_shift ){
        if( gear_target == _GrRev ){
            * gear_shift_kind = _Shift_NR ; 
        }
        else if( gear_target>0 && gear_before_shift <=0   ){
            * gear_shift_kind = _Shift_ND ; 
        }
        else if( gear_target > gear_before_shift ){ 
            *gear_shift_kind = _Shift_Up;
        }
        else if( gear_target < gear_before_shift ){ 
            if( flag_load_shift ){
                *gear_shift_kind = _Shift_TD;   
            }
            else {
                *gear_shift_kind = _Shift_CD;   
            }
        }
    }
    else {
        *gear_shift_kind = 0;
    }
}


void     TCU_Target_Gear_Ratio (
        
        float   *gear_ratio         ,       
        float   *gear_ratio_before_shift,   
        float   *gear_ratio_after_shift,    
        float   *r_gb_input_tg_gear,        
        
        float   gear_ratio_old,
        sshort  gear_target,
        sshort  gear_before_shift,
        float   virtual_gear_cvt_map
){
    
    
    
    sshort  tmp_gr_lo_tg;
    sshort  tmp_gr_hi_tg;
    sshort  tmp_gr_lo_bs;
    sshort  tmp_gr_hi_bs;

    tmp_gr_lo_tg = (sshort) virtual_gear_target ;
    tmp_gr_hi_tg = (sshort) virtual_gear_target + 1 ;
    *gear_ratio_after_shift = MAT_TRANS_MGR [ tmp_gr_lo_tg ] - 
            ( MAT_TRANS_MGR [ tmp_gr_lo_tg ] - MAT_TRANS_MGR [ tmp_gr_hi_tg ] ) * ( virtual_gear_target - tmp_gr_lo_tg ) ;

    tmp_gr_lo_bs = (sshort) virtual_gear_before_shift ;
    tmp_gr_hi_bs = (sshort) virtual_gear_before_shift + 1 ;
    *gear_ratio_before_shift = MAT_TRANS_MGR [ tmp_gr_lo_bs ] - 
            ( MAT_TRANS_MGR [ tmp_gr_lo_bs ] - MAT_TRANS_MGR [ tmp_gr_hi_bs ] ) * ( virtual_gear_before_shift - tmp_gr_lo_bs ) ;

    
    
    if ( CONST_CVT>0 ){
        if ( flag_cvt_step_shift==TRUE && ( flag_shift==TRUE || flag_cvt_step_shift_old==FALSE ) ){
            *gear_ratio = F_min( F_max( *gear_ratio_before_shift, *gear_ratio_after_shift ),
                              F_max( F_min( *gear_ratio_before_shift, *gear_ratio_after_shift ),
                                 ( (*gear_ratio_after_shift) - (*gear_ratio_before_shift) ) 
                                   * t_shift_period / F_max( t_shift_time_tg, 100.0 ) + (*gear_ratio_before_shift)
                              )
                          );
        }
        else {
            if( gear_ratio_old > *gear_ratio_after_shift){
                *gear_ratio = F_max ( *gear_ratio_after_shift, gear_ratio_old - CONST_CVT_RATIO_CHANGE );
            }
            else {
                *gear_ratio = F_min ( *gear_ratio_after_shift, gear_ratio_old + CONST_CVT_RATIO_CHANGE );
            }
        }
    }
    else {
        *gear_ratio = (*gear_ratio_after_shift);
    }
    
    
    
    *r_gb_input_tg_gear = (*gear_ratio_after_shift) * r_gearbox_output ;
}


void     TCU_Sub_Gear(
        
        sshort  *gear_sub,          
        sshort  *gear_sub1,         
        sshort  *gear_sub2,         
        float   *t_neutral,         
        sshort  *gear_sub1_tmp,
        sshort  *gear_sub2_tmp,
        
        sshort  gear_sub1_tmp_old,
        sshort  gear_sub2_tmp_old,
        float   t_neutral_old,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        sshort  shifter_position,
        schar   flag_shift
){
    
    
    
    float   v_shift_sub_10u;
    float   v_shift_sub_10d;
    float   v_shift_sub_9u ;
    float   v_shift_sub_9d ;
    float   v_shift_sub_8u ;
    float   v_shift_sub_8d ;
    float   v_shift_sub_7u ;
    float   v_shift_sub_7d ;
    float   v_shift_sub_6u ;
    float   v_shift_sub_6d ;
    float   v_shift_sub_5u ;
    float   v_shift_sub_5d ;
    float   v_shift_sub_4u ;
    float   v_shift_sub_4d ;
    float   v_shift_sub_3u ;
    float   v_shift_sub_3d ;
    float   v_shift_sub_2u ;
    float   v_shift_sub_2d ;
    float   v_shift_sub_1u ;
    float   v_shift_sub_1d ;

    
    
    
    v_shift_sub_10u = Table_search_2D(T2D_V_SGR_10U_Y, T2D_V_SGR_10U_X, accel_position, 10)  ;
    v_shift_sub_10d = Table_search_2D(T2D_V_SGR_10D_Y, T2D_V_SGR_10D_X, accel_position, 10)  ;
    v_shift_sub_9u  = Table_search_2D(T2D_V_SGR_9U_Y , T2D_V_SGR_9U_X , accel_position, 10)  ;
    v_shift_sub_9d  = Table_search_2D(T2D_V_SGR_9D_Y , T2D_V_SGR_9D_X , accel_position, 10)  ;
    v_shift_sub_8u  = Table_search_2D(T2D_V_SGR_8U_Y , T2D_V_SGR_8U_X , accel_position, 10)  ;
    v_shift_sub_8d  = Table_search_2D(T2D_V_SGR_8D_Y , T2D_V_SGR_8D_X , accel_position, 10)  ;
    v_shift_sub_7u  = Table_search_2D(T2D_V_SGR_7U_Y , T2D_V_SGR_7U_X , accel_position, 10)  ;
    v_shift_sub_7d  = Table_search_2D(T2D_V_SGR_7D_Y , T2D_V_SGR_7D_X , accel_position, 10)  ;
    v_shift_sub_6u  = Table_search_2D(T2D_V_SGR_6U_Y , T2D_V_SGR_6U_X , accel_position, 10)  ;
    v_shift_sub_6d  = Table_search_2D(T2D_V_SGR_6D_Y , T2D_V_SGR_6D_X , accel_position, 10)  ;
    v_shift_sub_5u  = Table_search_2D(T2D_V_SGR_5U_Y , T2D_V_SGR_5U_X , accel_position, 10)  ;
    v_shift_sub_5d  = Table_search_2D(T2D_V_SGR_5D_Y , T2D_V_SGR_5D_X , accel_position, 10)  ;
    v_shift_sub_4u  = Table_search_2D(T2D_V_SGR_4U_Y , T2D_V_SGR_4U_X , accel_position, 10)  ;
    v_shift_sub_4d  = Table_search_2D(T2D_V_SGR_4D_Y , T2D_V_SGR_4D_X , accel_position, 10)  ;
    v_shift_sub_3u  = Table_search_2D(T2D_V_SGR_3U_Y , T2D_V_SGR_3U_X , accel_position, 10)  ;
    v_shift_sub_3d  = Table_search_2D(T2D_V_SGR_3D_Y , T2D_V_SGR_3D_X , accel_position, 10)  ;
    v_shift_sub_2u  = Table_search_2D(T2D_V_SGR_2U_Y , T2D_V_SGR_2U_X , accel_position, 10)  ;
    v_shift_sub_2d  = Table_search_2D(T2D_V_SGR_2D_Y , T2D_V_SGR_2D_X , accel_position, 10)  ;
    v_shift_sub_1u  = Table_search_2D(T2D_V_SGR_1U_Y , T2D_V_SGR_1U_X , accel_position, 10)  ;
    v_shift_sub_1d  = Table_search_2D(T2D_V_SGR_1D_Y , T2D_V_SGR_1D_X , accel_position, 10)  ;

    
    
    if ( gear_target == _GrRev ){
        *t_neutral = 0.0f;      
    }
    else if  ( gear_target_old    != gear_target
         ||  flag_shift == TRUE
         ||  accel_position < CONST_AP_GEAR_SUB_NEWTRAL  ){
        *t_neutral = MAT_T_GEAR_SUB_NEWTRAL[gear_target];
    }
    else {
        *t_neutral = F_max( t_neutral_old - _LoopTime , 0.0f);
    }

    
    if      ( shifter_position == -1 ){
        (*gear_sub2_tmp) = 0;
    }
    else if ( shifter_position ==  0 ){
        (*gear_sub2_tmp) = 0;
    }
    else {
        if     ( gear_target == 10 || gear_before_shift == 10)              { (*gear_sub2_tmp) = 10; }
        else if( gear_target == 8  || gear_before_shift == 8 )              { (*gear_sub2_tmp) =  8; }
        else if( gear_target == 6  || gear_before_shift == 6 )              { (*gear_sub2_tmp) =  6; }
        else if( gear_target == 4  || gear_before_shift == 4 )              { (*gear_sub2_tmp) =  4; }
        else if( gear_target == 2  || gear_before_shift == 2 )              { (*gear_sub2_tmp) =  2; }
        else if( gear_target == 9  ){
            if     ( gear_sub2_tmp_old >10 || v_vehicle >= v_shift_sub_9u ) { (*gear_sub2_tmp) = 10; }
            else if( gear_sub2_tmp_old < 8 || v_vehicle <  v_shift_sub_9d ) { (*gear_sub2_tmp) =  8; }
        }
        else if( gear_target == 7 ){
            if     ( gear_sub2_tmp_old > 8 || v_vehicle >= v_shift_sub_7u ) { (*gear_sub2_tmp) =  8; }
            else if( gear_sub2_tmp_old < 6 || v_vehicle <  v_shift_sub_7d ) { (*gear_sub2_tmp) =  6; }
        }
        else if( gear_target == 5 ){
            if     ( gear_sub2_tmp_old > 6 || v_vehicle >= v_shift_sub_5u ) { (*gear_sub2_tmp) =  6; }
            else if( gear_sub2_tmp_old < 4 || v_vehicle <  v_shift_sub_5d ) { (*gear_sub2_tmp) =  4; }
        }
        else if( gear_target == 3 ){
            if     ( gear_sub2_tmp_old > 4 || v_vehicle >= v_shift_sub_3u ) { (*gear_sub2_tmp) =  4; }
            else if( gear_sub2_tmp_old < 2 || v_vehicle <  v_shift_sub_3d ) { (*gear_sub2_tmp) =  2; }
        }
        else if( gear_target == 1 ){
            if     ( gear_sub2_tmp_old > 2 || v_vehicle >= v_shift_sub_1u ) { (*gear_sub2_tmp) =  2; }
            else if( gear_sub2_tmp_old < 1 || v_vehicle <  v_shift_sub_1d ) { (*gear_sub2_tmp) =  0; }
        }
        else                                                                { (*gear_sub2_tmp) =  0; }
    }
    if     ( (gear_target & 0x01) == 0) { *gear_sub2 = (*gear_sub2_tmp); } 
    else if( *t_neutral > 0.0f    )     { *gear_sub2 = (*gear_sub2_tmp); }
    else                                { *gear_sub2 = 0               ; }

    
    if      ( shifter_position == -1 ){
        (*gear_sub1_tmp) = 0;
    }
    else if ( shifter_position ==  0 ){
        (*gear_sub1_tmp) = 0;
    }
    else {
        if     ( gear_target == 9 || gear_before_shift == 9 )               { (*gear_sub1_tmp) =  9; }
        else if( gear_target == 7 || gear_before_shift == 7 )               { (*gear_sub1_tmp) =  7; }
        else if( gear_target == 5 || gear_before_shift == 5 )               { (*gear_sub1_tmp) =  5; }
        else if( gear_target == 3 || gear_before_shift == 3 )               { (*gear_sub1_tmp) =  3; }
        else if( gear_target == 1 || gear_before_shift == 1 )               { (*gear_sub1_tmp) =  1; }
        else if( gear_target == 10 ){
            if     ( gear_sub1_tmp_old >10 || v_vehicle >= v_shift_sub_10u) { (*gear_sub1_tmp) = 11; } 
            else if( gear_sub1_tmp_old < 8 || v_vehicle <  v_shift_sub_10d) { (*gear_sub1_tmp) =  9; }
        }
        else if( gear_target == 8  ){
            if     ( gear_sub1_tmp_old > 9 || v_vehicle >= v_shift_sub_8u ) { (*gear_sub1_tmp) =  9; }
            else if( gear_sub1_tmp_old < 7 || v_vehicle <  v_shift_sub_8d ) { (*gear_sub1_tmp) =  7; }
        }
        else if( gear_target == 6 ){
            if     ( gear_sub1_tmp_old > 7 || v_vehicle >= v_shift_sub_6u ) { (*gear_sub1_tmp) =  7; }
            else if( gear_sub1_tmp_old < 5 || v_vehicle <  v_shift_sub_6d ) { (*gear_sub1_tmp) =  5; }
        }
        else if( gear_target == 4 ){
            if     ( gear_sub1_tmp_old > 5 || v_vehicle >= v_shift_sub_4u ) { (*gear_sub1_tmp) =  5; }
            else if( gear_sub1_tmp_old < 3 || v_vehicle <  v_shift_sub_4d ) { (*gear_sub1_tmp) =  3; }
        }
        else if( gear_target == 2 ){
            if     ( gear_sub1_tmp_old > 3 || v_vehicle >= v_shift_sub_2u ) { (*gear_sub1_tmp) =  3; }
            else if( gear_sub1_tmp_old < 1 || v_vehicle <  v_shift_sub_2d ) { (*gear_sub1_tmp) =  1; }
        }
        else                                                                { (*gear_sub1_tmp) =  0; }
    }
    if     ( (gear_target & 0x01) >  0 )                        { *gear_sub1 = (*gear_sub1_tmp); } 
    else if( (*t_neutral > 0.0f) && ((*gear_sub1_tmp) <= 10) )  { *gear_sub1 = (*gear_sub1_tmp); }
    else                                                        { *gear_sub1 = 0               ; }

    
    if      ( shifter_position == -1 ){
        *gear_sub = 0;
    }
    else if ( shifter_position ==  0 ){
        *gear_sub = 0;
    }
    else {
        if( gear_target & 0x01 ){ *gear_sub = *gear_sub2; }
        else                    { *gear_sub = *gear_sub1; }
    }
}


void     TCU_SYNCHORO_STATUS (
        
        schar   *flag_synchro_ready,        
        
        sshort  gear_target,
        float   f_synchro      [_MaxSyn],
        float   r_synchoro_dif [_MaxSyn]
){
    
    
    
    
    sshort i;

    


    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( MAT_SYNCHRO_COM [i][ gear_target ]  >  0
            && (     f_synchro[i] < CONST_F_SYNCHRO
                 ||  F_abs(r_synchoro_dif[i])> CONST_R_SYNCHRO_ENGAGE
                )
        ){
            break;
        }
    }

    if( i==_MaxSyn )  { *flag_synchro_ready = TRUE ;}
    else                    { *flag_synchro_ready = FALSE;}
}


void     TCU_Gear_Clutch_Control(
        
        sshort  *gear_cl_com,           
        
        schar    flag_initialize,
        schar   flag_synchro_ready,
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_shift_kind,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear
){
    
    
    
    if( flag_initialize ){
        *gear_cl_com = 0;
    }
    else if(  flag_synchro_ready == FALSE ){
        ;       
    }
    else if( gear_target == _GrRev || gear_before_shift==_GrRev ) {
        *gear_cl_com = gear_target;
    }
    else if( gear_shift_kind == _Shift_TD ){
        if( r_gearbox_input >= r_gb_input_tg_gear ){
            *gear_cl_com = gear_target;
        }
        else {;}
    }
    else {
        *gear_cl_com = gear_target;
    }
}


void     TCU_Shift_Clutch (
    
        sshort  *n_engage_clutch,       
        sshort  *n_release_clutch,  
        
        sshort  gear_target,
        sshort  gear_before_shift
){
    
    
    
    sshort i;

    *n_release_clutch = -1;
    for( i = 0 ; i <_MaxCL ; i++ ){
        if     ( MAT_CL_ENGAGE [i][gear_before_shift] >0 && MAT_CL_ENGAGE [i][gear_target]==0 ){
            *n_release_clutch = i; 
        }
    }

    *n_engage_clutch = -1;
    for( i = 0 ; i <_MaxCL ; i++ ){
        if     ( MAT_CL_ENGAGE [i][gear_before_shift]==0 && MAT_CL_ENGAGE [i][gear_target] >0 ){
            *n_engage_clutch = i; 
        }
    }
}


void    TCU_Shift_Inertia_Torq (
        
        float *tq_inertia_engage_cl,        
        float *tq_inertia_release_cl,       
        float *tq_shift_up_reduction_req,   
        float *tq_shift_up_reduction,       
        float *tq_eng_shift_up_reduction,   
        float *tq_p2m_shift_up_reduction,   
        float *t_shift_time_tg,             
        float *r_delta_speed,               
        float *tq_inertia,                  
        
        schar    flag_initialize,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        float   r_p2m,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   tq_engine_target,
        float   tq_engine_min_pos,
        schar   flag_k0cl_open_req,
        float   tq_p2m_req
){
    float   inertia_shift;
    float   tq_p2m_min_pos;
    
    
    
    if( flag_k0cl_open_req ){
        inertia_shift = CONST_INERTIA_P2M;
    }
    else {
        inertia_shift = CONST_INERTIA_P2M 
        + Table_search_2D(T2D_I_SHIFT_INERTIA_Y, T2D_I_SHIFT_INERTIA_X, (float)gear_before_shift, 12);
    }
    
    if( flag_initialize ){
        *r_delta_speed   = 0.0 ;
        *t_shift_time_tg = 0.0 ;
        *tq_inertia      = 0.0 ;
    }
    else if ( gear_target != gear_target_old ){
        
        *r_delta_speed = r_gearbox_input - r_gb_input_tg_gear ;
        
        if     ( gear_shift_kind ==_Shift_Up ){ 
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_UP_Y, T2D_T_SHIFT_TIME_TG_UP_X, *r_delta_speed, 5);
        }
        else if( gear_shift_kind ==_Shift_CD ){ 
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_CD_Y, T2D_T_SHIFT_TIME_TG_CD_X, *r_delta_speed, 5);
        }
        else if( gear_shift_kind ==_Shift_TD ){ 
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_TD_Y, T2D_T_SHIFT_TIME_TG_TD_X, *r_delta_speed, 5);
        }
        else {
            *t_shift_time_tg = 0.0f;
        }

        
        
        
        if( (*t_shift_time_tg) == 0.0f ){
            *tq_inertia = 0.0f;
        }
        else {
            *tq_inertia = ( *r_delta_speed / 60.0f * 2.0f * _PI )   
                         / ( (*t_shift_time_tg) /1000.0f )      
                         * inertia_shift;                   
        }
    }
    else {;}

    
    
    
    
    if     ( gear_shift_kind ==_Shift_Up ){ 
        *tq_shift_up_reduction_req  = *tq_inertia * CONST_RATIO_TQ_REDUCTION;
    }
    else {
        *tq_shift_up_reduction_req  = 0.0;
    }
    
    
    if ( flag_k0cl_open_req ){
            *tq_eng_shift_up_reduction = 0.0;
    }
    else {
        *tq_eng_shift_up_reduction
            = F_min ( *tq_shift_up_reduction_req, (tq_engine_target - tq_engine_min_pos) );
    }
    
    
    tq_p2m_min_pos = Table_search_2D( T2D_P2M_TQ_SFT_MIN_Y, T2D_P2M_TQ_SFT_MIN_X, r_p2m, 8 );
    *tq_p2m_shift_up_reduction = F_min( (*tq_shift_up_reduction_req) - (*tq_eng_shift_up_reduction), tq_p2m_req - tq_p2m_min_pos );

    
    
    *tq_shift_up_reduction = (*tq_eng_shift_up_reduction) + (*tq_p2m_shift_up_reduction) ;

    
    if     ( gear_shift_kind ==_Shift_Up ){ 
        *tq_inertia_engage_cl  = *tq_inertia - *tq_shift_up_reduction;
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_CD ){ 
        *tq_inertia_engage_cl  = -(*tq_inertia);
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_TD ){ 
        *tq_inertia_engage_cl  = CONST_TQ_INERTIA_TD_SHIFT;
        *tq_inertia_release_cl = *tq_inertia;
    }
    else if( gear_shift_kind ==_Shift_ND ){ 
        *tq_inertia_engage_cl  = CONST_TQ_ND_ENGAGE;
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_NR ){ 
        *tq_inertia_engage_cl  = CONST_TQ_NR_ENGAGE;
        *tq_inertia_release_cl = 0.0f;
    }
    else {
        *tq_inertia_engage_cl  = 0.0 ;
        *tq_inertia_release_cl = 0.0 ;
    }
}


void     TCU_Torque_Phase (
        
        float   *rate_torque_phase, 
        float   *t_tq_phase,        
        
        float   t_tq_phase_old,
        schar   flag_shift,
        sshort  gear_shift_kind,
        sshort  gear_cl_com,
        sshort  gear_target
){
    
    
    
    float    t_target_tq_phase;

    if ( gear_shift_kind == _Shift_ND ){
        t_target_tq_phase = CONST_T_TQ_PHASE_ND;
    }
    else if ( gear_shift_kind == _Shift_NR ){
        t_target_tq_phase = CONST_T_TQ_PHASE_NR;
    }
    else if ( gear_shift_kind == _Shift_Up ){
        t_target_tq_phase = CONST_T_TQ_PHASE_UP;
    }
    else if ( gear_shift_kind==_Shift_TD  ){
        t_target_tq_phase = CONST_T_TQ_PHASE_TD;
    }
    else { /* gear_shift_kind==_Shift_CD   */
        t_target_tq_phase = CONST_T_TQ_PHASE_CD;
    }

    
    if( flag_shift && gear_cl_com == gear_target ){
        *t_tq_phase = t_tq_phase_old + _LoopTime;
    }
    else{
        *t_tq_phase = 0.0f;
    }
    *rate_torque_phase = (*t_tq_phase) / t_target_tq_phase;
};


void     TCU_Clutch_Control (
        
        float   tq_clutch_cap_inp[_MaxCL],
        float   *tq_engage_cl_cap,
        float   *tq_release_cl_cap,
        
        float   tq_gearbox_input,
        float   tq_cl_slip_control,
        float   tq_inertia_engage_cl,
        float   tq_inertia_release_cl,
        float   rate_torque_phase,
        schar   flag_shift,
        sshort  n_engage_clutch,
        sshort  n_release_clutch,
        sshort  gear_cl_com,
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_cl_creep_cont
){
    sshort i;
    float   tq_engage_cl_cap_tg ;

    
    
    
    
    if( n_engage_clutch < 0 ){
        tq_engage_cl_cap_tg = 0.0f;
    }
    else if( MAT_CL_ENGAGE [n_engage_clutch][gear_target] == 2 && flag_engine_idle_control== TRUE ){
        tq_engage_cl_cap_tg = tq_cl_creep_cont;
    }
    else {
        tq_engage_cl_cap_tg =
                F_max( F_abs( tq_gearbox_input ) + tq_inertia_engage_cl, CONST_TQ_ENGAGE_CL_MIN  );
    }
    *tq_engage_cl_cap =  F_min(
                            tq_engage_cl_cap_tg,
                            F_max(  F_abs( tq_gearbox_input), CONST_TQ_TQPHASE_MIN ) * rate_torque_phase
                        );

    
    if( gear_target == gear_cl_com ){ 
        *tq_release_cl_cap = F_max( F_abs( tq_gearbox_input ) - (*tq_engage_cl_cap) , 0.0f );
    }
    else { 
        *tq_release_cl_cap = F_max( F_abs( tq_gearbox_input ) + tq_inertia_release_cl , 0.0f );
    }

    


    for( i = 0 ; i <_MaxCL ; i++ ){
        if( flag_shift && ( CONST_CVT==0 || (gear_shift_kind == _Shift_ND) || (gear_shift_kind ==_Shift_NR) ) ){
            if( i == n_engage_clutch ){ 
                tq_clutch_cap_inp[i] = (*tq_engage_cl_cap);
            }
            else if( i == n_release_clutch ){ 
                tq_clutch_cap_inp[i] = (*tq_release_cl_cap);
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 2 ){ 
                if( flag_engine_idle_control ){
                    tq_clutch_cap_inp[i] = tq_cl_creep_cont;
                }
                else{
                    tq_clutch_cap_inp[i] = F_max( *tq_engage_cl_cap, tq_cl_slip_control );
                }
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 1 ){ 
                tq_clutch_cap_inp[i] = F_max( (*tq_engage_cl_cap), F_abs(tq_gearbox_input));
            }
            else {
                tq_clutch_cap_inp[i] = 0.0f ;
            }
        }
        else {
            if( MAT_CL_ENGAGE [i][gear_target] == 2 ){ 
                if( flag_engine_idle_control ){
                    tq_clutch_cap_inp[i] = tq_cl_creep_cont;
                }
                else {
                    tq_clutch_cap_inp[i] = F_max( tq_cl_creep_cont, tq_cl_slip_control );
                }
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 1 ){ 
                tq_clutch_cap_inp[i] = F_abs(tq_gearbox_input) + CONST_TQ_ENGAGE_CL_MARGIN;
            }
            else {
                tq_clutch_cap_inp[i] = 0.0f;
            }
        }
    }
}


void     TCU_Clutch_Torque_Capacity (
        
        float   *tq_clutch_cap,         
        float   *rate_clutch_share,     
        
        sshort  gear_target,
        sshort  gear_before_shift,
        float   tq_clutch_cap_inp[]
){
    
    
    
    sshort i;



    for( i=0; i<_MaxCL; i++){
        rate_clutch_share[i] = F_max( MAT_CL_SHARE_RATE[i][gear_target] , MAT_CL_SHARE_RATE[i][gear_before_shift] );
        tq_clutch_cap[i] = rate_clutch_share[i]  * tq_clutch_cap_inp[i] ;
    }
}


void     TCU_SYNCHORO_CONTROL (
        
        float   f_synchro     [_MaxSyn],    
        schar   flag_synchro_com [_MaxSyn], 
        
        float   f_synchro_old [_MaxSyn],
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_sub1,
        sshort  gear_sub2
){
    
    
    
    sshort i;
    schar  flag_synchoro_off;

    


    for( i = 0 ; i <_MaxSyn ; i++ ){
        if (     MAT_SYNCHRO_COM [i][ gear_sub1 ] == 0
             &&  MAT_SYNCHRO_COM [i][ gear_sub2 ] == 0
             && f_synchro[i] > 0.0f
        ){
            break;
        }
    }

    if( i == _MaxSyn ){
        flag_synchoro_off = TRUE;
    }
    else{
        flag_synchoro_off = FALSE;
    }

    

    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( (flag_synchoro_off  == TRUE  || f_synchro[i] >0.0f )
             && (MAT_SYNCHRO_COM [i][ gear_sub1 ]  >  0 ||  MAT_SYNCHRO_COM [i][ gear_sub2 ]  >  0 )
        ){
            flag_synchro_com [i] = TRUE;
        }
        else {
            flag_synchro_com [i] = FALSE;
        }
    }

    

    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( flag_synchro_com[i] ){
            f_synchro[i] = F_min( CONST_F_SYNCHRO, f_synchro_old[i] + CONST_F_UP_SYNCHRO * _LoopTime / 1000.0f );
        }
        else {
            f_synchro[i] = F_max( 0.0f, f_synchro_old[i] - CONST_F_DOWN_SYNCHRO * _LoopTime / 1000.0f );
        }
    }

}


void     TCU_Trans_Fluid_Characteristic (
        
        float   *viscosity_trans_fluid,             
        float   *density_trans_fluid,               
        
        float   temp_trans_fluid
){
    
    
    
    
    *viscosity_trans_fluid  = Table_search_2D( T2D_VISCOSITY_TRANS_FLUED_Y, T2D_VISCOSITY_TRANS_FLUED_X, temp_trans_fluid, 9 );
    
    *density_trans_fluid    = Table_search_2D( T2D_DENSITY_TRANS_FLUED_Y  , T2D_DENSITY_TRANS_FLUED_X  , temp_trans_fluid, 9 );
}


void     TCU_Pressure_Line_Control (
        
        float   *p_line,                
        
        float   tq_gearbox_input,
        sshort  gear_target,
        float   p_pulley_primary,
        float   p_pulley_secoundary
){
    
    
    
    *p_line  = F_max ( Table_search_2D( T2D_P_LINE_Y[gear_target], T2D_P_LINE_X[gear_target], tq_gearbox_input, 8 ),
                       F_max( p_pulley_primary , p_pulley_secoundary ) + CONST_P_LINE_MARGIN );
}


void     TCU_Pressure_CVT_Pulley (
        
        float   *p_pulley_primary,
        float   *p_pulley_secoundary,
        
        float   tq_gearbox_input,
        float   r_gearbox_input,
        float   r_gearbox_output,
        float   gear_ratio,
        float   gear_ratio_after_shift,
        float   viscosity_trans_fluid,
        float   density_trans_fluid
){
    
    
    
    float x;
    float y;
    float z;

    
    
    
    x = Table_search_2D( T2DX_PR_PULLEY_SEC_Y, T2DX_PR_PULLEY_SEC_X, tq_gearbox_input, 6 );
    y = Table_search_2D( T2DY_PR_PULLEY_SEC_Y, T2DY_PR_PULLEY_SEC_X, r_gearbox_input , 8 );
    z = Table_search_2D( T2DZ_PR_PULLEY_SEC_Y, T2DZ_PR_PULLEY_SEC_X, gear_ratio, 3 );
    p_pulley_sec_base = Table_search_4D ( T4D_PR_PULLEY_SEC, x, 6, y, 8, z, 3 );
    
    x = Table_search_2D( T2DX_FACTOR_SAFETY_SEC_Y, T2DX_FACTOR_SAFETY_SEC_X, gear_ratio, 5 );
    y = Table_search_2D( T2DY_FACTOR_SAFETY_SEC_Y, T2DY_FACTOR_SAFETY_SEC_X, r_gearbox_input , 6 );
    z = Table_search_2D( T2DZ_FACTOR_SAFETY_SEC_Y, T2DZ_FACTOR_SAFETY_SEC_X, viscosity_trans_fluid, 4 );
    factor_safety_pulley_sec = Table_search_4D ( T4D_FACTOR_SAFETY_SEC, x, 5, y, 6, z, 4 );
    
    x = Table_search_2D( T2DX_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, gear_ratio, 6 );
    y = Table_search_2D( T2DY_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, r_gearbox_input , 6 );
    z = Table_search_2D( T2DZ_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, viscosity_trans_fluid, 4 );
    p_pulley_sec_min = Table_search_4D ( T4D_PR_PULLEY_SEC_MIN, x, 6, y, 6, z, 4 );
    
    *p_pulley_secoundary = F_max( p_pulley_sec_base * factor_safety_pulley_sec, p_pulley_sec_min );

    
    
    radius_pulley_pri = Table_search_2D( T2D_RADIUS_PULLEY_PRI_Y, T2D_RADIUS_PULLEY_PRI_X, gear_ratio_after_shift, 9 );
    radius_pulley_sec = radius_pulley_pri * gear_ratio_after_shift;
    
    
    
    
    radius_pullye_sec_od
        = Table_search_2D( T2D_RADIUS_PULLEY_PRI_Y, T2D_RADIUS_PULLEY_PRI_X, CONST_RATIO_OD, 9 ) * CONST_RATIO_OD;
    
    stroke_pulley_sec = ( radius_pulley_sec - radius_pullye_sec_od ) * CONST_TAN_ANGLE_PULLEY;
    
    f_spg_pulley_sec = CONST_F_SPG_PULLEY - stroke_pulley_sec * CONST_K_SPG_PULLEY ;
    
    f_centrifugal_pr_sec = _PI * density_trans_fluid * F_Pow ( (r_gearbox_output /60.0 * 2 * _PI), 2 )
                                * F_Pow( ( F_Pow(CONST_D1_SYLINDER_SEC/2.0, 2) - F_Pow(CONST_D0_SYLINDER_SEC/2.0, 2) ) , 2) / 4.0;
    
    f_clamp_pully_sec = (*p_pulley_secoundary) * 1000.0 * _PI / 4.0 * ( F_Pow(CONST_D1_SYLINDER_SEC,2) - F_Pow(CONST_D0_SYLINDER_SEC, 2) ) 
                         + f_spg_pulley_sec + f_centrifugal_pr_sec;

    
    
    
    ratio_variator_cap = tq_gearbox_input * CONST_FACTOR_SAFETY_CLAMP * CONST_COS_ANGLE_PULLEY 
                                                    / ( 2.0 * CONST_MYU_VARIATOR * radius_pulley_pri * f_clamp_pully_sec );
    
    x = Table_search_2D( T2DX_RATIO_CLAMP_Y, T2DX_RATIO_CLAMP_X, ratio_variator_cap, 21 );
    y = Table_search_2D( T2DY_RATIO_CLAMP_Y, T2DY_RATIO_CLAMP_X, gear_ratio_after_shift , 5 );
    ratio_pulley_clamp = Table_search_3D( T3D_RATIO_CLAMP, x, 21, y, 5 );
    
    f_clamp_pully_pri = f_clamp_pully_sec * ratio_pulley_clamp ;

    
    
    
    f_centrifugal_pr_pri = _PI * density_trans_fluid * F_Pow ( (r_gearbox_input / 60.0 * 2 * _PI), 2 )
                                  * F_Pow( ( F_Pow(CONST_D1_SYLINDER_PRI/2.0, 2) - F_Pow(CONST_D0_SYLINDER_PRI/2.0, 2) ) , 2) / 4.0; 
    
    *p_pulley_primary = ( f_clamp_pully_pri - f_centrifugal_pr_pri ) 
                          / ( _PI / 4.0 * ( F_Pow(CONST_D1_SYLINDER_PRI,2) - F_Pow(CONST_D0_SYLINDER_PRI, 2) ) ) / 1000.0;

}

void     TCU_Acutuator_Control (
        
        float   *i_actuator,            
        
        sshort  gear_target
){
    
    
    
    *i_actuator = MAT_I_ACTUATOR [gear_target];
}


void     TCU_EOP_Control (
        
        float   *i_eop,                 
        
        float   r_engine,
        float   temp_trans_fluid
){
    
    
    
    *i_eop  = Table_search_3D(T3D_I_EOP,
                    Table_search_2D(T2DX_I_EOP_Y, T2DX_I_EOP_X, r_engine, 6), 6,
                    Table_search_2D(T2DY_I_EOP_Y, T2DY_I_EOP_X, temp_trans_fluid, 5), 5 );
}


void     TCU_Cooler_Flow_Rate_Control (
        
        float   *q_cooler_trans_fluid   ,   
        float   *q_cooler_engine_water  ,   
        
        float   temp_trans_fluid
){
    
    
    
    *q_cooler_trans_fluid = Table_search_2D(T2D_Q_TRANS_FLUID_Y, T2D_Q_TRANS_FLUID_X, temp_trans_fluid, 8);
    *q_cooler_engine_water = Table_search_2D(T2D_Q_ENGINE_WATER_Y, T2D_Q_ENGINE_WATER_X, temp_trans_fluid, 8);
}


void     TCU_Up_Shift_Torque_Reduction (
        
        schar   *flag_shift_up_tq_request,  
        
        float    tq_eng_shift_up_reduction,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_before_shift,
        schar   flag_shift,
        float   rate_torque_phase,
        float   r_gb_input_tg_gear,
        float   r_gearbox_input,
        float   tq_engine_min_pos,
        float   tq_inertia_engage_cl
){
    float   r_tq_reduction_off;
    
    
    
    
    if      ( gear_before_shift == 1 && gear_target == 2 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_12_Y, T2D_TQ_RED_OFF_12_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 2 && gear_target == 3 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_23_Y, T2D_TQ_RED_OFF_23_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 3 && gear_target == 4 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_34_Y, T2D_TQ_RED_OFF_34_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 4 && gear_target == 5 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_45_Y, T2D_TQ_RED_OFF_45_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 5 && gear_target == 6 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_56_Y, T2D_TQ_RED_OFF_56_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 6 && gear_target == 7 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_67_Y, T2D_TQ_RED_OFF_67_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 7 && gear_target == 8 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_78_Y, T2D_TQ_RED_OFF_78_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 8 && gear_target == 9 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_89_Y, T2D_TQ_RED_OFF_89_X, r_gb_input_tg_gear, 5);
    }
    else  {/* gear_before_shift == 9 && gear_target == 10 */
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_9A_Y, T2D_TQ_RED_OFF_9A_X, r_gb_input_tg_gear, 5);
    }
    
    
    if ( flag_shift == FALSE || r_gearbox_input < r_gb_input_tg_gear + r_tq_reduction_off ){
        *flag_shift_up_tq_request = FALSE;
    }
    else if( rate_torque_phase >=1.0f && gear_shift_kind == _Shift_Up ){
        *flag_shift_up_tq_request = TRUE;
    }
}


void     TCU_Engine_Torque_Request (
        
        float   *tq_engine_max_req,         
        float   *tq_engine_min_req,         
        float   *r_engine_target,           
        
        float   tq_engine_target,
        float   tq_eng_shift_up_reduction,
        schar   flag_shift_up_tq_request,
        schar   flag_k0cl_open_req
){
    
    
    
    
    if( (flag_shift_up_tq_request == TRUE) && (flag_k0cl_open_req == FALSE) ){
        *tq_engine_max_req = tq_engine_target - tq_eng_shift_up_reduction;
    }
    else {
        *tq_engine_max_req = 1000.0f ;
    }
    
    
    *tq_engine_min_req = -1000.0f;

    
    
    *r_engine_target = -1000.0f;
}


void     TCU_Information_For_ECU (
        
        float   *tq_trans_input             ,   
        float   *tq_gain_drivetrain         ,   
        schar   *flag_lockup                ,   
        
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_torq_converter_input,
        float   tq_cl_creep_cont,
        float   tq_cl_slip_base,
        float   gear_ratio,
        float   torq_ratio_torq_converter
){
    
    
    
    
    if( flag_engine_idle_control ){
        *tq_trans_input = tq_torq_converter_input + tq_cl_creep_cont;
    }
    else {
        *tq_trans_input = tq_torq_converter_input + tq_cl_slip_base;
    }
    
    *tq_gain_drivetrain = gear_ratio * CONST_FGR * torq_ratio_torq_converter;

    
    *flag_lockup = (!flag_engine_idle_control);
}

void     TCU_Disconnect_Clutch_Control(
        
        float   *tq_k0_clutch_cap,      
        sshort  *status_k0_clutch,      
        
        schar   flag_k0cl_open_req, 
        float   r_engine,               
        float   r_starting_device_input,
        float   tq_engine_target,       
        schar    flag_initialize
){
    if ( flag_initialize ){
        *tq_k0_clutch_cap = 0.0 ;
    }
    
    if( flag_k0cl_open_req == TRUE ){
        *status_k0_clutch = 0;
    }
    else if ( ( r_engine < F_max( r_gb_input_tg_gear, r_engine_idle ) + CONST_R_K0_CLOSE  ) && ( *status_k0_clutch < 2 ) ){
        *status_k0_clutch = 1;
    }
    else {
        *status_k0_clutch = 2;
    }
    
    if( *status_k0_clutch == 0 ){
        *tq_k0_clutch_cap = 0.0 ;
    }
    else if( *status_k0_clutch == 1 ){
        *tq_k0_clutch_cap = CONST_TQ_K0_ENG_START;
    }
    else {
        *tq_k0_clutch_cap = F_max( F_min( (*tq_k0_clutch_cap) + CONST_TQ_K0_CLOSE , 1000.0), CONST_TQ_K0_ENG_START);
    }
}


void     TCU_P2_Motor_Control(
        
        float   *tq_p2m_target,         
        
        sshort  status_k0_clutch,
        schar   flag_shift_up_tq_request,
        float   tq_starting_device_input,
        float   tq_p2m_req,
        float   r_engine,
        float   tq_p2m_shift_up_reduction
){
    if( status_k0_clutch == 1 ){
        *tq_p2m_target = tq_starting_device_input + CONST_TQ_K0_ENG_START;
    }
    else {
        if ( flag_shift_up_tq_request == TRUE ){
            *tq_p2m_target = tq_p2m_req - tq_p2m_shift_up_reduction;
        }
        else { 
            *tq_p2m_target = tq_p2m_req ;
        }
    }
}


void    TCU_Torque_Input_Starting_Device(
        
        float   *tq_starting_device_input,      
        
        float   tq_engine_target,
        float   tq_p2m_target
){
    
    
    
    *tq_starting_device_input = tq_engine_target + tq_p2m_req;
}


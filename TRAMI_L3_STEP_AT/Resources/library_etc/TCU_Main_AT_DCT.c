#include "TRAMI_Standard_AT_Strategy_v230.c"

void TCU_Main_AT_DCT(
	
	double Out_tau_clutch_cap[12],			   
	double Out_f_synchro_n[11],                
	double *Out_p_line_pa,                     
	double *Out_i_actuator_ampere,             
	double *Out_i_eop_ampere,                  
	double *Out_qv_cooler_trans_fluid_m3ps,    
	double *Out_qv_cooler_eng_water_m3ps,      
	double *Out_tau_engine_max_req,            
	double *Out_tau_engine_min_req,            
	double *Out_w_engine_target_radps,         
	double *Out_tau_trans_input,               
	double *Out_trans_gear_ratio,              
	double *Out_flag_trans_lock_up,            
	
	double IN_flag_initialize,                 
	double IN_w_gearbox_input_radps,           
	double IN_w_gearbox_output_radps,          
	const double IN_w_synchoro_dif_radps[11],  
	double IN_t_trans_fluid_k,                 
	double IN_t_engine_water_k,                
	double IN_accel_position_per,              
	double IN_trans_shifter_position,          
	double IN_v_vehicle_mps,                   
	double IN_tau_brake,                       
	double IN_w_engine_radps,                  
	double IN_w_engine_idle_radps,             
	double IN_tau_engine_target,               
	double IN_tau_engine,                      
	double IN_tau_engine_min_pos,              
	double IN_tau_engine_max_pos               
){
	
	
	
	int  i ;

	
	float Lo_trans_gear          				; 
	float Lo_trans_gear_ratio					; 
	float Lo_tau_clutch_cap		[12]			; 
	float Lo_f_synchro_n		[11]			; 
	float Lo_tau_k0_clutch_cap   				; 
	float Lo_tau_p2m_target      				; 
	float Lo_p_line_pa							; 
	float Lo_p_pulley_pri_pa     				; 
	float Lo_p_pulley_sec_pa     				; 
	float Lo_i_actuator_ampere					; 
	float Lo_i_eop_ampere						; 
	float Lo_qv_cooler_trans_fluid_m3ps			; 
	float Lo_qv_cooler_eng_water_m3ps			; 
	float Lo_trans_torq_gain 					; 
	signed char  Lo_flag_trans_shift    		; 
	float Lo_tau_engine_max_req					; 
	float Lo_tau_engine_min_req					; 
	float Lo_w_engine_target_radps				; 
	float Lo_tau_trans_input					; 
	signed char  Lo_flag_trans_lock_up			; 
	
	
	float Lo_obs_tcu[10]					; 

	
	signed char  Lo_flag_initialize			; 
	float Lo_w_starting_device_input_radps	; 
	float Lo_w_gearbox_input_radps			; 
	float Lo_w_gearbox_output_radps			; 
	float Lo_w_synchoro_dif_radps[11]		; 
	float Lo_t_trans_fluid_k				; 
	float Lo_t_engine_water_k				; 
	float Lo_v_vehicle_mps					; 
	float Lo_tau_brake						; 
	float Lo_accel_position_per				; 
	signed short Lo_trans_shifter_position	; 
	float Lo_w_engine_radps					; 
	float Lo_w_engine_idle_radps			; 
	float Lo_tau_engine_target				; 
	float Lo_tau_engine						; 
	float Lo_tau_engine_min_pos				; 
	float Lo_tau_engine_max_pos				; 
	float Lo_tau_p2m_req                  	; 
	float Lo_flag_k0_clutch_open          	; 
	signed short Lo_drive_mode   			; 

	
	
	
	
	Lo_flag_initialize 					= (char)IN_flag_initialize			; 
	Lo_w_starting_device_input_radps 	= (float)IN_w_engine_radps			; 
	Lo_w_gearbox_input_radps 			= (float)IN_w_gearbox_input_radps	; 
	Lo_w_gearbox_output_radps 			= (float)IN_w_gearbox_output_radps	; 

	for(i = 0;i < 11;i++ ){
		Lo_w_synchoro_dif_radps[i] 		= (float)IN_w_synchoro_dif_radps[i]	; 
	}

	Lo_t_trans_fluid_k 		= (float)IN_t_trans_fluid_k				; 
	Lo_t_engine_water_k 	= (float)IN_t_engine_water_k			; 
	Lo_v_vehicle_mps 		= (float)IN_v_vehicle_mps				; 
	Lo_tau_brake 			= (float)IN_tau_brake					; 
	Lo_accel_position_per 	= (float)IN_accel_position_per			; 
	Lo_trans_shifter_position = (short)IN_trans_shifter_position	; 
	Lo_w_engine_radps 		= (float)IN_w_engine_radps				; 
	Lo_w_engine_idle_radps 	= (float)IN_w_engine_idle_radps			; 
	Lo_tau_engine_target 	= (float)IN_tau_engine_target			; 
	Lo_tau_engine			= (float)IN_tau_engine					; 
	Lo_tau_engine_min_pos 	= (float)IN_tau_engine_min_pos			; 
	Lo_tau_engine_max_pos 	= (float)IN_tau_engine_max_pos			; 

	Lo_tau_p2m_req          = 0 									; 
	Lo_flag_k0_clutch_open  = 0 									; 
	Lo_drive_mode           = 0 									; 

	

	TCU_Main(
										
										
		&Lo_trans_gear					,	
		&Lo_trans_gear_ratio			,	
		Lo_tau_clutch_cap				,	
		Lo_f_synchro_n					,	
		&Lo_tau_k0_clutch_cap			,	
		&Lo_tau_p2m_target				,	
		&Lo_p_line_pa					,	
		&Lo_p_pulley_pri_pa				,	
		&Lo_p_pulley_sec_pa				,	
		&Lo_i_actuator_ampere			,	
		&Lo_i_eop_ampere				,	
		&Lo_qv_cooler_trans_fluid_m3ps	,	
		&Lo_qv_cooler_eng_water_m3ps	,	
											
		&Lo_trans_torq_gain				,	
		&Lo_flag_trans_shift			,	
										
		&Lo_tau_engine_max_req			,	
		&Lo_tau_engine_min_req			,	
		&Lo_w_engine_target_radps		,	
		&Lo_tau_trans_input				,	
		&Lo_flag_trans_lock_up			,	
										
		Lo_flag_initialize				,	
										
		Lo_w_starting_device_input_radps,	
		Lo_w_gearbox_input_radps		,	
		Lo_w_gearbox_output_radps		,	
		Lo_w_synchoro_dif_radps			,	
		Lo_t_trans_fluid_k				,	
		Lo_t_engine_water_k				,	
										
		Lo_v_vehicle_mps				,	
		Lo_tau_brake					,	
										
		Lo_accel_position_per			,	
		Lo_trans_shifter_position		,	
										
		Lo_w_engine_radps				,	
		Lo_w_engine_idle_radps			,	
		Lo_tau_engine_target			,	
		Lo_tau_engine					,	
		Lo_tau_engine_min_pos			,	
		Lo_tau_engine_max_pos			,	
										
		Lo_tau_p2m_req					,	
		Lo_flag_k0_clutch_open			,	
		Lo_drive_mode					,	
										
		Lo_obs_tcu							
	) ;


	
	
	
	

	
	*Out_trans_gear_ratio 			= (double)Lo_trans_gear_ratio			; 
	for(i = 0;i < 12 ; i++){
      Out_tau_clutch_cap[i]			= (double)Lo_tau_clutch_cap[i]			; 
    }
	for(i = 0;i < 11 ; i++){
		Out_f_synchro_n[i] 			= (double)Lo_f_synchro_n[i]				; 
	}
	
	
	*Out_p_line_pa					= (double)Lo_p_line_pa					; 
	
	
	*Out_i_actuator_ampere			= (double)Lo_i_actuator_ampere			; 
	*Out_i_eop_ampere				= (double)Lo_i_eop_ampere				; 
	*Out_qv_cooler_trans_fluid_m3ps	= (double)Lo_qv_cooler_trans_fluid_m3ps	; 
	*Out_qv_cooler_eng_water_m3ps	= (double)Lo_qv_cooler_eng_water_m3ps	; 
	
	
	*Out_tau_engine_max_req			= (double)Lo_tau_engine_max_req			; 
	*Out_tau_engine_min_req			= (double)Lo_tau_engine_min_req			; 
	*Out_w_engine_target_radps		= (double)Lo_w_engine_target_radps		; 
	*Out_tau_trans_input			= (double)Lo_tau_trans_input			; 
	*Out_flag_trans_lock_up			= (double)Lo_flag_trans_lock_up			; 
}

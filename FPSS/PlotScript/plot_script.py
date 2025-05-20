# -*- coding: utf-8 -*-
"""
Created on Wed May 14 10:04:20 2025

@author: hart_t1

This script is used to plot the simulation results of our FPSS model. 
Make sure to change the path according to where OMEdit saves its one_zone_res.mat file.
And make sure to pip install DyMat in order to be able to run the script.

"""

import DyMat
import matplotlib.pyplot as plt
import numpy as np
import os
import datetime

### choose a time unit:
# timeunit = 'seconds'
# timeunit = 'minutes'
timeunit = 'hours'

### choose your .mat file
path_file="C:/Users/hart_t1/AppData/Local/Temp/OpenModelica/OMEdit/FPSS.System.one_zone/one_zone_res.mat"


### get teh file creation time
timestamp = os.path.getmtime(path_file)
modification_time = datetime.datetime.fromtimestamp(timestamp).strftime('%Y-%m-%d %H:%M:%S')

df = DyMat.DyMatFile(path_file)

if timeunit == "seconds":
   time = df.abscissa('building_one_zone.Q_loss_ground', valuesOnly=True)
elif timeunit == "minutes":
    time = df.abscissa('building_one_zone.Q_loss_ground', valuesOnly=True) / 60
elif timeunit == "hours":
    time = df.abscissa('building_one_zone.Q_loss_ground', valuesOnly=True) / 3600



# print(d.names())


def value_to_array(declaration,time, to_celsius=False, to_bar=False, to_kW=False):
    """
    Values, that are constant over the whole simulation, are saved only once in the .mat file. In order to plot these values we need an array. This function creates an array, that is filled with the value as many times as time as entries.
    Also this function can convert from Kelvin to Celsius from Pascal to bar and from Watt to KW.
    """
    if to_celsius:
        return [df[declaration][0]-273.15]*len(time)
    if to_bar:
        return [df[declaration][0]/100000]*len(time)
    if to_kW:
        return [df[declaration][0]/1000]*len(time)
    else:
        return [df[declaration][0]]*len(time)
    


plt.figure()
plt.title("Heating Curve")
plt.scatter(df["DataInput.T_amb"]-273.15, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.heatingCurve_2s.TSupSet"]-273.15,  label='Heating Curve')
plt.xlabel("$T_{amb}$ [°C]")
plt.ylabel("$T_{sup}$ [°C]")



fig, axs = plt.subplots(3, 3, sharex=True)
fig.suptitle("Controller")
fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)

axs[0,0].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorIn.T"]-273.15, label='$T_{Bor,in}$ [°C]')
axs[0,0].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorOut.T"]-273.15, label='$T_{Bor,out}$ [°C]')
# axs[0,0].set_ylabel('Borehole Temperature [°C]')
axs[0,0].legend()

axs[0,1].plot(time, df['DataInput.T_amb']-273.15, label="$T_{amb}$ [°C]")
axs[0,1].legend()

axs[0,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room']-273.15, label='$T_{Room}$ [°C]')
axs[0,2].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room_set', time, to_celsius=True), label='$T_{Room,set}$ [°C]') 
axs[0,2].legend()

axs[1,0].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.add.y'], label='$\Delta T_{Bor}$ [K]')
axs[1,0].plot(time, value_to_array('tGA_one_zone_simple.PrimaryCircuit.cbm1.deltaT_Bor.y',time), label='$\Delta T_{Bor,set}$ [K]')
axs[1,0].legend()    

axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.T_HP_out_meas"]-273.15, label='$T_{sup}$ [°C]')
axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.heatingCurve_2s.TSupSet"]-273.15, label='$T_{sup,set}$ [°C]')
axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_ret.T"]-273.15, label='$T_{ret}$ [°C]')
axs[1,1].legend()

axs[1,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.port_a.m_flow"], label='$\dot{m}_{radiator}$ [kg/s]')
axs[1,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.ctr_room.control_valve"], label='ctr valve [1]')
axs[1,2].legend()

axs[2,0].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.Control_m_flow'], label='$\dot{m}_{prim}$ [kg/s]')  
axs[2,0].set_xlabel(timeunit)  
axs[2,0].legend()
 
axs[2,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.ctr_HP.PID_HP.y'], label='ctr HeatPump')        
axs[2,1].set_xlabel(timeunit)
axs[2,1].legend()

axs[2,2].plot(time, df["building_one_zone.Q_loss_total"]/1000, label='$\dot{Q}_{loss,building}$ [kW]')
axs[2,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.Q_rad_pos.x_out"]/1000, label='$\dot{Q}_{radiator}$ [kW]')
axs[2,2].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"]/1000, label='$\dot{Q}_{HP}$ [kW]')
axs[2,2].set_xlabel(timeunit)
axs[2,2].legend()    


# Set x-axis limits for all subplots
for ax in axs.flat:
    ax.set_xlim([time[0], time[len(time)-1]])    

# Layout so plots do not overlap
fig.tight_layout()

plt.show()
plt.get_current_fig_manager().window.showMaximized()



fig, axs = plt.subplots(2, 3, sharex=True)
fig.suptitle("miscellaneous")
fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)

axs[0,0].plot(time, df['DataInput.T_amb']-273.15, label="$T_{amb}$ [°C]")
axs[0,0].legend()

axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.port_a.p']/100000, label='$p_{pump,in}$ [bar]')
axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.port_b.p']/100000, label='$p_{pump,out}$ [bar]')
axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.val.port_b.p']/100000, label='$p_{valve,out}$ [bar]')
axs[0,1].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.port_b.p',time, to_bar=True), label='$p_{radiator,out}$ [bar]')
axs[0,1].legend()

axs[0,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room']-273.15, label='$T_{Room}$ [°C]')
axs[0,2].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room_set', time, to_celsius=True), label='$T_{Room,set}$ [°C]') 
axs[0,2].legend()

axs[1,0].plot(time, df["building_one_zone.Q_loss_ground"]/1000, label='$\dot{Q}_{loss,ground}$ [kW]')
axs[1,0].plot(time, df["building_one_zone.Q_loss_roof"]/1000, label='$\dot{Q}_{loss,roof}$ [kW]')
axs[1,0].plot(time, df["building_one_zone.Q_loss_wall"]/1000, label='$\dot{Q}_{loss,walls}$ [kW]')
axs[1,0].plot(time, df["building_one_zone.Q_loss_total"]/1000, label='$\dot{Q}_{loss,total}$ [kW]')
axs[1,0].set_xlabel(timeunit)
axs[1,0].legend()

axs[1,1].plot(time, df["building_one_zone.Q_loss_total"]/1000, label='$\dot{Q}_{loss,building}$ [kW]')
axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.Q_rad_pos.x_out"]/1000, label='$\dot{Q}_{radiator}$ [kW]')
axs[1,1].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"]/1000, label='$\dot{Q}_{HP}$ [kW]')
axs[1,1].set_xlabel(timeunit)
axs[1,1].legend() 

axs[1,2].plot(time, df['building_one_zone.walCap_ground.T']-273.15, label='$T_{baseplate}$ [°C]') 
axs[1,2].plot(time, df['building_one_zone.walCap_wall.T']-273.15, label='$T_{walls}$ [°C]') 
axs[1,2].plot(time, df["building_one_zone.walCap_roof.T"]-273.15, label='$T_{roof}$ [°C]')
axs[1,2].set_xlabel(timeunit)
axs[1,2].legend()

# Set x-axis limits for all subplots
for ax in axs.flat:
    ax.set_xlim([time[0], time[len(time)-1]])    

# Layout so plots do not overlap
fig.tight_layout()
plt.get_current_fig_manager().window.showMaximized()



fig, axs = plt.subplots(2, 3, sharex=True)
fig.suptitle("Heat Pump")
fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)

axs[0,0].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.ctr_HP.PID_HP.y'], label='ctr HeatPump')        
axs[0,0].legend()

axs[0,1].plot(time, df["tGA_one_zone_simple.HeatPump.eva.T"]-273.15, label='$T_{eva}$ [°C]', color ='green')
axs[0,1].plot(time, value_to_array("tGA_one_zone_simple.HeatPump.TEvaMin", time, to_celsius=True), label='$T_{eva,min}$ [°C]', color ='green', linestyle='--')
axs[0,1].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorIn.T"]-273.15, label='$T_{Bor,in}$ [°C]', color = 'blue')
axs[0,1].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorOut.T"]-273.15, label='$T_{source}$ [°C]', color= 'red')
axs[0,1].legend()

axs[0,2].plot(time, df["tGA_one_zone_simple.HeatPump.con.T"]-273.15, label='$T_{con}$ [°C]', color='salmon')
axs[0,2].plot(time, value_to_array("tGA_one_zone_simple.HeatPump.TConMax", time, to_celsius=True) , label='$T_{con,max}$ [°C]', color='salmon', linestyle='--')
axs[0,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_sup.T"]-273.15, label='$T_{sup}$ [°C]', color = 'red')
axs[0,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_ret.T"]-273.15, label='$T_{ret}$ [°C]', color ='blue')
axs[0,2].legend()

axs[1,0].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"]/1000, label='$\dot{Q}_{Condensator}$ [kW]')
axs[1,0].plot(time, df["tGA_one_zone_simple.Q_eva_pos.x_out"]/1000, label='$\dot{Q}_{Evaporator}$ [kW]')
axs[1,0].plot(time, df["tGA_one_zone_simple.HeatPump.P"]/1000, label='$P_{el,HP}$ [kW]')
axs[1,0].set_xlabel(timeunit)
axs[1,0].legend()

axs[1,1].plot(time, np.divide(df["tGA_one_zone_simple.HeatPump.QCon_flow"],df["tGA_one_zone_simple.HeatPump.P"]),label='COP')
axs[1,1].set_xlabel(timeunit)
axs[1,1].legend()

axs[1,2].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.Control_m_flow'], label='$\dot{m}_{prim}$ [kg/s]') 
axs[1,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.m_flow'], label='$\dot{m}_{sec}$ [kg/s]') 
axs[1,2].set_xlabel(timeunit)
axs[1,2].legend()

# Set x-axis limits for all subplots
for ax in axs.flat:
    ax.set_xlim([time[0], time[len(time)-1]])    

# Layout so plots do not overlap
fig.tight_layout()
plt.get_current_fig_manager().window.showMaximized()







fig, axs = plt.subplots(2, 2, sharex=True)
fig.suptitle("Building")
fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)

axs[0,0].plot(time, df['building_one_zone.Q_loss_ground']/1000, label='ground')        
axs[0,0].plot(time, df['building_one_zone.Q_loss_wall']/1000, label='wall')
axs[0,0].plot(time, df['building_one_zone.Q_loss_roof']/1000, label='roof')
axs[0,0].plot(time, df['building_one_zone.Q_loss_total']/1000, label='total')
axs[0,0].set_ylabel("$\dot{Q}_{loss}$ [kW]")
axs[0,0].legend()

axs[0,1].plot(time, df["building_one_zone.walCap_ground.T"]-273.15, label='groundplate')
axs[0,1].plot(time, df["building_one_zone.walCap_wall.T"]-273.15, label='wall')
axs[0,1].plot(time, df["building_one_zone.walCap_roof.T"]-273.15, label='roof')
axs[0,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.heatPortRad.T"]-273.15, label='radiative')
axs[0,1].plot(time, df["building_one_zone.senTemZonAir.T"]-273.15, label='air room')
axs[0,1].set_ylabel("$T$ [°C]")
axs[0,1].legend()

axs[1,0].plot(time, df["building_one_zone.conRes_ground.Q_flow"]/1000, label='groundplate')
axs[1,0].plot(time, df["building_one_zone.conRes_wall.Q_flow"]/1000, label='wall')
axs[1,0].plot(time, df["building_one_zone.conRes_roof.Q_flow"]/1000, label='roof')
axs[1,0].set_xlabel(timeunit)
axs[1,0].set_ylabel("$\dot{Q}_{convective}$ [kW]")
axs[1,0].legend()

axs[1,1].plot(time, df["building_one_zone.heatFlowSensor_rad_ground.Q_flow"]/1000, label='groundplate')
axs[1,1].plot(time, df["building_one_zone.heatFlowSensor_rad_wall.Q_flow"]/1000, label='wall')
axs[1,1].plot(time, df["building_one_zone.heatFlowSensor_rad_roof.Q_flow"]/1000, label='roof')
axs[1,1].set_xlabel(timeunit)
axs[1,1].set_ylabel("$\dot{Q}_{radiative}$ [kW]")
axs[1,1].legend()



# Set x-axis limits for all subplots
for ax in axs.flat:
    ax.set_xlim([time[0], time[len(time)-1]])    

# Layout so plots do not overlap
fig.tight_layout()
plt.get_current_fig_manager().window.showMaximized()
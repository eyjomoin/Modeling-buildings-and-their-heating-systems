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
path_file="C:/Users/AO/AppData/Local/Temp/OpenModelica/OMEdit/FPSS.System.one_zone/one_zone_res.mat"


### by default all plots are disabled
plot_heating_curve=plot_controller=plot_miscellaneous=plot_building=plot_HeatPump=False

### choose your plots
# plot_heating_curve=True
plot_controller=True
plot_miscellaneous=True
plot_building=True
plot_HeatPump=True
show = False

### get the file creation time
timestamp = os.path.getmtime(path_file)
modification_time = datetime.datetime.fromtimestamp(timestamp).strftime('%Y-%m-%d %H:%M:%S')

df = DyMat.DyMatFile(path_file)

# This code is probably terribly inefficient but I wanted an easy way to plot only certain days
# from a complete Modelica simulation. So now we read this time array (containing seconds) and
# use datetime to slice it to the period we care about. 
time = df.abscissa('building_one_zone.Q_loss_ground', valuesOnly=True)

# We present on July 2nd, so I thought looking at that day could be fun
fro = datetime.datetime(2015,1,1)
to = datetime.datetime(2015,12,31)
# convert to how many seconds have passed since the start of that year
fro_sec = int((fro-datetime.datetime(fro.year,1,1)).total_seconds())
to_sec = int((to-datetime.datetime(to.year,1,1)).total_seconds())

# find the index in the time array where this period begins and ends
time_np = np.array(time)
idx1 = np.argmax(time_np >= fro_sec)
idx2 = np.argmax(time_np >= to_sec)
time = time[idx1:idx2] # slice the time. I couldn't figure out how to slice the entire df, 
# so instead in the following, every single df column to be plotted is also sliced between
# [idx1:idx2] which means I clicked Ctrl+V like 60 times. Oh well

# Proceed as before
if timeunit == "minutes":
    time = time / 60
elif timeunit == "hours":
    time = time / 3600


def value_to_array(declaration,time, to_celsius=False, to_bar=False, to_kW=False):
    """
    Values, that are constant over the whole simulation, are saved only once in the .mat file. In order to plot these values we need an array. This function creates an array, that is filled with the value as many times as entries.
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
    


if plot_heating_curve:
    plt.figure()
    plt.title("Heating Curve")
    plt.scatter(df["DataInput.T_amb_mod"][idx1:idx2]-273.15, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.heatingCurve_2s.TSupSet"][idx1:idx2]-273.15,  label='Heating Curve')
    plt.xlabel("$T_{amb}$ [°C]")
    plt.ylabel("$T_{sup}$ [°C]")
    plt.show()



if plot_controller:
    fig, axs = plt.subplots(3, 3, sharex=True)
    fig.suptitle(f"Controller from {fro} to {to}")
    fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)
    
    axs[0,0].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorIn.T"][idx1:idx2]-273.15, label='$T_{Bor,in}$ [°C]')
    axs[0,0].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorOut.T"][idx1:idx2]-273.15, label='$T_{Bor,out}$ [°C]')
    # axs[0,0].set_ylabel('Borehole Temperature [°C]')
    axs[0,0].legend()
    
    axs[0,1].plot(time, df['DataInput.T_amb_mod'][idx1:idx2]-273.15, label="$T_{amb}$ [°C]")
    axs[0,1].legend()
    
    axs[0,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room'][idx1:idx2]-273.15, label='$T_{Room}$ [°C]')
    axs[0,2].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room_set', time, to_celsius=True), label='$T_{Room,set}$ [°C]') 
    axs[0,2].legend()
    
    axs[1,0].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.add.y'][idx1:idx2], label='$\Delta T_{Bor}$ [K]')
    axs[1,0].plot(time, value_to_array('tGA_one_zone_simple.PrimaryCircuit.cbm1.deltaT_Bor.y',time), label='$\Delta T_{Bor,set}$ [K]')
    axs[1,0].legend()    
    
    axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.T_HP_out_meas"][idx1:idx2]-273.15, label='$T_{sup}$ [°C]')
    axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.ctr_HP.heatingCurve_2s.TSupSet"][idx1:idx2]-273.15, label='$T_{sup,set}$ [°C]')
    axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_ret.T"][idx1:idx2]-273.15, label='$T_{ret}$ [°C]')
    axs[1,1].legend()
    
    axs[1,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.port_a.m_flow"][idx1:idx2], label='$\dot{m}_{radiator}$ [kg/s]')
    axs[1,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.ctr_room.control_valve"][idx1:idx2], label='ctr valve [1]')
    axs[1,2].legend()
    
    axs[2,0].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.Control_m_flow'][idx1:idx2], label='$\dot{m}_{prim}$ [kg/s]')  
    axs[2,0].set_xlabel(timeunit)  
    axs[2,0].legend()
     
    axs[2,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.ctr_HP.PID_HP.y'][idx1:idx2], label='ctr HeatPump')        
    axs[2,1].set_xlabel(timeunit)
    axs[2,1].legend()
    
    axs[2,2].plot(time, df["building_one_zone.Q_loss_total"][idx1:idx2]/1000, label='$\dot{Q}_{loss,building}$ [kW]')
    axs[2,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.Q_rad_pos.x_out"][idx1:idx2]/1000, label='$\dot{Q}_{radiator}$ [kW]')
    axs[2,2].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"][idx1:idx2]/1000, label='$\dot{Q}_{HP}$ [kW]')
    axs[2,2].set_xlabel(timeunit)
    axs[2,2].legend()    
    
    # Set x-axis limits for all subplots
    for ax in axs.flat:
        ax.set_xlim([time[0], time[len(time)-1]])    
    
    # Layout so plots do not overlap
    fig.tight_layout()
    fig.set_size_inches(19.2, 10.8)
    plt.draw()
    plt.savefig('controller.png')
    if show:
        plt.show()



if plot_miscellaneous:
    fig, axs = plt.subplots(2, 3, sharex=True)
    fig.suptitle("miscellaneous")
    fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)
    
    axs[0,0].plot(time, df['DataInput.T_amb_mod'][idx1:idx2]-273.15, label="$T_{amb}$ [°C]")
    axs[0,0].legend()
    
    axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.port_a.p'][idx1:idx2]/100000, label='$p_{pump,in}$ [bar]')
    axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.port_b.p'][idx1:idx2]/100000, label='$p_{pump,out}$ [bar]')
    axs[0,1].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.val.port_b.p'][idx1:idx2]/100000, label='$p_{valve,out}$ [bar]')
    axs[0,1].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.port_b.p',time, to_bar=True), label='$p_{radiator,out}$ [bar]')
    axs[0,1].legend()
    
    axs[0,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room'][idx1:idx2]-273.15, label='$T_{Room}$ [°C]')
    axs[0,2].plot(time, value_to_array('tGA_one_zone_simple.SecondaryCircuit.room_tubing.T_room_set', time, to_celsius=True), label='$T_{Room,set}$ [°C]') 
    axs[0,2].legend()
    
    axs[1,0].plot(time, df["building_one_zone.Q_loss_ground"][idx1:idx2]/1000, label='$\dot{Q}_{loss,ground}$ [kW]')
    axs[1,0].plot(time, df["building_one_zone.Q_loss_roof"][idx1:idx2]/1000, label='$\dot{Q}_{loss,roof}$ [kW]')
    axs[1,0].plot(time, df["building_one_zone.Q_loss_wall"][idx1:idx2]/1000, label='$\dot{Q}_{loss,walls}$ [kW]')
    axs[1,0].plot(time, df["building_one_zone.Q_loss_total"][idx1:idx2]/1000, label='$\dot{Q}_{loss,total}$ [kW]')
    axs[1,0].set_xlabel(timeunit)
    axs[1,0].legend()
    
    axs[1,1].plot(time, df["building_one_zone.Q_loss_total"][idx1:idx2]/1000, label='$\dot{Q}_{loss,building}$ [kW]')
    axs[1,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.Q_rad_pos.x_out"][idx1:idx2]/1000, label='$\dot{Q}_{radiator}$ [kW]')
    axs[1,1].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"][idx1:idx2]/1000, label='$\dot{Q}_{HP}$ [kW]')
    axs[1,1].set_xlabel(timeunit)
    axs[1,1].legend() 
    
    axs[1,2].plot(time, df['building_one_zone.ground.Cap.T'][idx1:idx2]-273.15, label='$T_{baseplate}$ [°C]') 
    axs[1,2].plot(time, df['building_one_zone.wall.Cap.T'][idx1:idx2]-273.15, label='$T_{walls}$ [°C]') 
    axs[1,2].plot(time, df["building_one_zone.roof.Cap.T"][idx1:idx2]-273.15, label='$T_{roof}$ [°C]')
    axs[1,2].set_xlabel(timeunit)
    axs[1,2].legend()
    
    # Set x-axis limits for all subplots
    for ax in axs.flat:
        ax.set_xlim([time[0], time[len(time)-1]])    
    
    # Layout so plots do not overlap
    fig.tight_layout()
    fig.set_size_inches(19.2, 10.8)
    plt.draw()
    plt.savefig('misc.png')
    if show: 
        plt.show()


if plot_HeatPump:
    fig, axs = plt.subplots(2, 3, sharex=True)
    fig.suptitle("Heat Pump")
    fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)
    
    axs[0,0].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.ctr_HP.PID_HP.y'][idx1:idx2], label='ctr HeatPump')        
    axs[0,0].legend()
    
    axs[0,1].plot(time, df["tGA_one_zone_simple.HeatPump.eva.T"][idx1:idx2]-273.15, label='$T_{eva}$ [°C]', color ='green')
    axs[0,1].plot(time, value_to_array("tGA_one_zone_simple.HeatPump.TEvaMin", time, to_celsius=True), label='$T_{eva,min}$ [°C]', color ='green', linestyle='--')
    axs[0,1].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorIn.T"][idx1:idx2]-273.15, label='$T_{Bor,in}$ [°C]', color = 'blue')
    axs[0,1].plot(time, df["tGA_one_zone_simple.PrimaryCircuit.TBorOut.T"][idx1:idx2]-273.15, label='$T_{source}$ [°C]', color= 'red')
    axs[0,1].legend()
    
    axs[0,2].plot(time, df["tGA_one_zone_simple.HeatPump.con.T"][idx1:idx2]-273.15, label='$T_{con}$ [°C]', color='salmon')
    axs[0,2].plot(time, value_to_array("tGA_one_zone_simple.HeatPump.TConMax", time, to_celsius=True) , label='$T_{con,max}$ [°C]', color='salmon', linestyle='--')
    axs[0,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_sup.T"][idx1:idx2]-273.15, label='$T_{sup}$ [°C]', color = 'red')
    axs[0,2].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.T_HP_ret.T"][idx1:idx2]-273.15, label='$T_{ret}$ [°C]', color ='blue')
    axs[0,2].legend()
    
    axs[1,0].plot(time, df["tGA_one_zone_simple.HeatPump.QCon_flow"][idx1:idx2]/1000, label='$\dot{Q}_{Condensator}$ [kW]')
    axs[1,0].plot(time, df["tGA_one_zone_simple.Q_eva_pos.x_out"][idx1:idx2]/1000, label='$\dot{Q}_{Evaporator}$ [kW]')
    axs[1,0].plot(time, df["tGA_one_zone_simple.HeatPump.P"][idx1:idx2]/1000, label='$P_{el,HP}$ [kW]')
    axs[1,0].set_xlabel(timeunit)
    axs[1,0].legend()
    
    axs[1,1].plot(time, np.divide(df["tGA_one_zone_simple.HeatPump.QCon_flow"][idx1:idx2],df["tGA_one_zone_simple.HeatPump.P"][idx1:idx2]),label='COP')
    axs[1,1].set_xlabel(timeunit)
    axs[1,1].legend()
    
    axs[1,2].plot(time, df['tGA_one_zone_simple.PrimaryCircuit.cbm1.Control_m_flow'][idx1:idx2], label='$\dot{m}_{prim}$ [kg/s]') 
    axs[1,2].plot(time, df['tGA_one_zone_simple.SecondaryCircuit.pum_HP.m_flow'][idx1:idx2], label='$\dot{m}_{sec}$ [kg/s]') 
    axs[1,2].set_xlabel(timeunit)
    axs[1,2].legend()
    
    # Set x-axis limits for all subplots
    for ax in axs.flat:
        ax.set_xlim([time[0], time[len(time)-1]])    
    
    # Layout so plots do not overlap
    fig.tight_layout()
    fig.set_size_inches(19.2, 10.8)
    plt.draw()
    plt.savefig('hp.png')
    if show: 
        plt.show()




if plot_building:
    fig, axs = plt.subplots(2, 2, sharex=True)
    fig.suptitle("Building")
    fig.text(0.01, 0.01, f'File: {path_file}\nLast Modified: {modification_time}', ha='left', fontsize=8)
    
    axs[0,0].plot(time, df['building_one_zone.Q_loss_ground'][idx1:idx2]/1000, label='ground')        
    axs[0,0].plot(time, df['building_one_zone.Q_loss_wall'][idx1:idx2]/1000, label='wall')
    axs[0,0].plot(time, df['building_one_zone.Q_loss_roof'][idx1:idx2]/1000, label='roof')
    axs[0,0].plot(time, df['building_one_zone.Q_loss_total'][idx1:idx2]/1000, label='total')
    axs[0,0].set_ylabel("$\dot{Q}_{loss}$ [kW]")
    axs[0,0].legend()
    
    axs[0,1].plot(time, df["building_one_zone.ground.Cap.T"][idx1:idx2]-273.15, label='groundplate')
    axs[0,1].plot(time, df["building_one_zone.wall.Cap.T"][idx1:idx2]-273.15, label='wall')
    axs[0,1].plot(time, df["building_one_zone.roof.Cap.T"][idx1:idx2]-273.15, label='roof')
    axs[0,1].plot(time, df["tGA_one_zone_simple.SecondaryCircuit.room_tubing.radiator.heatPortRad.T"][idx1:idx2]-273.15, label='radiative')
    axs[0,1].plot(time, df["building_one_zone.senTemZonAir.T"][idx1:idx2]-273.15, label='air room')
    axs[0,1].set_ylabel("$T$ [°C]")
    axs[0,1].legend()
    
    axs[1,0].plot(time, df["building_one_zone.ground.R_cond_conv_e.port_a.Q_flow"][idx1:idx2]/1000, label='groundplate')
    axs[1,0].plot(time, df["building_one_zone.wall.R_cond_conv_e.port_a.Q_flow"][idx1:idx2]/1000, label='wall')
    axs[1,0].plot(time, df["building_one_zone.roof.R_cond_conv_e.port_a.Q_flow"][idx1:idx2]/1000, label='roof')
    axs[1,0].set_xlabel(timeunit)
    axs[1,0].set_ylabel("$\dot{Q}_{convective}$ [kW] (from air to component)")
    axs[1,0].legend()
    
    axs[1,1].plot(time, df["building_one_zone.ground.res_rad.port_a.Q_flow"][idx1:idx2]/1000, label='groundplate')
    axs[1,1].plot(time, df["building_one_zone.wall.res_rad.port_a.Q_flow"][idx1:idx2]/1000, label='wall')
    axs[1,1].plot(time, df["building_one_zone.roof.res_rad.port_a.Q_flow"][idx1:idx2]/1000, label='roof')
    axs[1,1].set_xlabel(timeunit)
    axs[1,1].set_ylabel("$\dot{Q}_{radiative}$ [kW] (from radiator to component)")
    axs[1,1].legend()
        
    # Set x-axis limits for all subplots
    for ax in axs.flat:
        ax.set_xlim([time[0], time[len(time)-1]])    
    
    # Layout so plots do not overlap
    fig.tight_layout()
    fig.set_size_inches(19.2, 10.8)
    plt.draw()
    plt.savefig('building.png')
    if show: 
        plt.show()
    

# rectangular approximation of energy as integral of power over time, divide by 1000 to get kWh
kWh_used = np.mean(df["tGA_one_zone_simple.HeatPump.P"])/1000*int((to-fro).total_seconds()/3600)

# to scale the energy to the unit kWh per square meter of living area and year (see tabula), 
# divide by the fraction of the year that was simulated and the area in m^2 (see modelica building file)
floor_area = 74
fractionOfYear_simulated = int((to-fro).total_seconds())/(365*24*60*60)
kWh_scaled = kWh_used/(fractionOfYear_simulated*floor_area)

#print("Total kWh used in this period: ", kWh_used)
print("kWh/(m^2*a): ", round(kWh_scaled,2))

# Normalization
lgr = round(sum(df["building_one_zone.Q_loss_ground"][idx1:idx2])/(fractionOfYear_simulated*floor_area),2)
lwa = round(sum(df["building_one_zone.Q_loss_wall"][idx1:idx2])/(fractionOfYear_simulated*floor_area),2)
lwi = round(sum(df["building_one_zone.Q_loss_window"][idx1:idx2])/(fractionOfYear_simulated*floor_area),2)
lro = round(sum(df["building_one_zone.Q_loss_roof"][idx1:idx2])/(fractionOfYear_simulated*floor_area),2)
print(f"[{lgr}, {lwa}, {lwi}, {lro}]")
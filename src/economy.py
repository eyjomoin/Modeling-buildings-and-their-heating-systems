import numpy as np
import matplotlib.pyplot as plt

horizon = 20 # how many years to look at
kWh_heat_demand = 12000 # kWh of heat the building needs regardless of heating system

investment_hp = 20000 # how much to pay for insulation, heat pump etc.
subsidy_hp = 14000 # how much of that is paid for, so you have to pay the difference

euros_per_kWh_elec = 0.3 # 30 cents / kWh seems conservative enough
cop_hp = 4 # common in our simulations
euros_per_kWh_gas = [0.10,0.15] # currently 10 cents, may go up to 15 cents until the end of horizon

# Linear interpolation between the 10 cents and 15 cents
def co2(t):
    return (euros_per_kWh_gas[1]-euros_per_kWh_gas[0])/horizon * t + euros_per_kWh_gas[0]

# For a time array t and given an initial price p0, return the cumulated price of this heating system
def gaspreis(t,p0):
    if type(t) == int:
        t = [t]
    price = [p0]
    for i in range(len(t)):
        if i > 0:                                   # including carbon tax
            price.append(price[i-1] + kWh_heat_demand*co2(t[i]))
    return price

# For a time array t and given an initial price p0, return the cumulated price of this heating system
def strompreis(t,p0):
    if type(t) == int:
        t = [t]
    price = [p0]
    for i in range(len(t)):
        if i > 0:                     # cop scales down the heat demand
            price.append(price[i-1] + kWh_heat_demand*euros_per_kWh_elec/cop_hp)
    return price

# Calculate time series
time = np.arange(0,horizon)
gas = gaspreis(time,0)
elec = strompreis(time,investment_hp-subsidy_hp)

plt.figure()
plt.plot(gas)
plt.plot(elec)
plt.legend(["Gas", "Heat pump"])
plt.title(f"Amortized at {np.where(np.array(gas)>np.array(elec))[0][0]}") # when gas > heat pump
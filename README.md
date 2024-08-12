# Auto-Trasmission-and-Cruise-control


## Project Overview
This project utilizes a Simulink model to simulate and control a car system dynamically. The model incorporates various blocks representing different components of the car's control system, allowing for both open loop and closed loop simulations.

## Features
- **Simulink Model Construction**: Using dynamic laws of the system, the model simulates car behavior with the ability to switch between open loop and closed loop controls.
- **Cruise Control and Gear Shifting**: The model includes a cruise control and automatic/manual gear shifting capabilities controlled through the driver interface.
- **Performance Analysis**: Both open loop and closed loop responses are analyzed, including a detailed acceleration test from 0 to 100 km/h using automatic gear shifting.

## Model Components
1. **Driver Interface**: Manages cruise control settings, velocity adjustments, and gear shifting options.
2. **Controller**: Implements a PI controller to adjust throttle based on velocity errors.
3. **Actuator**: Includes a saturation block to limit the throttle output.
4. **Throttle and Engine**: Calculates torque based on throttle aperture, car velocity, and gear settings.
5. **Gears and Wheels**: Computes the force applied to the vehicle and manages gear shifting.
6. **Disturbance Force**: Accounts for external forces like road slope and aerodynamics.
7. **Body**: Calculates vehicle acceleration and integrates it to derive velocity.

## Simulations
- **Open Loop Response**: Analyzes the system behavior with a step input on the throttle aperture.
- **Closed Loop Response**: Uses cruise control to modulate the car's speed and evaluate system stability and performance.
- **Acceleration Test**: Tests the vehicle's acceleration capabilities using a sophisticated gear shifting strategy to optimize power usage.

## Codes
final.slx is the simulink model on which all the test have been carried out. It is possible to change the configuration by using the driver interface block. Remember to run vehicle_param.m before launching the simulink.

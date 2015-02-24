---
title: Automotive Backup Rollover Prevention System Use Cases
author: 
- name: Rayshawn Holbrook, Erin Hoffman, & Camille Welcher
  affiliation: Michigan State University
date: Feb 24, 2015
...

## Detailed Use Cases

1. Alert Proximity

    Actors

    :   Alert System, Stereo System

    Description

    :    This use case is designed for alerting the driver whether or not an object is detected in range of the back of the vehicle.  The alert system connects to this use case in order to find out when an alert needs to be sounded.  The stereo system connects to this use case in order to find out when to turn off, so the driver will be more likely to hear the alert noise.  It includes the “get range” use case which determines how far away the object is.  Use cases “mute” and “resume” are dependent on this use case because the status of whether or not an alert is happening needs to be known before the alert sounds or turns off.

    Type

    :   Primary

    Includes

    :   Get Range

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   Mute, Resume

2. Display Off 

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

3. Display On 

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

4. Mute

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

5. Resume

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

6. Scan

    Actors

    :    Proxomity Sensor
 
    Description

    :    Turns on the proximity sensor and scans for nearby objects when the vehicle is put into reverse, making the data available on the CAN bus.

    Type

    :   Primary

    Includes

    :   None

    Extends

    :   None

    Cross-refs

    :   1.b.i, 1.b.ii, 1.c.i, 1.c.ii, 1.c.iii, 1.c.iv, 1.c.v

    Use Cases

    :   Get Range, Alert Proximity

7. Sensor Off

    Actors

    :    Proximity Sensor
 
    Description

    :    Turn the proximity sensor off when the vehicle is detected to be in reverse

    Type

    :   Secondary

    Includes

    :   None

    Extends

    :   None

    Cross-refs

    :   1.c.vi

    Use Cases

    :   Alert Proximity

8. Detect Reverse

    Actors

    :    Alert System, Display, Stereo System, Camera, Proximity Sensor
 
    Description

    :    Detects whether the vehicle has been put into reverse by the driver and broadcasts this message over the CAN bus within determined time tolerance.

    Type

    :   Primary

    Includes

    :   None

    Extends

    :   None

    Cross-refs

    :   1.a, 1.c.i, 1.c.vi, 2.b.i, 2.b.iv, 2.d.ii, 2.d.iv, 4.a

    Use Cases

    :   

9. Camera On

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

10. Camera Off

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

11. Get Range

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   

2. Range Error

    Actors

    :    
 
    Description

    :    

    Type

    :   

    Includes

    :   

    Extends

    :   None

    Cross-refs

    :   None

    Use Cases

    :   


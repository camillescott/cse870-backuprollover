---
title: Automotive Backup Rollover Prevention System Requirements
author: 
- name: Rayshawn Holbrook, Erin Hoffman, & Camille Welcher
  affiliation: Michigan State University
date: Feb 9, 2015
abstract: |
    The proposed system will aid vehicle operators in the ability to detect nearby objects while operating the vehicle in reverse. The field of view is dangerously limited while backing up. Thus, the risk of collision with nearby objects is dramatically increased. Such collisions can cause considerable property and liability damages. More importantly, serious injury (often death) can occur when the vehicle comes in contact with humans. This system will take advantage of sonar parking sensors for detecting the distance of nearby objects, and provide in-vehicle audio alerts that vary in intensity based on the distance between the vehicle and the closest nearby object. In addition to the detection and alert functionality, a rear facing backup camera is included to provide additional visibility into the area behind the vehicle. This video feed is displayed via a rear-view mirror monitor, for easy observation. The Backup Rollover Prevention (BRP) system will be expected to be used in "normal" low-speed driving and parking situations. It will not be expected to function during operation over 15 km/h, nor will it be installed in vehicles used for activities such as racing. We also will not expect it to be used in fleet vehicles (police or fire) where reliable close-quarters operation can be critical.

...

## Hardware
Operating requirements and performance requirements dictate that components be consistent with existing automotive architecture, so the various controllers are therefore required to be ECUs connected over a CAN bus.  ECUs, or electronic control units, are embedded computers within modern automotives [b].  They are essentially microcontrollers connected with inputs and outputs.  ECUs broadcast messages over the controller area network, or CAN, bus, which will serve as the network in our system.  For the sake of simplicity, the controller associated with each sensor or output will be referred to as an individual ECU.

Our hardware requirements are a gear shift mechanism, a gear shift ECU, a backup proximity sensor, a backup proximity sensor ECU, an audio alert system, an audio alert system ECU, a stereo system, a stereo system ECU, a camera sensor, a camera sensor ECU, a video display, a video display ECU, and a CAN bus.  Despite this notation, some or all of the specified controller behaviors may be combined into a single added ECU, or integrated into an existing ECU.

The backup proximity sensor must use sonar or a similar technology to detect objects within a field, and provide information about distance from the sensor.  If one sensor is not able to detect distance on its own, then multiple sensors will be used to triangulate.  The audio alert system must be able to make a loud alert sound, and must be separate from any stereo system.  The stereo system must be mutable according to commands issued along the network.  The camera sensor must use a digital camera technology which captures images within range 1-4 (see Quality and Performance: Definitions section for range definitions), which can be transmitted over the network with less than .1 seconds of delay.

## Software

The software requirements for this system also include both functional and non-functional requirements.  The functional requirements include initiating audio alerts and turning off stereo volume based on backup proximity sensor data, displaying a video feed based on camera sensor data, and turning these systems on and off  based on gear shift information.  These requirements fit broadly into two categories, the proximity sensor alert system and the reverse camera system.

### Proximity Alert System

In the proximity sensor alert system, the key components are the gear shift system and ECU, the backup proximity sensor and ECU, the stereo system and ECU, and the alert system and ECU.  The backup proximity ECU should constantly listen for the message from the gear shift ECU that the vehicle is in reverse.  When the vehicle is in reverse, the backup proximity sensor ECU should ensure that the backup proximity sensor is turned on.  When the sensor is turned on, the ECU should compute the distance of the nearest object based on sensor data, and place it into one of 5 ranges. If the distance is in range 1-4, the ECU should broadcast a message along the CAN bus indicating that the stereo system should be muted, as well as a message informing the audio alert system what range level was detected.   If the distance is in range 5, the ECU should broadcast a message to the stereo system to resume its previous volume, and broadcast a message to the audio alert system to stop sounding.  When the vehicle is not in reverse, the backup proximity sensor ECU should ensure that the backup proximity sensor is turned off, broadcast a message to the stereo system to resume its previous volume, and broadcast a message to the audio alert system to stop sounding.  The stereo system ECU and audio alert system ECU should both constantly listen for status updates from the backup proximity sensor ECU.  If the stereo system ECU receives a mute message, it should store its current volume then reduce the volume to 0.  If the stereo system ECU receives a resume message and is currently muted, it should restore its volume to the previously stored level.  Otherwise if the stereo system ECU receives a resume message and is currently not muted, it should ignore the message.   If the audio alert system ECU receives a range 1 message, it should sound continuously, a range 2 message, it should sound for 0.2 seconds every 0.4 seconds, a range 3 message, it should sound for 0.2 seconds every 0.8 seconds, and a range 4 message, it should sound for 0.2 seconds every 1.0 seconds.  All repeated sounds should be based on an internal timer within the audio alert system ECU, so that the sound pattern will not restart when a duplicate range message is received.

### Camera System

In the reverse camera system, the key components are the gear shift system and ECU, the camera sensor and ECU, and the video display and ECU.  The camera ECU should constantly listen for the message from the gear shift ECU that the vehicle is in reverse.  When the vehicle is in reverse, the camera ECU should ensure that the camera is turned on and begin collecting digital video information from the camera.  When digital video information is collected, the camera ECU should convert it into the proper type of packets and broadcast them across the CAN bus to the video display.  When the vehicle is not in reverse, the camera ECU should ensure that the camera sensor is turned off.  The video display ECU should also constantly listen for the message from the gear shift ECU that the vehicle is in reverse.  When the vehicle is in reverse, the video display ECU should ensure that the video display is turned on, and start listening for digital video information packets from the camera ECU.  When digital video information packets are received, the video display ECU should convert them into a format displayable by the video display, and show them on the video display.  When the vehicle is not in reverse, the video display ECU should ensure that the video display is turned off.

## Quality and Performance

### Definitions

We define range 1 to be distance 0 to 1 meter from the rear bumper of the vehicle; range 2 to be 1 to 2 meters; range 3 to be 2 to 3 meters; and range 4 3 to 4 meters. Range 5 comprises distances beyond 4 meters. We choose 4 meters as our maximum distance based on the results of Paine and Henderson [@paine_devices_2001]. A false positive is when the system sounds an alert with no obstacle in range. A false negative is when the system fails to sound an alert when an obstacle is anywhere with the alert range. 

### Proximity Alert System

With reversing shown to be a considerable risk to pedestrians, it is important that these systems be fault tolerant, but also that they operate with reasonable and understood limitations. All states emitted by the proximity ECU shall be subject to error correcting codes (ECC). Messages outside the acceptable list of ranges should result in a dashboard error notification. Messages of range 1 or 2 should always result in an alert message, even if some error state is known; this is because false negatives are unacceptable, but we still aim to reduce false positives in an effort to avoid drivers adapting to alert messages and ignoring them. Proximity sensor response times shall be less than 350ms, as dictated by ISO standards [@iso_transport]. 

It is important that we expect a reasonable level of efficacy, and not give operators the impression that their proximity sensors are fool-proof. Experimentation showed that at 8kph, the speeds at which most backup collisions occur [@young_development_1995], most sonar systems designed for parking could only be expected to prevent 25% of collisions [@glazduri_investigation_2005]. Given the age of this study, and that the sensors were placed for parking and not pedestrian detection, we require our system to achieve a 50% prevent rate under the same laboratory conditions. While this will be an improvement over the previously tested systems, the still-low level of efficacy supports our also including rear cameras.

### Camera System

An important consideration for the camera system is the acceptable lag between shifting into reverse and activation of the viewscreen. Manufacturer comments during NHTSA proceedings suggest reasonable times of 1 to 3 seconds [@nhtsa_rearview]. Given our reliance on the camera system to prevent accidents when proximity sensors fail, we require a maximum 1 second delay between shifting and viewscreen activation. Minimum average mean time between failures for camera subsystem activation should be 3 years in a well-functioning system. 

## References
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
\vspace*{-0.2in}
\noindent

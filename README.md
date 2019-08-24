# Shell scripts for running a kiosk on a headless Raspberry Pi
This is a set of simple bash scripts to display Google Slides messages on a localized TV broadcast system within a nursing home.

## Where does it run?
This runs on a Raspberry Pi, using Raspbian as the operating system.  The scripts are simple bash programs that automatically start when the Pi does, and run 24 hours a day.  

Almost any type of machine and/or operating system can be used for this, as long as it is headless.  All of the user interaction is done through Google, updating the slides as needed.  The scripts simply refresh the browser every half hour to reflect any updates, and restart the browser between 5am and 5:30am due to memory leakage from the Chromium browser.

The output is sent through HDMI to a hardware convertor for the TV broadcast signal.  It is forced into a 720p output due to the limitations of that convertor.  Every TV in the building can receive the output of this kiosk.

## Where this came from...
Much of this scripting came from multiple sources found on the internet as examples of other kiosk systems.

Kudos to those who've supplied examples.  Anyone can use this program for examples of what to do (or not).  It is used 24 hours a day in a production
environment, and is remarkably stable once the restarts where implemented.

## Requirements
While most of the system is standard bash commands, there are a couple of requirements for this implemenation.  Chromium is used as the browser, although Midori was also used at one time.  The package xdotools is used to pass keystrokes to Chromium to force refreshes and shut it down cleanly.  The system is headless, but Chromium is designed for user interaction.

Obviously, some type of window manager is needed.  This system uses the standard Raspbian desktop with LXDE and LightDM.

A Raspberry Pi is used in this case, but a normal desktop pc could also be used.  The kiosk will run without issues on a Pi 3B+, but runs better on a Pi 4B with 2GB of memory.  Chromium is a memory hog and I prefer not to page.  No keyboard is required, as there is no data entry on the headless part.  Access to the Google account to update the slides is, however, required.



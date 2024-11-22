
# IOT Health App

## Overview
This document provides a detailed guide to the IoT-Connected Health App Prototype, an application designed to monitor and track the user's health data using Internet of Things (IoT) devices. The app collects vital health information such as heart rate, temperature, step count, and more, through connected wearable devices or sensors. This data is then analyzed to provide insights into the user’s health status and can be used for preventative care, fitness tracking, and early detection of health issues.

## Features
Health Monitoring: Track heart rate, temperature, steps, sleep, and other vital metrics.
Real-Time Sync: Data is synced instantly from IoT devices to the app.
Notifications: Get alerts for abnormal readings (e.g., high heart rate or temperature spikes).
Historical Data: View trends over time to track your health progress.
User Profiles: Save personal health data for customized recommendations.
Wearable Integration: Works with popular smartwatches and fitness trackers.
## System Requirements
Mobile Device: Android or iOS smartphone with Bluetooth.
IoT Devices: Compatible wearables (listed below).

## Functionality
- BLE/Wi-Fi Simulation: The app performs well in handling Bluetooth Low Energy (BLE) and Wi-Fi connections. It simulates device communication by securely syncing real-time health data over BLE (Bluetooth) or Wi-Fi depending on the device.
- Real-Time Data Syncing: The app efficiently manages the continuous flow of data from connected devices. It ensures that health metrics are updated in real time, providing users with instant feedback on their health status. This is achieved through seamless integration with BLE and Wi-Fi technology for quick and reliable data transmission.

## Operating System:
- Android 5.0 or higher
- iOS 10.0 or higher

## Usage
- Connect IoT Devices: Go to the "Devices" section and follow the instructions to pair your wearable via Bluetooth.
- Start Monitoring: Once connected, data will start syncing and you can view real-time metrics.

## Main Features:
- Dashboard: See your current health metrics like heart rate, temperature, and steps.
- Health Insights: Tap any metric for a detailed breakdown and trends.
- Notifications: Alerts will pop up if any readings are outside normal ranges.
- Settings: Customize preferences like temperature units or update your profile.

## Architecture
- Frontend (Mobile App): Built with Flutter and Dart for both Android and iOS platforms. Displays data and interacts with IoT devices.
- IoT Devices: Devices connect via Bluetooth to transmit real-time health data.

## Data Flow:
- Health data is collected by the IoT device.
- Data is sent to the app via Bluetooth.
- The app syncs with the cloud server for analysis.
- Insights and notifications are shown to the user.

## Supported Devices
- Smartwatches: Apple Watch, Samsung Galaxy Watch
- Fitness Bands: Fitbit, Garmin, etc.
- Other Devices: Smart Thermometers, Heart Rate Monitors, Sleep Trackers,etc.

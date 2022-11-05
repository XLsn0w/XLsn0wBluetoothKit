//
//  CBUUID+Additions.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "CBUUID+Additions.h"

@implementation CBUUID (Additions)
/**
 Obtain the UUID name
 If the UUID is the standard service UUID return the standard name
 If not, return the UUIDString as the name.
 */
-(NSString *)name {
    if ([self isEqual:LBStandardServiceUUIDGenericAccess]){
        return @"Generic Access";
    } else if ([self isEqual: LBStandardServiceUUIDGenericAttribute]){
        return @"Generic Attribute";
    } else if ([self isEqual: LBStandardServiceUUIDImmediateAlert]){
        return @"Immediate Alert";
    } else if ([self isEqual: LBStandardServiceUUIDLinkLoss]){
        return @"Link Loss";
    } else if ([self isEqual: LBStandardServiceUUIDTxPower]){
        return @"Tx Power";
    } else if ([self isEqual: LBStandardServiceUUIDCurrentTimeService]){
        return @"Current Time Service";
    } else if ([self isEqual: LBStandardServiceUUIDReferenceTimeUpdateService]){
        return @"Reference Time Update Service";
    } else if ([self isEqual: LBStandardServiceUUIDNextDSTChangeService]){
        return @"Next DST Change Service";
    } else if ([self isEqual: LBStandardServiceUUIDGlucose]){
        return @"Glucose";
    } else if ([self isEqual: LBStandardServiceUUIDHealthThermometer]){
        return @"Health Thermometer";
    } else if ([self isEqual:LBStandardServiceUUIDDeviceInformation]){
        return @"Device Information";
    } else if ([self isEqual: LBStandardServiceUUIDHeartRate]){
        return @"Heart Rate";
    } else if ([self isEqual: LBStandardServiceUUIDPhoneAlertStatusService]){
        return @"Phone Alert Status Service";
    } else if ([self isEqual: LBStandardServiceUUIDBatterService]){
        return @"Batter Service";
    } else if ([self isEqual: LBStandardServiceUUIDBloodPressure]){
        return @"Blood Pressure";
    } else if ([self isEqual: LBStandardServiceUUIDAlertNotification]){
        return @"Alert Notification";
    } else if ([self isEqual: LBStandardServiceUUIDHumanInterfaceDevice]){
        return @"Human Interface Device";
    } else if ([self isEqual: LBStandardServiceUUIDScanParameters]){
        return @"Scan Parameters";
    } else if ([self isEqual: LBStandardServiceUUIDRunningSpeedAndCadence]){
        return @"Running Speed And Cadence";
    } else if ([self isEqual: LBStandardServiceUUIDAutomationIO]){
        return @"Automation IO";
    } else if ([self isEqual: LBStandardServiceUUIDCyclingSpeedAndCadence]){
        return @"Cycling Speed And Cadence";
    } else if ([self isEqual: LBStandardServiceUUIDCyclingPower]){
        return @"Cycling Power";
    } else if ([self isEqual: LBStandardServiceUUIDLocationAndNavigation]){
        return @"Location And Navigation";
    } else if ([self isEqual: LBStandardServiceUUIDEnvironmentalSensing]){
        return @"Environmental Sensing";
    } else if ([self isEqual: LBStandardServiceUUIDBodyComposition]){
        return @"Body Composition";
    } else if ([self isEqual: LBStandardServiceUUIDUserData]){
        return @"User Data";
    } else if ([self isEqual: LBStandardServiceUUIDWeightScale]){
        return @"Weight Scale";
    } else if ([self isEqual: LBStandardServiceUUIDBondManagement]){
        return @"Bond Management";
    } else if ([self isEqual: LBStandardServiceUUIDContinuousGlucoseMonitoring]){
        return @"Continuous Glucose Monitoring";
    } else if ([self isEqual: LBStandardServiceUUIDInternetProtocolSupport]){
        return @"Internet Protocol Support";
    } else if ([self isEqual: LBStandardServiceUUIDIndoorPositioning]){
        return @"Indoor Positioning";
    } else if ([self isEqual: LBStandardServiceUUIDPulseOximeter]){
        return @"Pulse Oximeter";
    } else if ([self isEqual: LBStandardServiceUUIDHttpProxy]){
        return @"Http Proxy";
    } else if ([self isEqual: LBStandardServiceUUIDTransportDiscovery]){
        return @"Transport Discovery";
    } else if ([self isEqual: LBStandardServiceUUIDObjectTransfer]){
        return @"Object Transfer";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDeviceName]){
        return @"Device Name";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAppearance]){
        return @"Appearance";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPeripheralPrivacyFlag]){
        return @"Peripheral Privacy Flag";
    } else if ([self isEqual: LBStandardCharacteristicUUIDReconnectionAddress]){
        return @"Reconnection Address";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPeripheralPreferredConnectionParameters]){
        return @"Peripheral Preferred Connection Parameters";
    } else if ([self isEqual: LBStandardCharacteristicUUIDServiceChanged]){
        return @"Service Changed";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAlertLevel]){
        return @"Alert Level";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTxPowerLevel]){
        return @"Tx Power Level";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDateTime]){
        return @"Date Time";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDayOfWeek]){
        return @"Day Of Week";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDayDateTime]){
        return @"Day Date Time";
    } else if ([self isEqual: LBStandardCharacteristicUUIDExactTime256]){
        return @"Exact Time 256";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDSTOffset]){
        return @"DST Offset";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeZone]){
        return @"Time Zone";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLocalTimeInformation]){
        return @"Local Time Information";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeWithDST]){
        return @"Time With DST";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeAccuracy]){
        return @"Time Accuracy";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeSource]){
        return @"Time Source";
    } else if ([self isEqual: LBStandardCharacteristicUUIDReferenceTimeInformation]){
        return @"Reference Time Information";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeUpdateControlPoint]){
        return @"Time Update Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTimeUpdateState]){
        return @"Time Update State";
    } else if ([self isEqual: LBStandardCharacteristicUUIDGlucoseMeasurement]){
        return @"Glucose Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBatteryLevel]){
        return @"Battery Level";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTemperatureMeasurement]){
        return @"Temperature Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTemperatureType]){
        return @"Temperature Type";
    } else if ([self isEqual: LBStandardCharacteristicUUIDIntermediateTemperature]){
        return @"Intermediate Temperature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDMeasurementInterval]){
        return @"Measurement Interval";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBootKeyboardInputReport]){
        return @"Boot Keyboard Input Report";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSystemID]){
        return @"System ID";
    } else if ([self isEqual: LBStandardCharacteristicUUIDModelNumberString]){
        return @"Model Number String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSerialNumberString]){
        return @"Serial Number String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFirmwareRevisionString]){
        return @"Firmware Revision String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHardwareRevisionString]){
        return @"Hardware Revision String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSoftwareRevisionString]){
        return @"Software Revision String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDManufacturerNameString]){
        return @"Manufacturer Name String";
    } else if ([self isEqual: LBStandardCharacteristicUUIDIEEE11073_20601RegulatoryCertificationDataList]){
        return @"IEEE11073-20601 Regulatory Certification Data List";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCurrentTime]){
        return @"Current Time";
    } else if ([self isEqual: LBStandardCharacteristicUUIDMagneticDeclination]){
        return @"Magnetic Declination";
    } else if ([self isEqual: LBStandardCharacteristicUUIDScanRefresh]){
        return @"Scan Refresh";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBootKeyboardOutputReport]){
        return @"Boot Keyboard Output Report";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBootMouseInputReport]){
        return @"Boot Mouse Input Report";
    } else if ([self isEqual: LBStandardCharacteristicUUIDGlucoseMeasurementContext]){
        return @"Glucose Measurement Context";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBloodPressureMeasurement]){
        return @"Blood Pressure Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDIntermediateCuffPressure]){
        return @"Intermediate Cuff Pressure";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHeartRateMeasurement]){
        return @"Heart Rate Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBodySensorLocation]){
        return @"Body Sensor Location";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHeartRateControlPoint]){
        return @"Heart Rate Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAlertStatus]){
        return @"Alert Status";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRingerControlPoint]){
        return @"Ringer Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRingerSetting]){
        return @"Ringer Setting";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAlertCategoryIDBitMask]){
        return @"Alert Category ID Bit Mask";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAlertCategoryID]){
        return @"Alert Category ID";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAlertNotificationControlPoint]){
        return @"Alert Notification Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDUnreadAlertStatus]){
        return @"Unread Alert Status";
    } else if ([self isEqual: LBStandardCharacteristicUUIDNewAlert]){
        return @"New Alert";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSupportedNewAlertCategory]){
        return @"Supported New Alert Category";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSupportedUnreadAlertCategory]){
        return @"Supported Unread Alert Category";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBloodPressureFeature]){
        return @"Blood Pressure Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHIDInformation]){
        return @"HID Information";
    } else if ([self isEqual: LBStandardCharacteristicUUIDReportMap]){
        return @"Report Map";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHIDControlPoint]){
        return @"HID Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDReport]){
        return @"Report";
    } else if ([self isEqual: LBStandardCharacteristicUUIDProtocolMode]){
        return @"Protocol Mode";
    } else if ([self isEqual: LBStandardCharacteristicUUIDScanIntervalWindow]){
        return @"Scan Interval Window";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPnPID]){
        return @"Pn PID";
    } else if ([self isEqual: LBStandardCharacteristicUUIDGlucoseFeature]){
        return @"Glucose Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRecordAccessControlPoint]){
        return @"Record Access Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRSCMeasurement]){
        return @"RSC Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRSCFeature]){
        return @"RSC Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSCControlPoint]){
        return @"SC Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDigital]){
        return @"Digital";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAnalog]){
        return @"Analog";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAggregate]){
        return @"Aggregate";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCSCMeasurement]){
        return @"CSC Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCSCFeature]){
        return @"CSC Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSensorLocation]){
        return @"Sensor Location";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPLXSpot_CheckMeasurement]){
        return @"PLX Spot-Check Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPLXContinuousMeasurement]){
        return @"PLX Continuous Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPLXFeatures]){
        return @"PLX Features";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCyclingPowerMeasurement]){
        return @"Cycling Power Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCyclingPowerVector]){
        return @"Cycling Power Vector";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCyclingPowerFeature]){
        return @"Cycling Power Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCyclingPowerControlPoint]){
        return @"Cycling Power Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLocationAndSpeed]){
        return @"Location AndSpeed";
    } else if ([self isEqual: LBStandardCharacteristicUUIDNavigation]){
        return @"Navigation";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPositionQuality]){
        return @"Position Quality";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLNFeature]){
        return @"LN Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLNControlPoint]){
        return @"LN Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDElevation]){
        return @"Elevation";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPressure]){
        return @"Pressure";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTemperature]){
        return @"Temperature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHumidity]){
        return @"Humidity";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTrueWindSpeed]){
        return @"True Wind Speed";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTrueWindDirection]){
        return @"True Wind Direction";
    } else if ([self isEqual: LBStandardCharacteristicUUIDApparentWindSpeed]){
        return @"Apparent Wind Speed";
    } else if ([self isEqual: LBStandardCharacteristicUUIDApparentWindDirection]){
        return @"Apparent Wind Direction";
    } else if ([self isEqual: LBStandardCharacteristicUUIDGustFactor]){
        return @"Gust Factor";
    } else if ([self isEqual: LBStandardCharacteristicUUIDPollenConcentration]){
        return @"Pollen Concentration";
    } else if ([self isEqual: LBStandardCharacteristicUUIDUVIndex]){
        return @"UVIndex";
    } else if ([self isEqual: LBStandardCharacteristicUUIDIrradiance]){
        return @"Irradiance";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRainfall]){
        return @"Rainfall";
    } else if ([self isEqual: LBStandardCharacteristicUUIDWindChill]){
        return @"Wind Chill";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHeatIndex]){
        return @"Heat Index";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDewPoint]){
        return @"Dew Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDescriptorValueChanged]){
        return @"Descriptor Value Changed";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAerobicHeartRateLowerLimit]){
        return @"Aerobic Heart Rate Lower Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAerobicThreshold]){
        return @"Aerobic Threshold";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAge]){
        return @"Age";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAnaerobicHeartRateLowerLimit]){
        return @"Anaerobic Heart Rate Lower Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAnaerobicHeartRateUpperLimit]){
        return @"Anaerobic Heart Rate Upper Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAnaerobicThreshold]){
        return @"Anaerobic Threshold";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAerobicHeartRateUpperLimit]){
        return @"Aerobic Heart Rate Upper Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDateOfBirth]){
        return @"Date Of Birth";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDateOfThresholdAssessment]){
        return @"Date Of Threshold Assessment";
    } else if ([self isEqual: LBStandardCharacteristicUUIDEmailAddress]){
        return @"Email Address";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFatHeartRateLowerLimit]){
        return @"Fat Heart Rate Lower Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFatBurnHeartRateUpperLimit]){
        return @"Fat Burn Heart Rate Upper Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFirstName]){
        return @"First Name";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFiveZoneHeartRateLimits]){
        return @"Five Zone Heart Rate Limits";
    } else if ([self isEqual: LBStandardCharacteristicUUIDGender]){
        return @"Gender";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHeartRateMax]){
        return @"Heart Rate Max";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHeight]){
        return @"Height";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHipCircumference]){
        return @"Hip Circumference";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLastName]){
        return @"Last Name";
    } else if ([self isEqual: LBStandardCharacteristicUUIDMaximumRecommendedHeartRate]){
        return @"Maximum Recommended HeartRate";
    } else if ([self isEqual: LBStandardCharacteristicUUIDRestingHeartRate]){
        return @"Resting Heart Rate";
    } else if ([self isEqual: LBStandardCharacteristicUUIDSportTypeforAerobicandAnaerobicThresholds]){
        return @"Sport Type for Aerobicand Anaerobic Thresholds";
    } else if ([self isEqual: LBStandardCharacteristicUUIDThreeZoneHeartRateLimits]){
        return @"Three Zone Heart Rate Limits";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTwoZoneHeartRateLimit]){
        return @"Two Zone Heart Rate Limit";
    } else if ([self isEqual: LBStandardCharacteristicUUIDVO2Max]){
        return @"VO2Max";
    } else if ([self isEqual: LBStandardCharacteristicUUIDWaistCircumference]){
        return @"Waist Circumference";
    } else if ([self isEqual: LBStandardCharacteristicUUIDWeight]){
        return @"Weight";
    } else if ([self isEqual: LBStandardCharacteristicUUIDDatabaseChangeIncrement]){
        return @"Database Change Increment";
    } else if ([self isEqual: LBStandardCharacteristicUUIDUserIndex]){
        return @"User Index";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBodyCompositionFeature]){
        return @"Body Composition Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBodyCompositionMeasurement]){
        return @"Body Composition Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDWeightMeasurement]){
        return @"Weight Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDWeightScaleFeature]){
        return @"Weight Scale Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDUserControlPoint]){
        return @"User Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDMagneticFluxDensity2D]){
        return @"Magnetic Flux Density 2D";
    } else if ([self isEqual: LBStandardCharacteristicUUIDMagneticFluxDensity3D]){
        return @"Magnetic Flux Density 3D";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLanguage]){
        return @"Language";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBarometricPressureTrend]){
        return @"Barometric Pressure Trend";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBondManagementControlPoint]){
        return @"Bond Management Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDBondManagementFeature]){
        return @"Bond Management Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCentralAddressResolution]){
        return @"Central Address Resolution";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMMeasurement]){
        return @"CGM Measurement";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMFeature]){
        return @"CGM Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMStatus]){
        return @"CGM Status";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMSessionStartTime]){
        return @"CGM Session Start Time";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMSessionRunTime]){
        return @"CGM Session Run Time";
    } else if ([self isEqual: LBStandardCharacteristicUUIDCGMSpecificOpsControlPoint]){
        return @"CGM Specific Ops Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDIndoorPositioningConfiguration]){
        return @"Indoor Positioning Configuration";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLatitude]){
        return @"Latitude";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLongitude]){
        return @"Longitude";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLocalNorthCoordinate]){
        return @"Local North Coordinate";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLocalEastCoordinate]){
        return @"Local East Coordinate";
    } else if ([self isEqual: LBStandardCharacteristicUUIDFloorNumber]){
        return @"Floor Number";
    } else if ([self isEqual: LBStandardCharacteristicUUIDAltitude]){
        return @"Altitude";
    } else if ([self isEqual: LBStandardCharacteristicUUIDUncertainty]){
        return @"Uncertainty";
    } else if ([self isEqual: LBStandardCharacteristicUUIDLocationName]){
        return @"Location Name";
    } else if ([self isEqual: LBStandardCharacteristicUUIDURI]){
        return @"URI";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHTTPHeaders]){
        return @"HTTP Headers";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHTTPStatusCode]){
        return @"HTTP StatusCode";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHTTPEntityBody]){
        return @"HTTP EntityBody";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHTTPControlPoint]){
        return @"HTTP ControlPoint";
    } else if ([self isEqual: LBStandardCharacteristicUUIDHTTPSSecurity]){
        return @"HTTPS Security";
    } else if ([self isEqual: LBStandardCharacteristicUUIDTDSControlPoint]){
        return @"TDS Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDOTSFeature]){
        return @"OTS Feature";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectName]){
        return @"Object Name";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectType]){
        return @"ObjectType";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectSize]){
        return @"Object Size";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectFirst_Created]){
        return @"Object First-Created";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectLast_Modified]){
        return @"Object Last-Modified";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectID]){
        return @"Object ID";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectProperties]){
        return @"Object Properties";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectActionControlPoint]){
        return @"Object Action Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectListControlPoint]){
        return @"ObjectList Control Point";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectListFilter]){
        return @"Object List Filter";
    } else if ([self isEqual: LBStandardCharacteristicUUIDObjectChanged]){
        return @"Object Changed";
    }
    return @"";

}
@end

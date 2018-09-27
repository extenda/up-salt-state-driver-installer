jposPaths:
  propertiesUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpospaths.properties'
jposEntries:
  xmlUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpos-entries/merged.xml'
system:
  propertiesUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/system.properties'
hardwareLayers:
  - layer: scanner
    port: usb
    jposLogicalName: datalogic-gm4100
  - layer: printer
    port: usb
    jposLogicalName: epson-t88v
  - layer: scanner2
    port: usb
    jposLogicalName: datalogic-mg3300
drivers:
  - packageName: datalogic
    version: 1.0.0
    driverUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/drivers/Datalogic_setup.jar'
  - packageName: epson
    version: 1.0.0
    driverUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/drivers/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz'

jposPaths:
  propertiesUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpospaths.properties'
jposEntries:
  - xmlUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpos-entries/datalogic-mg3300.xml'
  - xmlUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpos-entries/datalogic-gm4100.xml'
  - xmlUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/jpos-entries/epson-t88v.xml'
system:
  propertiesUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/system.properties'
hardwareLayers:
  - layerName: scanner
    jposLogicalName: datalogic-gm4100
  - layerName: printer
    jposLogicalName: epson-t88v
  - layerName: scanner2
    jposLogicalName: datalogic-mg3300
drivers:
  - packageName: datalogic
    driverUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/drivers/Datalogic_setup.jar'
  - packageName: epson
    driverUrl: 'https://s3-eu-west-1.amazonaws.com/fleetmanager-mock-bucket-6qmnqqjjmfql-bucket-7ods0lg532u8/upload/drivers/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz'

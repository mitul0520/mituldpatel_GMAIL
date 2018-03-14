public with sharing class TestAddressValidation2 {

public static GP_ProcessReturn.ProcessTagResponse processTag(){
	GP_ProcessReturn.GPSOA_Shipment_FedEx_ProcessTag_WS_ProcessTag_Port ProcessTagPort =
	     new GP_ProcessReturn.GPSOA_Shipment_FedEx_ProcessTag_WS_ProcessTag_Port();

	GP_ProcessReturn.ProcessTagRequest processTagRequest = new GP_ProcessReturn.ProcessTagRequest();
	
	processTagRequest.RequestedShipment =  new GP_ProcessReturn.RequestedShipment ();
	processTagRequest.RequestedShipment.ShipTimestamp =  DateTime.now();
	processTagRequest.RequestedShipment.DropoffType = 'REQUEST_COURIER';
	processTagRequest.RequestedShipment.ServiceType ='FEDEX_GROUND';
	processTagRequest.RequestedShipment.PackagingType='YOUR_PACKAGING';
	
	GP_ProcessReturn.Party shipper = new GP_ProcessReturn.Party();
	GP_ProcessReturn.Contact shipperContact = new GP_ProcessReturn.Contact();
	shipperContact.PersonName = 'TEST1';
	shipperContact.CompanyName = 'CompanyName';
	shipperContact.PagerNumber = '8005551212';
	shipper.Contact = shipperContact;
	
	GP_ProcessReturn.Address shipperAddress = new GP_ProcessReturn.Address();
	shipperAddress.StreetLines = new List<String>();
	shipperAddress.StreetLines.add('123 DO NOT SHIP LANE');
	shipperAddress.City='COLLIERVILLE';
	shipperAddress.StateOrProvinceCode='TN';
	shipperAddress.PostalCode = '38017';
	
	shipper.Address = shipperAddress;
	
	processTagRequest.RequestedShipment.Shipper = shipper;
	
	
	return ProcessTagPort.ProcessTag(processTagRequest); 

}
	
public static GP_FedExAddressValidation_3.AddressValidationOutput validateAddress(){
		GP_FedExAddressValidation_3.GPSOA_Shipment_FedEx_ValidateAddress_WS_ValidateAddress_Port ValidateAddress_Port = 
				new GP_FedExAddressValidation_3.GPSOA_Shipment_FedEx_ValidateAddress_WS_ValidateAddress_Port();
		
		
		
		GP_FedExAddressValidation_3.AddressValidationInput inAddress = new GP_FedExAddressValidation_3.AddressValidationInput();
		
		
		inAddress.AddressesToValidate = new List<GP_FedExAddressValidation_3.AddressToValidate>();
		
		GP_FedExAddressValidation_3.AddressToValidate testAddrToValidate = new GP_FedExAddressValidation_3.AddressToValidate();
		testAddrToValidate.Address = new GP_FedExAddressValidation_3.Address();
		testAddrToValidate.Address.City = 'Atlanta';
		testAddrToValidate.Address.StateOrProvinceCode = 'GA';
		testAddrToValidate.Address.PostalCode = '30324';
		testAddrToValidate.Address.StreetLines = new List<String>();
		testAddrToValidate.Address.StreetLines.add('133 Peachtree St');
		testAddrToValidate.Address.Residential = false;
		
		inAddress.AddressesToValidate.add(testAddrToValidate);
		
		inAddress.Options = new GP_FedExAddressValidation_3.AddressValidationOptions();
		
		inAddress.Options.CheckResidentialStatus = false;
		
		
		return ValidateAddress_Port.ValidateAddress(inAddress);
		
	}
}
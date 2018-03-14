public with sharing class TestAddressValidation {
	
	public static GP_AddressValidation.AddressValidationOutput2 validateAddress(){
		GP_AddressValidation.GPSOA_Shipment_FedEx_ValidateAddress_WS_ValidateAddress_Port ValidateAddress_Port = 
				new GP_AddressValidation.GPSOA_Shipment_FedEx_ValidateAddress_WS_ValidateAddress_Port();
		
		
		GP_AddressValidation.AddressValidationInput2 inAddress = new GP_AddressValidation.AddressValidationInput2();
		
		inAddress.AddressToValidate = new GP_FedExAddressValidation.AddressToValidate();
		inAddress.AddressToValidate.Address = new GP_FedExAddressValidation.Address();
		inAddress.AddressToValidate.Address.City = 'Atlanta';
		inAddress.AddressToValidate.Address.StateOrProvinceCode = 'GA';
		inAddress.AddressToValidate.Address.StreetLines = new List<String>();
		inAddress.AddressToValidate.Address.StreetLines.add('133 PeachStreet');
		inAddress.AddressToValidate.Address.Residential = false;
		
		inAddress.Options.CheckResidentialStatus = false;
		
		
		return ValidateAddress_Port.ValidateAddress(inAddress);
		
	}

}
public with sharing class TestGetBalance {


//----------------------------------------------------------------------------------------------------------
  // Get Balance WS Response
  //----------------------------------------------------------------------------------------------------------
  public static GP_GetBalance2.BalanceResponse getBalance(){
    GP_GetBalance2.GPSOA_SalesOrder_OP5_Samples_Balance_WS_GetBalance_Port wsObj = new GP_GetBalance2.GPSOA_SalesOrder_OP5_Samples_Balance_WS_GetBalance_Port();
    GP_GetBalance2.BalanceRequest balanceRequest = new GP_GetBalance2.BalanceRequest();
    
    balanceRequest.GPUsername = 'gpnet\\ldubois';
    GP_GetBalance2.BalanceResponse resp = wsObj.GetBalance2(balanceRequest);
    return resp;
  }
  
//Test Get Inventory
public static tempuriOrg.InventoryResponse requestInventory(String sku){
	
    gplvap031SrvGapacComGpsoaSalesorder.GPSOA_SalesOrder_OP5_Samples_Inventory_WS_GetInventory_Port inv = 
    		new gplvap031SrvGapacComGpsoaSalesorder.GPSOA_SalesOrder_OP5_Samples_Inventory_WS_GetInventory_Port();
    gplvap031SrvGapacComGpsoaSalesorder.GetInventory invReqObj = new gplvap031SrvGapacComGpsoaSalesorder.GetInventory();
    
    invReqObj.ITEMS = new List<gplvap031SrvGapacComGpsoaSalesorder.ITEMS>();
    //Create List Of Items
    gplvap031SrvGapacComGpsoaSalesorder.ITEMS itm = new gplvap031SrvGapacComGpsoaSalesorder.ITEMS();
    itm.ITEM = new List<gplvap031SrvGapacComGpsoaSalesorder.ITEM>();
    itm.ITEM.add(new gplvap031SrvGapacComGpsoaSalesorder.ITEM());
    itm.ITEM[0].SKU = sku;
    invReqObj.ITEMS.add(itm);
    
    tempuriOrg.InventoryResponse res = inv.GetInventory(invReqObj);
    
    return res;
  }

}
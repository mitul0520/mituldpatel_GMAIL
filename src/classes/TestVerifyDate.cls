@isTest
public class TestVerifyDate {

    	@isTest
        static  void TestDateWithin30Days() {
            //within 30
            Date date1 = Date.newInstance(2015, 10, 30);
            Date date2 = Date.newInstance(2015, 11, 05);
           
            Date resultDate = VerifyDate.CheckDates(date1, date2);
            System.assertEquals(resultDate, date2);
            
        }
    
    	@isTest
    	static  void TesSetEndOfMonthDate() {
            //within 30
            Date date1 = Date.newInstance(2015, 10, 30);
            Date date2 = Date.newInstance(2015, 12, 05);
            Date endOfMonthDate = Date.newInstance(2015, 10, 31);
           
            Date resultDate = VerifyDate.CheckDates(date1, date2);
            System.assertEquals(resultDate, endOfMonthDate);
            
        }
}
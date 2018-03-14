public class TimeTimeZone {
    public Integer inHour { get; set; }
    
    public Date dt {get; set;}
    public DateTime outDate {get; set;}
    public String outDateString {get; set;}
    public String outDateString2 {get; set;}
    public String userTimezone {get; set;}
    
    public PageReference getTime(){
        
        outDate = DateTime.newInstanceGmt
            (dt.year(), dt.month(), dt.day(), inHour, 0, 0);
        
        String yearGMT = String.valueOf(outDate.yearGmt());

        String monthGMT = String.valueOf(outDate.monthGmt());
        String dateGMT = String.valueOf(outDate.monthGmt());
        String hourGMT = String.valueOf(outDate.hourGmt());
        String minGMT = String.valueOf(outDate.minuteGmt());
        
        outDateString = outDate.format('yyyy-MM-dd\'T\'hh:mm:ss') + '-05:00';
        
        //outDateString2 = outDate.format('yyyy-MM-dd');
        //outDateString2 = outDateString2 + 'T'+hourGMT+':'+minGMT+':00-00:00';

        //outDateString2 = yearGMT+'-'+monthGMT+'-'+dateGMT+'T'
        //    +HourGMT+':'+ minGMT+':00-00:00';
        //outDateString2 = String.valueOfGmt(dt)+'-00:00';
         outDateString2 = outDate.formatGmt('yyyy-MM-dd\'T\'HH:mm:ss') + '-00:00';
             
        return null;
    }
    
    public TimeTimeZone(){
        dt = Date.today();
        inHour = 12;
        userTimezone = UserInfo.getTimeZone().toString();
    }
    
}
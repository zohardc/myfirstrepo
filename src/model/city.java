package model;
//pojo
public class city {
	
	private int rid;
    public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}

	private String cityName;
    
    
   
    public String getCityName() {
        return cityName;
    }
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
        
    @Override
    public String toString() {
        return "City [cityid=]" + rid + ", cityName=" + cityName + "]";
    }


}

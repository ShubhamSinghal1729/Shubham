public class ParkLocator {
    public static String[] country(String countryvalue) {
        ParkService.ParksImplPort calculator = new ParkService.ParksImplPort();
        return calculator.byCountry(countryvalue);
    }
}
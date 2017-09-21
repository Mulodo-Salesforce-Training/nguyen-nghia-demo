public class StringArrayTest {
    public static List<String> generateStringArray (Integer testNum) {
        List<String> outputStrings = new List<String>();
        for(Integer i=0; i < testNum; i++) {
            outputStrings.add('Test ' + i);
        }
        
        return outputStrings;
    }
}
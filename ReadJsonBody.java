package support;

public class ReadJsonBody {
    public static String create_json_body_for_job_call(String id, String name) {
        String flag = null;
        try{
            flag = "{\n" +
                    "          \"id\": \""+id+"\",\n" +
                    "          \"category\": {\n" +
                    "              \"id\": 0,\n" +
                    "              \"name\": \"string\"\n" +
                    "          },\n" +
                    "          \"name\": \""+name+"\",\n" +
                    "          \"photoUrls\": [\n" +
                    "              \"string\"\n" +
                    "          ],\n" +
                    "          \"tags\": [\n" +
                    "              {\n" +
                    "                  \"id\": 0,\n" +
                    "                  \"name\": \"string\"\n" +
                    "              }\n" +
                    "          ],\n" +
                    "          \"status\": \"available\"\n" +
                    "      }";
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }
}

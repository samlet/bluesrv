package com.bluecc.gen;

import com.google.common.base.CaseFormat;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;

import static com.google.gson.FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES;

public class Util {
    public static String arrayAwareToString(Object o) {
        final String arrayString = Arrays.deepToString(new Object[] {o});
        return arrayString.substring(1, arrayString.length() - 1);
    }

    public static String snakeToCamel(String str){
        return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, str);
    }

    public static String toSnakecase(String str){
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, str);
    }

    public static String toVarName(String str){
        return CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_CAMEL, str);
    }


    /**
     * A simpler implementation. Add null support to by registering the nullSafe() wrapped version
     * ref: https://stackoverflow.com/questions/39192945/serialize-java-8-localdate-as-yyyy-mm-dd-with-gson
     */
    private static final class LocalDateTimeAdapter extends TypeAdapter<LocalDateTime> {
        @Override
        public void write(final JsonWriter jsonWriter, final LocalDateTime localDate ) throws IOException {
            jsonWriter.value(localDate.toString());
        }

        @Override
        public LocalDateTime read( final JsonReader jsonReader ) throws IOException {
            return LocalDateTime.parse(jsonReader.nextString());
        }
    }

    public static final Gson GSON = new GsonBuilder()
            .setFieldNamingPolicy(LOWER_CASE_WITH_UNDERSCORES)
            .setDateFormat("yyyy-MM-dd HH:mm:ss")
//            .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter().nullSafe())
            .setPrettyPrinting()
            .create();

    public static void pretty(Object o){
        System.out.println(GSON.toJson(o));
    }
}

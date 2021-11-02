package com.bluecc.bluesrv;

import com.github.javafaker.Faker;
import org.junit.jupiter.api.Test;

import java.util.Locale;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestFaker {
    @Test
    public void givenJavaFakersWithSameSeed_whenNameCalled_CheckSameName() {

        Faker faker1 = new Faker(new Random(24));
        Faker faker2 = new Faker(new Random(24));

        assertEquals(faker1.name().firstName(), faker2.name().firstName());
    }

    @Test
    public void testSeeds(){
        Faker ukFaker = new Faker(new Locale("en-GB"));
        Faker usFaker = new Faker(new Locale("en-US"));
        System.out.printf("%s %s\n", usFaker.name().lastName(), usFaker.name().firstName());
        System.out.println(String.format("British postcode: %s", ukFaker.address().zipCode()));

        Pattern ukPattern = Pattern.compile(
                "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|"
                        + "(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y]"
                        + "[0-9]?[A-Za-z]))))\\s?[0-9][A-Za-z]{2})");
        Matcher ukMatcher = ukPattern.matcher(ukFaker.address().zipCode());

        assertTrue(ukMatcher.find());

        Matcher usMatcher = Pattern.compile("^\\d{5}(?:[-\\s]\\d{4})?$")
                .matcher(usFaker.address().zipCode());

        assertTrue(usMatcher.find());

        usFaker = new Faker(new Locale("zh-CN"));
        System.out.printf("%s %s\n", usFaker.name().lastName(), usFaker.name().firstName());

        // ...
        Faker faker = new Faker();

        String streetName = faker.address().streetName();
        String number = faker.address().buildingNumber();
        String city = faker.address().city();
        String country = faker.address().country();

        System.out.println(String.format("%s\n%s\n%s\n%s",
                number,
                streetName,
                city,
                country));
    }

    @Test
    public void testLorem(){
        Faker usFaker = new Faker(new Locale("en-US"));
        System.out.println(usFaker.lorem().word());

        usFaker = new Faker(new Locale("zh-CN"));
        System.out.println(usFaker.lorem().word());
    }
}

/*
⊕ [DiUS/java-faker: Brings the popular ruby faker gem to Java](https://github.com/DiUS/java-faker)
⊕ [A Guide to JavaFaker | Baeldung](https://www.baeldung.com/java-faker)
 */
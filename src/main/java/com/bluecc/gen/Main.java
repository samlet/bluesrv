package com.bluecc.gen;

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Model.CommandSpec;
import picocli.CommandLine.Parameters;
import picocli.CommandLine.ParameterException;
import picocli.CommandLine.Spec;

import java.io.File;
import java.util.Arrays;
import java.util.Locale;

/**
 * just run gen.Main language de cs en sd se
 * just run gen.Main country cn fr th ro no
 */

@Command(name = "ISOCodeResolver",
        subcommands = {
                SubcommandAsClass.class,
                CommandLine.HelpCommand.class
        },
        description = "Resolves ISO country codes (ISO-3166-1) or language codes (ISO 639-1/-2)")
public class Main {
    @Spec
    CommandSpec spec;

    @Command(name = "country", description = "Resolves ISO country codes (ISO-3166-1)")
    void subCommandViaMethod(
            @Parameters(arity = "1..*", paramLabel = "<countryCode>",
                    description = "country code(s) to be resolved") String[] countryCodes) {

        for (String code : countryCodes) {
            System.out.printf("%s: %s",
                    code.toUpperCase(), new Locale("", code).getDisplayCountry());
        }
        System.out.println();
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new Main()).execute(args);
        System.exit(exitCode);
    }
}

/**
 * $ just run gen.Main language -c de cs en sd se
 * $ just run gen.Main language -f /opt de cs en sd se
 * $ just run gen.Main language -f /opt --option 1,2 de cs en sd se
 */
@Command(name = "language",
        description = "Resolves one ore more ISO language codes (ISO-639-1 or 639-2)")
class SubcommandAsClass implements Runnable {

    @Parameters(arity = "1..*", paramLabel = "<languageCode>", description = "language code(s)")
    private String[] languageCodes;

    @CommandLine.Option(names = "-c", description = "create a new archive")
    boolean create;
    @CommandLine.Option(names = {"-f", "--file"}, paramLabel = "ARCHIVE", description = "the archive file")
    File archive;
    @CommandLine.Option(names = "--option", split = ",", defaultValue = "1,2,3")
    int[] values;

    @Override
    public void run() {
        for (String code : languageCodes) {
            System.out.printf("%s: %s",
                    code.toLowerCase(), new Locale(code).getDisplayLanguage());
        }
        System.out.println();
        System.out.println("create: " + create);
        System.out.println("file: " + (archive == null ? "no" : archive));
        System.out.println("values: " + Arrays.toString(values));
    }
}


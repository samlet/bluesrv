package com.bluecc.bluesrv;

import com.google.common.base.Charsets;
import com.google.common.collect.Maps;
import com.google.common.io.Resources;
import com.hubspot.jinjava.Jinjava;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.Map;

public class TemplateTest {
    @Test
    public void testJinja() throws IOException {
        Jinjava jinjava = new Jinjava();
        Map<String, Object> context = Maps.newHashMap();
        context.put("name", "Jared");

        String template = Resources.toString(Resources.getResource("my-template.html"), Charsets.UTF_8);

        String renderedTemplate = jinjava.render(template, context);
        System.out.println(renderedTemplate);
    }
}

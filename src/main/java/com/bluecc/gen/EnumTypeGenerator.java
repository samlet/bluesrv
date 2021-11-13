package com.bluecc.gen;

import com.beust.jcommander.internal.Lists;
import com.google.common.base.Charsets;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import com.google.common.io.Resources;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.hubspot.jinjava.Jinjava;
import lombok.Builder;
import lombok.Data;
import org.apache.commons.io.IOUtils;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.bluecc.gen.SeedReader.collectEntityData;
import static com.bluecc.gen.Util.GSON;

public class EnumTypeGenerator {
    @Data
    @Builder
    public static class TypeValue {
        String typeId;
        String parentTypeId;
        String description;
    }

    @Data
    @Builder
    public static class TypeDefinition {
        String typeName;
        String parentTypeField;
        String typeField;
        List<TypeValue> types = Lists.newArrayList();
    }

    @Data
    static class RoleType {
        String description;
        String hasTable;
        String roleTypeId;
    }

    public static void main(String[] args) throws IOException {
        String targetDir = "/opt/asset/order_proto/" + "src/main/java/com/bluecc/bluesrv/common";
        EnumTypeGenerator generator = new EnumTypeGenerator(targetDir);

        String[] dataFiles = {"PartySeedData.xml",
                "OrderSeedData.xml",
                "AccountingSeedData.xml"};
        Multimap<String, JsonObject> dataList= ArrayListMultimap.create();
        for (String dataFile : dataFiles) {
            collectEntityData(dataList, "dataset/seed/"+dataFile);
        }
        System.out.println("total: " + dataList.size());

        List<TypeDefinition> typeDefinitions = Lists.newArrayList(
                TypeDefinition.builder()
                        .typeName("RoleType")
                        .parentTypeField("parentTypeId")
                        .typeField("roleTypeId")
                        .types(Lists.newArrayList())
                        .build(),
                TypeDefinition.builder()
                        .typeName("ContactMechTypePurpose")
                        .parentTypeField("contactMechTypeId")
                        .typeField("contactMechPurposeTypeId")
                        .types(Lists.newArrayList())
                        .build(),
                TypeDefinition.builder()
                        .typeName("ContactMechType")
                        .parentTypeField("parentTypeId")
                        .typeField("contactMechTypeId")
                        .types(Lists.newArrayList())
                        .build(),
                TypeDefinition.builder()
                        .typeName("EnumerationType")
                        .parentTypeField("parentTypeId")
                        .typeField("enumTypeId")
                        .types(Lists.newArrayList())
                        .build(),
                TypeDefinition.builder()
                        .typeName("Enumeration")
                        .parentTypeField("enumTypeId")
                        .typeField("enumId")
                        .types(Lists.newArrayList())
                        .build()
        );
        for (TypeDefinition t : typeDefinitions) {
            generator.genEnumType(dataList, t);
        }
    }

    String targetDir;

    EnumTypeGenerator(String targetDir) {
        this.targetDir = targetDir;
    }

    void genEnumType(Multimap<String, JsonObject> dataList, TypeDefinition typeDefinition) throws IOException {
        // System.out.println(dataList.keySet());
        // dataList.get("RoleType").forEach(rt -> {
        //     System.out.println(rt);
        // });

        Jinjava jinjava = new Jinjava();
        String template = "{{o.description}}";

        Map<String, Object> context = Maps.newHashMap();

        dataList.get(typeDefinition.typeName).forEach(rt -> {
            typeDefinition.getTypes()
                    .add(TypeValue.builder()
                            .description(ensure(rt, "description"))
                            .typeId(ensure(rt, typeDefinition.typeField))
                            .parentTypeId(ensure(rt, typeDefinition.parentTypeField))
                            .build());
        });
        context.put("o", dataList.get(typeDefinition.typeName).stream()
                .map(e -> GSON.fromJson(e, RoleType.class))
                .findFirst().get());
        context.put("e", typeDefinition);
        String renderedTemplate = jinjava.render(template, context);
        System.out.println("out: " + renderedTemplate);

        // System.out.println(genTypeClass(dataList.get("RoleType").stream().findFirst().get()));

        String tplSource = "enum_source.j2";
        template = Resources.toString(Resources
                        .getResource("templates/" + tplSource),
                Charsets.UTF_8);
        renderedTemplate = jinjava.render(template, context);
        System.out.println("out: \n" + renderedTemplate);

        FileWriter writer = new FileWriter(String.format("%s/%s.java", targetDir, typeDefinition.typeName));
        IOUtils.write(renderedTemplate, writer);
        writer.close();
    }

    static String ensure(JsonObject o, String attr) {
        if(attr==null||attr.isEmpty()){
            return "";
        }
        JsonElement val = o.get(attr);
        return val == null ? "" : val.getAsString();
    }

    static String genTypeClass(JsonObject o) {
        String result = o.keySet().stream()
                .map(key -> String.format("String %s; ", key))
                .collect(Collectors.joining(" "));
        return String.format("@Data static class RoleType{ %s }", result);
    }
}

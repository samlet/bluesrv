package com.bluecc.gen;

import com.beust.jcommander.internal.Lists;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.Multimaps;
import com.google.common.collect.Sets;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.*;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static com.bluecc.gen.Util.GSON;
import static com.bluecc.gen.Util.pretty;

public class SeedReader {

    public static void main(String[] args) throws Exception {
        String dataFile = "dataset/OrderDemoData.xml";
        Set<String> nameSet = collectEntityNames(dataFile);

        // entity types
        System.out.println("total entity types: "+nameSet.size());
        System.out.println(GSON.toJson(nameSet));

        // collect data
        Multimap<String, JsonObject> dataList=collectEntityData(dataFile);
        // dataList.forEach(e -> System.out.println(e));
        for (String key : dataList.keySet()) {
            System.out.println(key+":");
            for (JsonObject jsonObject : dataList.get(key)) {
                pretty(jsonObject);
            }
        }
    }

    public static Set<String> collectEntityNames(String dataFile)  {
        NodeList nodeList = getNodeList(dataFile);
        Set<String> nameSet= Sets.newHashSet();
        for(int i=0;i<nodeList.getLength();++i){
            if (nodeList.item(i) instanceof Element){
                Element element=(Element) nodeList.item(i);
                nameSet.add(element.getTagName());
            }
        }
        return nameSet;
    }

    public static Multimap<String, JsonObject> collectEntityData(String dataFile) {
        // List<JsonObject> rs= Lists.newArrayList();
        Multimap<String, JsonObject> rs= ArrayListMultimap.create();
        NodeList nodeList = getNodeList(dataFile);
        for(int i=0;i<nodeList.getLength();++i){
            if (nodeList.item(i) instanceof Element){
                Element element=(Element) nodeList.item(i);
                rs.put(element.getTagName(), convertElement(element));
            }
        }
        return rs;
    }

    private static JsonObject convertElement(Element element) {
        JsonObject jsonObject=new JsonObject();
        NamedNodeMap attrs=element.getAttributes();
        for(int i=0;i<attrs.getLength();++i){
            Node node=attrs.item(i);
            jsonObject.addProperty(node.getNodeName(), node.getNodeValue());
        }
        return jsonObject;
    }

    private static NodeList getNodeList(String dataFile)  {
        try {
            // Get Document Builder
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            // Build Document
            Document document = builder.parse(new File(dataFile));

            // Normalize the XML Structure; It's just too important !!
            document.getDocumentElement().normalize();

            // Here comes the root node
            Element root = document.getDocumentElement();
            // System.out.println(root.getNodeName());
            return root.getChildNodes();
        }catch (Exception e ){
            throw new RuntimeException(e.getMessage(), e);
        }
    }
}

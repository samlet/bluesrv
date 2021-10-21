package com.bluecc.clickhouse;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ClickHouseLoader {
    public static void main(String[] args) throws IOException, SQLException {
        initDataSource();

        String[] tableNames= {"cart_info", "order_info", "payment_info"};
        for (String tableName : tableNames) {
            createTable(tableName);
        }


    }

    private static void createTable(String tableName) throws IOException, SQLException {
        String sqlCreate = FileUtils.readFileToString(
                new File("maintain/init_script/gmall/"+ tableName +".sql"), "UTF-8");
        createTable(tableName, sqlCreate, true);
    }

    private static void createTable(String tableName, String sqlCreate, boolean dropIt) throws SQLException {
        System.out.println(sqlCreate);
        try (Connection connection = getConnection()) {
            try (Statement stmt = connection.createStatement()) {
                if(dropIt) {
                    try (ResultSet rs = stmt.executeQuery("drop table if exists " + tableName)) {
                        System.out.println(rs.next());
                    }
                }
                try (ResultSet rs = stmt.executeQuery(sqlCreate)) {
                    System.out.println(rs.next());
                }
            }
        }
    }

    static HikariDataSource ds;

    static void initDataSource() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:clickhouse://127.0.0.1:9000/gmall");
        config.setDriverClassName("com.github.housepower.jdbc.ClickHouseDriver");
        config.setUsername("default");
        config.setPassword("");
//        config.addDataSourceProperty("cachePrepStmts", "true");
//        config.addDataSourceProperty("prepStmtCacheSize", "250");
//        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

        ds = new HikariDataSource(config);
    }

    private static Connection getConnection() throws SQLException {
//        return DriverManager.getConnection("jdbc:clickhouse://127.0.0.1:9000");
        return ds.getConnection();
    }
}

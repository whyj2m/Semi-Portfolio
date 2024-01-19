package com.imfreepass.prj.util;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.imfreepass.prj.mapper.BoardMapper;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import net.sf.log4jdbc.sql.jdbcapi.DriverSpy;

public class MybatisUtils {
	private static DataSource dataSource() {
		try{
			Class.forName("org.mariadb.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		config.setJdbcUrl("jdbc:log4jdbc:mariadb://jumin.site:3306/semi_jeju");
		config.setUsername("jeju");
		config.setPassword("0902");
		config.setMinimumIdle(1);
        config.setMaximumPoolSize(3);
        config.setConnectionTimeout(3000);
        config.setValidationTimeout(3000);
        config.setMaxLifetime(30000);
		return new HikariDataSource(config); 
	}
	
	public static SqlSessionFactory sessionFactory() {
		DataSource dataSource = dataSource();
		TransactionFactory transactionFactory = new JdbcTransactionFactory();
		Environment environment = new Environment("development", transactionFactory, dataSource);
		Configuration configuration = new Configuration(environment);
		configuration.addMappers("com.imfreepass.prj.mapper");
		configuration.getTypeAliasRegistry().registerAliases("com.imfreepass.prj.domain");
//		configuration.addMapper(BlogMapper.class);
		return new SqlSessionFactoryBuilder().build(configuration);
	}
	
}

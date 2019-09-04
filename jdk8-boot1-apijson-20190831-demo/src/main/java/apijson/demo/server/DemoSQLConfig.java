/*Copyright ©2016 TommyLemon(https://github.com/TommyLemon/APIJSON)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.*/

package apijson.demo.server;

import static zuo.biao.apijson.JSONObject.KEY_ID;
import static zuo.biao.apijson.JSONObject.KEY_USER_ID;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

import apijson.demo.server.model.Privacy;
import apijson.demo.server.model.User;
import zuo.biao.apijson.RequestMethod;
import zuo.biao.apijson.server.AbstractSQLConfig;
import zuo.biao.apijson.server.Join;
import zuo.biao.apijson.server.SQLConfig;


/**SQL配置
 * TiDB 用法和 MySQL 一致
 * @author Lemon
 */
public class DemoSQLConfig extends AbstractSQLConfig {


	public static final Callback SIMPLE_CALLBACK;


	static {
		//TODO 默认模式名，改成你自己的
		DEFAULT_SCHEMA = "apijson_demo";

		//表名映射，隐藏真实表名，对安全要求很高的表可以这么做
		TABLE_KEY_MAP.put(User.class.getSimpleName(), "apijson_user");
		TABLE_KEY_MAP.put(Privacy.class.getSimpleName(), "apijson_privacy");

		//主键名映射
		SIMPLE_CALLBACK = new SimpleCallback() {

			@Override
			public AbstractSQLConfig getSQLConfig(RequestMethod method, String database, String schema, String table) {
				return new DemoSQLConfig(method, table);
			}

			//取消注释来实现自定义各个表的主键名
			//			@Override
			//			public String getIdKey(String database, String schema, String table) {
			//				return StringUtil.firstCase(table + "Id");  // userId, comemntId ...
			//				//		return StringUtil.toLowerCase(t) + "_id";  // user_id, comemnt_id ...
			//				//		return StringUtil.toUpperCase(t) + "_ID";  // USER_ID, COMMENT_ID ...
			//			}

			@Override
			public String getUserIdKey(String database, String schema, String table) {
				return Controller.USER_.equals(table) || Controller.PRIVACY_.equals(table) ? KEY_ID : KEY_USER_ID; // id / userId
			}

		};
	}

	//取消注释后，默认的数据库类型会由 MySQL 改为 PostgreSQL
	//	@Override
	//	public String getDatabase() {
	//		String db = super.getDatabase();
	//		return db == null ? DATABASE_POSTGRESQL : db;
	//	}

	@Override
	public String getDBVersion() {
		return "5.7.22"; //"8.0.11"; //TODO 改成你自己的 MySQL 或 PostgreSQL 数据库版本号 //MYSQL 8 和 7 使用的 JDBC 配置不一样
	}

	@Override
	public String getDBUri() {
        System.out.println(getDatabase());

		//TODO 改成你自己的，TiDB 默认端口为 4000
		return DATABASE_POSTGRESQL.equalsIgnoreCase(getDatabase()) ? "jdbc:postgresql://localhost:5432/postgres" : "jdbc:mysql://localhost:3306";
	}
	@Override
	public String getDBAccount() {
		return DATABASE_POSTGRESQL.equalsIgnoreCase(getDatabase()) ? "postgres" : "root"; //TODO 改成你自己的
	}
	@Override
	public String getDBPassword() {
		return DATABASE_POSTGRESQL.equalsIgnoreCase(getDatabase()) ? "123456" : "123456"; //TODO 改成你自己的，TiDB 默认密码为空字符串 ""
	}


	@Override
	public String getIdKey() {
		return SIMPLE_CALLBACK.getIdKey(getDatabase(), getSchema(), getTable());
	}

	@Override
	public String getUserIdKey() {
		return SIMPLE_CALLBACK.getUserIdKey(getDatabase(), getSchema(), getTable());
	}


	public DemoSQLConfig() {
		this(RequestMethod.GET);
	}
	public DemoSQLConfig(RequestMethod method) {
		super(method);
	}
	public DemoSQLConfig(RequestMethod method, String table) {
		super(method, table);
	}
	public DemoSQLConfig(RequestMethod method, int count, int page) {
		super(method, count, page);
	}



	/**获取SQL配置
	 * @param table
	 * @param alias
	 * @param request
	 * @param isProcedure
	 * @return
	 * @throws Exception
	 */
	public static SQLConfig newSQLConfig(RequestMethod method, String table, String alias, JSONObject request, List<Join> joinList, boolean isProcedure) throws Exception {
		return newSQLConfig(method, table, alias, request, joinList, isProcedure, SIMPLE_CALLBACK);
	}


}

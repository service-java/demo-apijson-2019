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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import apijson.demo.server.model.BaseModel;
import apijson.demo.server.model.Comment;
import zuo.biao.apijson.JSONResponse;
import zuo.biao.apijson.Log;
import zuo.biao.apijson.RequestMethod;
import zuo.biao.apijson.RequestRole;
import zuo.biao.apijson.StringUtil;
import zuo.biao.apijson.server.Function;
import zuo.biao.apijson.server.JSONRequest;
import zuo.biao.apijson.server.NotNull;


/**可远程调用的函数类
 * @author Lemon
 */
public class DemoFunction extends Function implements FunctionList {
	private static final String TAG = "DemoFunction";

	private final HttpSession session;
	public DemoFunction(HttpSession session) {
		this.session = session;
	}

	public static void test() throws Exception {
		int i0 = 1, i1 = -2;
		JSONObject request = new JSONObject(); 
		request.put("id", 10);
		request.put("i0", i0);
		request.put("i1", i1);
		JSONArray arr = new JSONArray();
		arr.add(new JSONObject());
		request.put("arr", arr);

		JSONArray array = new JSONArray();
		array.add(1);//new JSONObject());
		array.add(2);//new JSONObject());
		array.add(4);//new JSONObject());
		array.add(10);//new JSONObject());
		request.put("array", array);

		request.put("position", 1);
		request.put("@position", 0);

		request.put("key", "key");
		JSONObject object = new JSONObject();
		object.put("key", true);
		request.put("object", object);


		Log.i(TAG, "plus(1,-2) = " + new DemoFunction(null).invoke(request, "plus(i0,i1)"));
		Log.i(TAG, "count([1,2,4,10]) = " + new DemoFunction(null).invoke(request, "countArray(array)"));
		Log.i(TAG, "isContain([1,2,4,10], 10) = " + new DemoFunction(null).invoke(request, "isContain(array,id)"));
		Log.i(TAG, "getFromArray([1,2,4,10], 0) = " + new DemoFunction(null).invoke(request, "getFromArray(array,@position)"));
		Log.i(TAG, "getFromObject({key:true}, key) = " + new DemoFunction(null).invoke(request, "getFromObject(object,key)"));

	}




	/**反射调用
	 * @param request
	 * @param function 例如get(object,key)，参数只允许引用，不能直接传值
	 * @return
	 */
	public Object invoke(JSONObject request, String function) throws Exception {
		//TODO  不允许调用invoke，避免死循环
		//		if (function.startsWith("invoke(")) {
		//			
		//		}
		return invoke(this, request, function);
	}



	/**
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Object verifyIdList(@NotNull JSONObject request, @NotNull String idList) throws Exception {
		Object obj = request.get(idList);
		if (obj instanceof Collection == false) {
			throw new IllegalArgumentException(idList + " 不符合 Array 类型! 结构必须是 [] ！");
		}
		JSONArray array = (JSONArray) obj;
		if (array != null) {
			for (int i = 0; i < array.size(); i++) {
				if (array.get(i) instanceof Long == false && array.get(i) instanceof Integer == false) {
					throw new IllegalArgumentException(idList + " 内字符 " + array.getString(i) + " 不符合 Long 类型!");
				}
			}
		}
		return null;
	}


	/**
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Object verifyURLList(@NotNull JSONObject request, @NotNull String urlList) throws Exception {
		Object obj = request.get(urlList);
		if (obj instanceof Collection == false) {
			throw new IllegalArgumentException(urlList + " 不符合 Array 类型! 结构必须是 [] ！");
		}
		JSONArray array = (JSONArray) obj;
		if (array != null) {
			for (int i = 0; i < array.size(); i++) {
				if (StringUtil.isUrl(array.getString(i)) == false) {
					throw new IllegalArgumentException(urlList + " 内字符 " + array.getString(i) + " 不符合 URL 格式!");
				}
			}
		}
		return null;
	}

	/**判断array是否为空
	 * @param request
	 * @param array
	 * @return
	 */
	public int deleteChildComment(@NotNull JSONObject rq, @NotNull String toId) throws Exception {
		long tid = rq.getLongValue(toId);
		if (tid <= 0 || rq.getIntValue(JSONResponse.KEY_COUNT) <= 0) {
			return 0;
		}

		//递归获取到全部子评论id
		
		JSONRequest request = new JSONRequest();
		
		//Comment<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		JSONRequest comment = new JSONRequest();
		comment.put("id{}", getChildCommentIdList(tid));
		request.put("Comment", comment);
		
		//Comment>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

		JSONObject rp = new DemoParser(RequestMethod.DELETE).setNoVerify(true).parseResponse(request);
		
		JSONObject c = rp.getJSONObject("Comment");
		return c == null ? 0 : c.getIntValue(JSONResponse.KEY_COUNT);
	}


	private JSONArray getChildCommentIdList(long tid) {
		
		JSONArray arr = new JSONArray();
		
		JSONRequest request = new JSONRequest();
		
		//Comment-id[]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		JSONRequest idItem = new JSONRequest();
		
		//Comment<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		JSONRequest comment = new JSONRequest();
		comment.put("toId", tid);
		comment.setColumn("id");
		idItem.put("Comment", comment);
		//Comment>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		
		request.putAll(idItem.toArray(0, 0, "Comment-id"));
		//Comment-id[]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		
		JSONObject rp = new DemoParser().setNoVerify(true).parseResponse(request);

		JSONArray a = rp.getJSONArray("Comment-id[]");
		if (a != null) {
			arr.addAll(a);
			
			JSONArray a2;
			for (int i = 0; i < a.size(); i++) {
				
				a2 = getChildCommentIdList(a.getLongValue(i));
				if (a2 != null) {
					arr.addAll(a2);
				}
			}
		}
		
		return arr;
	}
	

	/**TODO 仅用来测试 "key-()":"getIdList()" 和 "key()":"getIdList()"
	 * @param request
	 * @return JSONArray 只能用JSONArray，用long[]会在SQLConfig解析崩溃
	 * @throws Exception
	 */
	public JSONArray getIdList(@NotNull JSONObject request) throws Exception {
		return new JSONArray(new ArrayList<Object>(Arrays.asList(12, 15, 301, 82001, 82002, 38710)));
	}


	/**TODO 仅用来测试 "key-()":"verifyAccess()"
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Object verifyAccess(@NotNull JSONObject request) throws Exception {
		long userId = request.getLongValue(zuo.biao.apijson.JSONObject.KEY_USER_ID);
		RequestRole role = RequestRole.get(request.getString(zuo.biao.apijson.JSONObject.KEY_ROLE));
		if (role == RequestRole.OWNER && userId != DemoVerifier.getVisitorId(session)) {
			throw new IllegalAccessException("登录用户与角色OWNER不匹配！");
		}
		return null;
	}





	public double plus(@NotNull JSONObject request, String i0, String i1) {
		return request.getDoubleValue(i0) + request.getDoubleValue(i1);
	}
	public double minus(@NotNull JSONObject request, String i0, String i1) {
		return request.getDoubleValue(i0) - request.getDoubleValue(i1);
	}
	public double multiply(@NotNull JSONObject request, String i0, String i1) {
		return request.getDoubleValue(i0) * request.getDoubleValue(i1);
	}
	public double divide(@NotNull JSONObject request, String i0, String i1) {
		return request.getDoubleValue(i0) / request.getDoubleValue(i1);
	}

	//判断是否为空 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	/**判断array是否为空
	 * @param request
	 * @param array
	 * @return
	 */
	@Override
	public boolean isArrayEmpty(@NotNull JSONObject request, String array) {
		return BaseModel.isEmpty(request.getJSONArray(array));
	}
	/**判断object是否为空
	 * @param request
	 * @param object
	 * @return
	 */
	@Override
	public boolean isObjectEmpty(@NotNull JSONObject request, String object) {
		return BaseModel.isEmpty(request.getJSONObject(object)); 
	}
	//判断是否为空 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	//判断是否为包含 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	/**判断array是否包含value
	 * @param request
	 * @param array
	 * @param value
	 * @return
	 */
	@Override
	public boolean isContain(@NotNull JSONObject request, String array, String value) {
		//解决isContain((List<Long>) [82001,...], (Integer) 82001) == false及类似问题, list元素可能是从数据库查到的bigint类型的值
		//		return BaseModel.isContain(request.getJSONArray(array), request.get(value));

		//不用准确的的 request.getString(value).getClass() ，因为Long值转Integer崩溃，而且转成一种类型本身就和字符串对比效果一样了。
		List<String> list = com.alibaba.fastjson.JSON.parseArray(request.getString(array), String.class);
		return list != null && list.contains(request.getString(value));
	}
	/**判断object是否包含key
	 * @param request
	 * @param object
	 * @param key
	 * @return
	 */
	@Override
	public boolean isContainKey(@NotNull JSONObject request, String object, String key) { 
		return BaseModel.isContainKey(request.getJSONObject(object), request.getString(key)); 
	}
	/**判断object是否包含value
	 * @param request
	 * @param object
	 * @param value
	 * @return
	 */
	@Override
	public boolean isContainValue(@NotNull JSONObject request, String object, String value) { 
		return BaseModel.isContainValue(request.getJSONObject(object), request.get(value));
	}
	//判断是否为包含 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>


	//获取集合长度 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	/**获取数量
	 * @param request
	 * @param array
	 * @return
	 */
	@Override
	public int countArray(@NotNull JSONObject request, String array) { 
		return BaseModel.count(request.getJSONArray(array)); 
	}
	/**获取数量
	 * @param request
	 * @param object
	 * @return
	 */
	@Override
	public int countObject(@NotNull JSONObject request, String object) {
		return BaseModel.count(request.getJSONObject(object)); 
	}
	//获取集合长度 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>


	//根据键获取值 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	/**获取
	 ** @param request
	 * @param array
	 * @param position
	 * @return
	 */
	@Override
	public Object getFromArray(@NotNull JSONObject request, String array, String position) { 
		return BaseModel.get(request.getJSONArray(array), request.getIntValue(position)); 
	}
	/**获取
	 * @param request
	 * @param object
	 * @param key
	 * @return
	 */
	@Override
	public Object getFromObject(@NotNull JSONObject request, String object, String key) { 
		return BaseModel.get(request.getJSONObject(object), request.getString(key));
	}
	//根据键获取值 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>



	//获取非基本类型对应基本类型的非空值 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	/**获取非空值
	 * @param request
	 * @param value
	 * @return
	 */
	@Override
	public boolean booleanValue(@NotNull JSONObject request, String value) { 
		return request.getBooleanValue(value);
	}
	/**获取非空值
	 * @param request
	 * @param value
	 * @return
	 */
	@Override
	public int intValue(@NotNull JSONObject request, String value) {  
		return request.getIntValue(value);
	}
	/**获取非空值
	 * @param request
	 * @param value
	 * @return
	 */
	@Override
	public long longValue(@NotNull JSONObject request, String value) {   
		return request.getLongValue(value);
	}
	/**获取非空值
	 * @param request
	 * @param value
	 * @return
	 */
	@Override
	public float floatValue(@NotNull JSONObject request, String value) {  
		return request.getFloatValue(value);
	}
	/**获取非空值
	 * @param request
	 * @param value
	 * @return
	 */
	@Override
	public double doubleValue(@NotNull JSONObject request, String value) {    
		return request.getDoubleValue(value); 
	}
	//获取非基本类型对应基本类型的非空值 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>




}
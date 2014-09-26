/**
 * Copyright 1996-2014 FoxBPM ORG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author demornain
 */
package org.foxbpm.calendar.service.calendar;

import java.net.URLDecoder;
import java.util.Map;
import java.util.Set;

import org.foxbpm.calendar.mybatis.entity.CalendarPartEntity;
import org.foxbpm.calendar.rest.common.AbstractRestResource;
import org.foxbpm.calendar.rest.common.DataResult;
import org.foxbpm.calendar.rest.common.RestConstants;
import org.foxbpm.calendar.service.WorkCalendarService;
import org.foxbpm.engine.ProcessEngineManagement;
import org.foxbpm.engine.impl.util.StringUtil;
import org.restlet.data.Form;
import org.restlet.representation.Representation;
import org.restlet.resource.Get;
import org.restlet.resource.Post;

public class CalendarPartCollectionResource extends AbstractRestResource{
	@Get
	public DataResult getCalendarParts(){
		
		Form queryForm = getQuery();
		Set<String> queryNames = queryForm.getNames();
		
		String id = StringUtil.getString(getQueryParameter("id", queryForm));
		
		String idLike = null;
		if (StringUtil.isNotEmpty(id)) {
			idLike = "%" + id + "%";
		}
		
		if (queryNames.contains(RestConstants.PAGE_START)) {
			if (queryNames.contains(RestConstants.PAGE_LENGTH)) {
				pageSize = StringUtil.getInt(getQueryParameter(RestConstants.PAGE_LENGTH, queryForm));
			}
			pageIndex = StringUtil.getInt(getQueryParameter(RestConstants.PAGE_START, queryForm)) / pageSize + 1;
		}
		
		if (queryNames.contains(RestConstants.PAGE_INDEX)) {
			pageIndex = StringUtil.getInt(getQueryParameter(RestConstants.PAGE_INDEX, queryForm));
		}
		if (queryNames.contains(RestConstants.PAGE_SIZE)) {
			pageSize = StringUtil.getInt(getQueryParameter(RestConstants.PAGE_SIZE, queryForm));
		}
		
		if(!validationUser())
			return null;
		
		WorkCalendarService workCalendarService = ProcessEngineManagement.getDefaultProcessEngine().getService(WorkCalendarService.class);
		
		DataResult result = new DataResult();
		result.setData(workCalendarService.getCalendarPart(pageIndex, pageSize, idLike));
		result.setPageIndex(pageIndex);
		result.setPageSize(pageSize);
		result.setRecordsTotal(workCalendarService.getCalendarPartCount(idLike));
		result.setRecordsFiltered(workCalendarService.getCalendarPartCount(idLike));
		return result;
	}
	
	@SuppressWarnings("deprecation")
	@Post
	public void addCalendarPart(Representation entity) {
		// 获取参数
//		String id = getAttribute("id");
		Map<String, String> paramsMap = getRequestParams(entity);
		String id = URLDecoder.decode(paramsMap.get("id"));
		String amorpm = URLDecoder.decode(paramsMap.get("amorpm"));
		String starttime = URLDecoder.decode(paramsMap.get("starttime"));
		String endtime = URLDecoder.decode(paramsMap.get("endtime"));
		String ruleid = URLDecoder.decode(paramsMap.get("ruleid"));
		if (StringUtil.isNotEmpty(id)) {
			CalendarPartEntity calendarPartEntity = new CalendarPartEntity(id);
			if (StringUtil.isNotEmpty(amorpm)) {
				calendarPartEntity.setAmorpm(Integer.valueOf(amorpm));
			}
			if (StringUtil.isNotEmpty(starttime)) {
				calendarPartEntity.setStarttime(starttime);
			}
			if (StringUtil.isNotEmpty(endtime)) {
				calendarPartEntity.setEndtime(endtime);
			}
			if (StringUtil.isNotEmpty(ruleid)) {
				calendarPartEntity.setRuleid(ruleid);
			}
			// 获取服务
			WorkCalendarService workCalendarService = ProcessEngineManagement.getDefaultProcessEngine().getService(WorkCalendarService.class);
			// 构造用户信息
			workCalendarService.addCalendarPart(calendarPartEntity);
		}
	}
}

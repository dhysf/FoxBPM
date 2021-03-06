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
 * @author kenshin
 */
package org.foxbpm.social.impl.entity;

import java.io.Serializable;

/**
 * 社交用户关系表
 * 
 * @author kenshin
 * 
 */
public class SocialUserRelation implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 用户编号 */
	private String userId;
	/** 引用的用户编号 */
	private String relUserId;
	/** 引用类型 0粉丝 1关注 */
	private int type = 0;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRelUserId() {
		return relUserId;
	}

	public void setRelUserId(String relUserId) {
		this.relUserId = relUserId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
